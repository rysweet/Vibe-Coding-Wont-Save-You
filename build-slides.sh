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

# Generate index page
echo "🔄 Generating index page..."
cat > dist/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>"Vibe Coding" Won't Save You - Presentation Index</title>
    <style>
        body { font-family: 'Inter', sans-serif; background: #0a0a0a; color: #e0e0e0; padding: 2rem; }
        h1 { color: #00ff88; text-align: center; }
        .slides-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1rem; max-width: 1200px; margin: 0 auto; }
        .slide-card { background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; padding: 1rem; }
        .slide-card h3 { color: #00ff88; margin-top: 0; }
        .slide-card a { color: #00ff88; text-decoration: none; }
        .slide-card a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>"Vibe Coding" Won't Save You</h1>
    <p style="text-align: center; margin-bottom: 2rem;">An AI-Assisted Development Tutorial</p>
    
    <div class="slides-grid">
        <div class="slide-card">
            <h3>01. Title</h3>
            <p>Introduction and overview</p>
            <a href="01-title.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>02. What Are We Up To?</h3>
            <p>Goals, audience, and key topics</p>
            <a href="02-what-are-we-up-to.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>03. Prerequisites</h3>
            <p>Setup and preparation requirements</p>
            <a href="03-prerequisites.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>04. What's Going On?</h3>
            <p>Industry context and new realities</p>
            <a href="04-whats-going-on.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>05. Manager Mindset</h3>
            <p>Managing AI as your new team</p>
            <a href="05-new-job-manager.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>06. Code Quality</h3>
            <p>AI code quality realities</p>
            <a href="06-garbage-code.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>07. Tools Overview</h3>
            <p>AI development tool landscape</p>
            <a href="07-tools-overview.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>08. Specific Tools</h3>
            <p>Copilot, Agents, and Roo Code</p>
            <a href="08-specific-tools.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>09. Development Approach</h3>
            <p>Spec-driven and iterative workflows</p>
            <a href="09-development-approach.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>10. Troubleshooting</h3>
            <p>Common issues and solutions</p>
            <a href="10-troubleshooting.html">View Slides →</a>
        </div>
        <div class="slide-card">
            <h3>11. Future & Exploration</h3>
            <p>Side-quests and future trends</p>
            <a href="11-exploration-future.html">View Slides →</a>
        </div>
    </div>
    
    <p style="text-align: center; margin-top: 2rem; opacity: 0.7;">
        Built with <a href="https://marp.app/" style="color: #00ff88;">MARP</a> using modular architecture
    </p>
</body>
</html>
EOF

echo "✅ Index page generated successfully!"

echo "🎉 Build complete! Check the ./dist directory for your presentations."
echo ""
echo "Generated files:"
ls -la ./dist/