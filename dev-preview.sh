#!/bin/bash

# Marp Local Development Script
# This script helps you iterate on your presentation locally

echo "🎯 Marp Local Development Options:"
echo ""
echo "1. Generate HTML and open in browser:"
echo "   marp presentation.md --html --output dev-presentation.html"
echo "   open dev-presentation.html"
echo ""
echo "2. Live server with auto-reload:"
echo "   marp presentation.md --server --watch"
echo "   # Opens at http://localhost:8080"
echo ""
echo "3. Generate and serve with Python:"
echo "   marp presentation.md --html --output dev-presentation.html"
echo "   python3 -m http.server 8080"
echo "   # Open http://localhost:8080/dev-presentation.html"
echo ""
echo "4. Watch mode (auto-rebuild on changes):"
echo "   marp presentation.md --html --output dev-presentation.html --watch"
echo ""
echo "5. Export to different formats:"
echo "   marp presentation.md --pdf --output presentation.pdf"
echo "   marp presentation.md --pptx --output presentation.pptx"
echo ""

# Generate HTML for immediate preview
echo "🚀 Generating HTML preview..."
marp presentation.md --html --output dev-presentation.html

if [ $? -eq 0 ]; then
    echo "✅ Generated: dev-presentation.html"
    echo ""
    echo "📂 Open with:"
    echo "   - Double-click dev-presentation.html"
    echo "   - Or serve with: python3 -m http.server 8080"
    echo "   - Then visit: http://localhost:8080/dev-presentation.html"
    echo ""
    echo "🔄 To auto-rebuild on changes:"
    echo "   marp presentation.md --html --output dev-presentation.html --watch"
else
    echo "❌ Error generating HTML"
fi