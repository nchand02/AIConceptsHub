#!/usr/bin/env python3
"""Fix mermaid diagrams in Astro files by wrapping them with set:html."""

import re
import sys
from pathlib import Path

def fix_mermaid_diagrams(content):
    """Fix mermaid diagrams by wrapping them with set:html."""

    # Pattern to match mermaid blocks that are not already wrapped
    pattern = r'<pre class="mermaid">\n(.*?)</pre>'

    def replace_mermaid(match):
        mermaid_content = match.group(1)
        # Remove trailing whitespace from each line but preserve structure
        lines = mermaid_content.rstrip().split('\n')
        # Remove common leading whitespace
        if lines:
            # Find minimum indentation
            min_indent = min((len(line) - len(line.lstrip()) for line in lines if line.strip()), default=0)
            # Remove that indentation
            cleaned_lines = [line[min_indent:] if line.strip() else '' for line in lines]
            cleaned_content = '\n'.join(cleaned_lines)
        else:
            cleaned_content = mermaid_content

        return f'<pre class="mermaid" set:html={{`{cleaned_content}`}} />'

    # Replace all non-wrapped mermaid diagrams
    fixed_content = re.sub(pattern, replace_mermaid, content, flags=re.DOTALL)

    return fixed_content

def main():
    # Find all .astro files in src/pages/chapters
    chapters_dir = Path('src/pages/chapters')

    if not chapters_dir.exists():
        print(f"Directory {chapters_dir} not found")
        return 1

    for astro_file in chapters_dir.glob('*.astro'):
        print(f"Processing {astro_file}...")

        # Read file
        content = astro_file.read_text()

        # Skip if already has set:html for all mermaid
        if '<pre class="mermaid">\n' not in content:
            print(f"  Skipping {astro_file} - already fixed or no mermaid diagrams")
            continue

        # Fix content
        fixed_content = fix_mermaid_diagrams(content)

        # Write back
        astro_file.write_text(fixed_content)
        print(f"  Fixed {astro_file}")

    print("Done!")
    return 0

if __name__ == '__main__':
    sys.exit(main())

