# AI Learning Portal 🚀

A comprehensive, interactive educational website covering all major concepts in Artificial Intelligence and Generative AI. Built with **Astro** for optimal performance and deployed on GitHub Pages.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Astro](https://img.shields.io/badge/Astro-4.0-orange.svg)
![Status](https://img.shields.io/badge/status-active-success.svg)

## 🌟 Features

- **15 Comprehensive Chapters** covering AI from foundations to advanced topics
- **Responsive Design** - works beautifully on mobile, tablet, and desktop
- **Dark Mode** - automatic theme switching with localStorage persistence
- **Interactive Elements** - collapsible sections, code examples, diagrams
- **Mermaid Diagrams** - client-side rendering of architecture diagrams
- **Search Functionality** - find content quickly
- **Fast Performance** - static site generation with Astro
- **Zero JavaScript Frameworks** - pure static HTML/CSS/JS output

## 📚 Chapter Overview

1. **Foundations of AI** - History, core concepts, and problem-solving approaches
2. **Machine Learning** - Supervised, unsupervised, and reinforcement learning
3. **Deep Learning** - Neural networks, CNNs, RNNs, and training techniques
4. **Transformers** - Attention mechanisms and the architecture powering modern AI
5. **Large Language Models** - GPT, BERT, Claude, and emergent abilities
6. **Generative AI** - GANs, VAEs, diffusion models, and image generation
7. **Embeddings & Vector Databases** - Semantic search and similarity
8. **RAG Systems** - Retrieval-Augmented Generation for grounded AI
9. **Fine-Tuning** - PEFT, LoRA, and model customization
10. **Multimodal AI** - Vision-language models and cross-modal understanding
11. **AI Agents & MCP** - Autonomous agents and Model Context Protocol
12. **AI Tooling** - LangChain, LlamaIndex, and development frameworks
13. **AI Infrastructure** - Training, inference optimization, and deployment
14. **System Design** - Building production AI systems
15. **Glossary** - Comprehensive terminology reference

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ (LTS recommended)
- npm or yarn package manager

### Installation

```bash
# Clone the repository
git clone https://github.com/nchand02/AIConceptsHub.git
cd AIConceptsHub

# Install dependencies
npm install

# Start development server
npm run dev
```

The site will be available at `http://localhost:4321`

### Build for Production

```bash
# Build static site
npm run build

# Preview production build
npm run preview
```

The built site will be in the `dist/` directory, ready for deployment.

## 📦 Deployment to GitHub Pages

### Option 1: GitHub Actions (Recommended)

1. **Create `.github/workflows/deploy.yml`:**

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build site
        run: npm run build
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: ./dist

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v3
```

2. **Configure Repository Settings:**
   - Go to Settings → Pages
   - Source: GitHub Actions
   - Save

3. **Push to main branch:**
```bash
git add .
git commit -m "Deploy to GitHub Pages"
git push origin main
```

### Option 2: Manual Deployment

```bash
# Build the site
npm run build

# Deploy to gh-pages branch
npm install -g gh-pages
gh-pages -d dist
```

### Update astro.config.mjs

Make sure your `astro.config.mjs` has the correct `base` path:

```javascript
export default defineConfig({
  site: 'https://nchand02.github.io',
  base: '/AIConceptsHub',
});
```

## 🎨 Customization

### Theme Colors

Edit `public/styles/global.css` to customize colors:

```css
:root {
  --color-primary: #3b82f6;  /* Blue */
  --color-secondary: #8b5cf6; /* Purple */
  /* ... more variables */
}
```

### Adding New Chapters

1. Create new file in `src/pages/chapters/`:
```astro
---
import BaseLayout from '../../layouts/BaseLayout.astro';
---

<BaseLayout title="Your Chapter" currentPage="/chapters/your-chapter">
  <article>
    <h1>Your Chapter Title</h1>
    <!-- Content here -->
  </article>
</BaseLayout>
```

2. Update the chapters array in `src/layouts/BaseLayout.astro`

### Content Formatting

Use these components for rich content:

```html
<!-- Callout boxes -->
<div class="callout info">
  <div class="callout-title">💡 Note</div>
  <p>Important information</p>
</div>

<!-- Collapsible sections -->
<div class="collapsible">
  <div class="collapsible-header">
    <span>Click to expand</span>
    <span class="collapsible-icon">▼</span>
  </div>
  <div class="collapsible-content">
    Hidden content
  </div>
</div>

<!-- Mermaid diagrams -->
<div class="diagram-container">
  <pre class="mermaid">
graph LR
  A[Start] --> B[End]
  </pre>
</div>
```

## 🛠️ Technology Stack

- **Astro 4.0** - Static site generator
- **HTML5 / CSS3** - Markup and styling
- **Vanilla JavaScript** - Interactivity
- **Mermaid.js** - Diagram rendering
- **GitHub Pages** - Hosting

## 📖 Usage Tips

### Navigation
- Use sidebar to jump between chapters
- Click headings to get anchor links
- Use search (⌘K / Ctrl+K) to find content

### Reading Mode
- Toggle dark mode with the theme button
- All content is mobile-responsive
- Reading progress indicator at top

### Learning Path
- Follow chapters sequentially for comprehensive understanding
- Each chapter has review questions and exercises
- Deep dive sections for advanced topics

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Content Guidelines

- Use clear, accessible language
- Include code examples where applicable
- Add diagrams for complex concepts
- Provide references and further reading
- Test responsive design

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by the AI/ML education community
- Built with amazing open-source tools
- Thanks to all contributors

## 📞 Contact

- **Issues**: [GitHub Issues](https://github.com/nchand02/AIConceptsHub/issues)
- **Discussions**: [GitHub Discussions](https://github.com/nchand02/AIConceptsHub/discussions)

## 🗺️ Roadmap

- [ ] Add interactive code playgrounds
- [ ] Video content integration
- [ ] Practice problems with solutions
- [ ] Quiz system for each chapter
- [ ] Community contributions
- [ ] Multiple language support

---

**Built with ❤️ for the AI learning community**

For detailed documentation, visit [the wiki](https://github.com/nchand02/AIConceptsHub/wiki).
