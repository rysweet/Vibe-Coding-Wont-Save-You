#!/bin/bash

# Build script for MARP presentation using --input-dir
# This processes all markdown files in the slides directory

echo "🎯 Building MARP presentation from slides directory..."

# Check if marp is installed
if ! command -v marp &> /dev/null; then
    echo "❌ MARP CLI not found. Installing via npx..."
    npx @marp-team/marp-cli --version
fi

# Create output directory
mkdir -p dist

echo "📁 Processing slides from: ./slides"
echo "🎨 Using theme: ./themes/vibe-coding.css"
echo "📤 Output directory: ./dist"

# Build HTML presentations using --input-dir
echo "🔄 Building HTML presentations..."
marp \
  --input-dir ./slides \
  --output ./dist \
  --theme-set ./themes \
  --html

echo "✅ HTML presentations built successfully!"

# Optional: Build PDF versions (add --pdf flag to enable)
if [[ "$1" == "--pdf" ]]; then
    echo "🔄 Building PDF presentations..."
    marp \
      --input-dir ./slides \
      --output ./dist \
      --theme-set ./themes \
      --pdf
    echo "✅ PDF presentations built successfully!"
else
    echo "💡 Tip: Run with --pdf flag to also generate PDF versions"
fi

echo "🎉 Build complete! Check the ./dist directory for your presentations."
echo ""
echo "Generated files:"
ls -la ./dist/