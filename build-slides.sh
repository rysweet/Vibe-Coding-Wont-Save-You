#!/bin/bash

# Build script for MARP presentation using markdown-it-include for modular slides

echo "🎯 Building MARP presentation from modular slides using markdown-it-include..."

# Check if npx is available
if ! command -v npx &> /dev/null; then
    echo "❌ npx not found. Please install Node.js and npm."
    exit 1
fi

# Create output directory
mkdir -p dist

echo "📁 Using marp.config.cjs for markdown-it-include"
echo "📁 Processing entry: presentation.md"
echo "🎨 Using theme: ./themes/vibe-coding.css"
echo "📤 Output directory: ./dist"

# Build HTML presentation from modular includes using local marp-cli and npx
echo "🔄 Building HTML presentation..."
npx marp \
  --config ./marp.config.cjs \
  --html \
  --theme-set ./themes \
  --output ./dist/index.html \
  presentation.md

echo "✅ HTML presentation built successfully!"

# Optional: Build PDF version (add --pdf flag to enable)
if [[ "$1" == "--pdf" ]]; then
    echo "🔄 Building PDF presentation..."
    npx marp \
      --config ./marp.config.cjs \
      --pdf \
      --theme-set ./themes \
      --output ./dist/presentation.pdf \
      presentation.md
    echo "✅ PDF presentation built successfully!"
else
    echo "💡 Tip: Run with --pdf flag to also generate PDF version"
fi

# Copy images if needed
if [ -d "docs/images" ]; then
  mkdir -p dist/docs/images
  cp -r docs/images/* dist/docs/images/
fi

echo "🎉 Build complete! Check the ./dist directory for your presentation."
ls -la ./dist/