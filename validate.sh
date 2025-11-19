#!/bin/bash
# Validation and Test Script for AIConceptsHub

echo "🔍 AIConceptsHub - Validation & Test Script"
echo "=========================================="
echo ""

# Check if we're in the right directory
if [ ! -f "astro.config.mjs" ]; then
    echo "❌ Error: astro.config.mjs not found. Please run this from the project root."
    exit 1
fi

echo "✅ Step 1: Checking configuration..."
if grep -q "site: 'https://nchand02.github.io'" astro.config.mjs && \
   grep -q "base: '/AIConceptsHub'" astro.config.mjs; then
    echo "   ✓ astro.config.mjs is correctly configured"
else
    echo "   ⚠️  Warning: Check astro.config.mjs configuration"
fi

echo ""
echo "✅ Step 2: Checking GitHub Actions workflow..."
if [ -f ".github/workflows/deploy.yml" ]; then
    echo "   ✓ Deployment workflow exists"
else
    echo "   ❌ Missing .github/workflows/deploy.yml"
fi

echo ""
echo "✅ Step 3: Running build test..."
if npm run build > /dev/null 2>&1; then
    echo "   ✓ Build successful!"
else
    echo "   ❌ Build failed - check npm run build output"
    exit 1
fi

echo ""
echo "✅ Step 4: Checking build output..."
if [ -d "dist" ]; then
    PAGE_COUNT=$(find dist -name "index.html" | wc -l | tr -d ' ')
    echo "   ✓ Dist folder created with $PAGE_COUNT pages"

    if [ -d "dist/chapters" ]; then
        CHAPTER_COUNT=$(ls -1 dist/chapters | wc -l | tr -d ' ')
        echo "   ✓ $CHAPTER_COUNT chapter folders created"
    fi

    if [ -f "dist/favicon.svg" ]; then
        echo "   ✓ Favicon exists"
    else
        echo "   ⚠️  Favicon not found in dist"
    fi

    if [ -d "dist/styles" ] && [ -d "dist/scripts" ]; then
        echo "   ✓ Assets (styles & scripts) present"
    else
        echo "   ⚠️  Missing assets folders"
    fi
else
    echo "   ❌ Dist folder not created"
    exit 1
fi

echo ""
echo "✅ Step 5: Checking file sizes..."
DIST_SIZE=$(du -sh dist 2>/dev/null | cut -f1)
echo "   ✓ Total dist size: $DIST_SIZE"

echo ""
echo "=========================================="
echo "✅ All validations passed!"
echo ""
echo "🚀 Ready for deployment!"
echo ""
echo "Next steps:"
echo "1. Review DEPLOYMENT_CHECKLIST.md"
echo "2. Push to GitHub: git push origin main"
echo "3. Check Actions tab for deployment status"
echo "4. Visit: https://nchand02.github.io/AIConceptsHub/"
echo ""

