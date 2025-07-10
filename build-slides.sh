#!/bin/bash

# Build script for MARP presentation using markdown-it-include for modular slides

echo "🎯 Building MARP presentation from modular slides using markdown-it-include..."

# Check if marp is installed
if ! command -v marp &> /dev/null; then
    echo "❌ MARP CLI not found. Installing via npx..."
    npx @marp-team/marp-cli --version
fi

# Create output directory
mkdir -p dist

echo "📁 Using marp.config.mjs for markdown-it-include"
echo "📁 Processing entry: presentation.md"
echo "🎨 Using theme: ./themes/vibe-coding.css"
echo "📤 Output directory: ./dist"

# Build HTML presentation from modular includes
echo "🔄 Building HTML presentation..."
marp \
  --config ./marp.config.mjs \
  --html \
  --theme-set ./themes \
  --output ./dist/index.html \
  presentation.md

echo "✅ HTML presentation built successfully!"

# Optional: Build PDF version (add --pdf flag to enable)
if [[ "$1" == "--pdf" ]]; then
    echo "🔄 Building PDF presentation..."
    marp \
      --config ./marp.config.mjs \
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