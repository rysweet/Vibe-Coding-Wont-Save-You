#!/bin/bash

# Build script for MARP presentation using modular slides
# Concatenates all slides/*.md into presentation.md before building
# Only keeps the frontmatter from the first slide, and ensures --- between slides

echo "🎯 Building MARP presentation from modular slides (concatenation approach, single frontmatter, correct separators)..."

# Check if npx is available
if ! command -v npx &> /dev/null; then
    echo "❌ npx not found. Please install Node.js and npm."
    exit 1
fi

# Create output directory
mkdir -p dist

# Concatenate slides, keeping only the first frontmatter block and ensuring --- between slides
echo "🔄 Concatenating slides/*.md into presentation.md (single frontmatter, correct separators)"
first=1
> presentation.md
for file in slides/*.md; do
  if [[ $first -eq 1 ]]; then
    # Copy the first file as-is (including frontmatter)
    cat "$file" >> presentation.md
    first=0
  else
    # Insert slide separator before each subsequent slide
    echo -e "\n---\n" >> presentation.md
    # Strip frontmatter (YAML block at the top) from subsequent files
    awk 'BEGIN{inblock=0; started=0}
      /^---[[:space:]]*$/ {
        if (inblock == 0 && started == 0) { inblock=1; next }
        else if (inblock == 1) { inblock=0; started=1; next }
      }
      { if (inblock == 0) print }
    ' "$file" >> presentation.md
  fi
done

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