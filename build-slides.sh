#!/bin/bash

# Build script for MARP presentation using modular slides
# Concatenates all slides/*.md into presentation.md before building

echo "🎯 Building MARP presentation from modular slides (concatenation approach)..."

# Check if npx is available
if ! command -v npx &> /dev/null; then
    echo "❌ npx not found. Please install Node.js and npm."
    exit 1
fi

# Create output directory
mkdir -p dist

# Concatenate all slides into presentation.md
echo "🔄 Concatenating slides/*.md into presentation.md"
cat slides/*.md > presentation.md

echo "📁 Processing entry: presentation.md"
echo "🎨 Using theme: ./themes/vibe-coding.css"
echo "📤 Output directory: ./dist"

# Build HTML presentation from concatenated file
echo "🔄 Building HTML presentation..."
npx marp \
  --html \
  --theme-set ./themes \
  --output ./dist/index.html \
  presentation.md

echo "✅ HTML presentation built successfully!"

# Optional: Build PDF version (add --pdf flag to enable)
if [[ "$1" == "--pdf" ]]; then
    echo "🔄 Building PDF presentation..."
    npx marp \
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