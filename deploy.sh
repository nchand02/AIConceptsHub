#!/bin/bash

# 🚀 AI Learning Portal - Deployment Script
# This script prepares and deploys the site to GitHub Pages

set -e  # Exit on error

echo "=================================================="
echo "🤖 AI Learning Portal - GitHub Pages Deployment"
echo "=================================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Clean previous build
echo -e "${BLUE}📦 Step 1: Cleaning previous build...${NC}"
if [ -d "dist" ]; then
    rm -rf dist
    echo -e "${GREEN}✓ Previous build cleaned${NC}"
else
    echo -e "${YELLOW}⚠ No previous build found${NC}"
fi
echo ""

# Step 2: Install dependencies
echo -e "${BLUE}📥 Step 2: Installing dependencies...${NC}"
npm install
echo -e "${GREEN}✓ Dependencies installed${NC}"
echo ""

# Step 3: Run build
echo -e "${BLUE}🔨 Step 3: Building site...${NC}"
npm run build
echo -e "${GREEN}✓ Build completed successfully${NC}"
echo ""

# Step 4: Verify build output
echo -e "${BLUE}🔍 Step 4: Verifying build output...${NC}"
if [ -d "dist" ] && [ -f "dist/index.html" ]; then
    echo -e "${GREEN}✓ Build output verified${NC}"
    echo "   - dist/ directory created"
    echo "   - index.html present"
    echo "   - $(find dist -name '*.html' | wc -l) HTML files generated"
else
    echo -e "${YELLOW}⚠ Build output verification failed${NC}"
    exit 1
fi
echo ""

# Step 5: Display deployment instructions
echo -e "${BLUE}🚀 Step 5: Deployment Options${NC}"
echo ""
echo "Choose your deployment method:"
echo ""
echo "=== OPTION A: GitHub Actions (Recommended) ==="
echo "1. Ensure GitHub Pages is configured:"
echo "   Settings → Pages → Source: GitHub Actions"
echo ""
echo "2. Commit and push to main branch:"
echo "   git add ."
echo "   git commit -m \"Deploy: Production-ready build\""
echo "   git push origin main"
echo ""
echo "3. GitHub Actions will automatically deploy"
echo "   Check: https://github.com/nchand02/AIConceptsHub/actions"
echo ""
echo "=== OPTION B: Manual Deployment ==="
echo "1. Install gh-pages (if not installed):"
echo "   npm install -g gh-pages"
echo ""
echo "2. Deploy manually:"
echo "   gh-pages -d dist"
echo ""
echo "=================================================="
echo -e "${GREEN}✅ Pre-deployment checks passed!${NC}"
echo ""
echo "Your site will be available at:"
echo "🌐 https://nchand02.github.io/AIConceptsHub"
echo ""
echo "=================================================="

