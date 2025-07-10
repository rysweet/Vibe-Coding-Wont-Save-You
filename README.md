# "Vibe Coding" Won't Save You - MARP Presentation

An AI-Assisted Development Tutorial presentation built with MARP (Markdown Presentation Ecosystem) using a modular architecture.

## 🎯 Overview

The presentation covers AI-assisted development practices, tools, and workflows for developers. This presentation uses a **modular approach** with separate files for organization, maintainability, and collaboration. 

## 📁 Project Structure

```
Vibe-Coding-Wont-Save-You/
├── slides/                    # 11 individual slide files 
├── themes/                   # External CSS themes
│   └── vibe-coding.css      # Custom dark theme with green accents
├── dist/                    # Generated output files (22 files: 11 HTML + 11 PDF)
│   ├── *.html              # HTML versions of each slide set
│   └── *.pdf               # PDF versions of each slide set
├── docs/                    # GitHub Pages deployment files
├── .github/workflows/       # GitHub Actions for deployment
├── build-slides.sh         # Build script using --input-dir
├── create-index.sh         # Generate index page for GitHub Pages
└── .specs/                 # Original course content
```

## 🚀 Quick Start

### Option 1: Use the Build Script (Recommended)
```bash
# Build HTML presentations only
./build-slides.sh

# Build HTML + PDF presentations
./build-slides.sh --pdf
```

### Option 2: Manual MARP CLI Commands
```bash
# Build HTML presentations
marp --input-dir ./slides --output ./dist --theme-set ./themes --html

# Build PDF presentations  
marp --input-dir ./slides --output ./dist --theme-set ./themes --pdf

# Preview mode (watch for changes)
marp --input-dir ./slides --theme-set ./themes --preview
```

### Option 3: VS Code Tasks
1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type "Tasks: Run Task"
3. Choose from available tasks:
   - `Marp: Build Modular Slides (HTML)`
   - `Marp: Build Modular Slides (HTML + PDF)`
   - `Marp: Watch Modular Slides`

## 🛠 Installation & Dependencies

### Install MARP CLI
```bash
# Global installation
npm install -g @marp-team/marp-cli

# Or use npx for one-time use
npx @marp-team/marp-cli --input-dir ./slides --html
```

### Requirements
- [MARP CLI](https://github.com/marp-team/marp-cli) 
- Node.js v18+ (for MARP CLI)
- A Chromium-based browser (for PDF generation)

## 🎨 Theme Management

The presentation uses a custom theme [`themes/vibe-coding.css`](./themes/vibe-coding.css) featuring:

- **Dark gradient background** (#0a0a0a to #1a1a1a)
- **Green accent color** (#00ff88) for headings and emphasis
- **Custom styling** for code blocks, quotes, and images
- **Inter font family** for modern typography

To customize the theme, edit the CSS file directly. Changes will be applied to all slides.

## 📝 Content Organization

### Modular Structure Benefits:
✅ **Better Organization** - Each major section in its own file  
✅ **Easier Collaboration** - Team members can work on different sections  
✅ **Version Control Friendly** - Smaller, focused commits  
✅ **Reusable Components** - Share slides between presentations  
✅ **Flexible Workflow** - Build individual sections or entire presentation  

### Each slide file contains:
- YAML front matter with MARP configuration
- Theme reference: `theme: vibe-coding`
- Individual sections separated by `---`
- Consistent styling and pagination

## 🌐 GitHub Pages Deployment

The presentation automatically deploys to GitHub Pages when you push to the main branch.

### Setup GitHub Pages:
1. **Enable GitHub Pages** in your repository settings
2. **Set source to "GitHub Actions"**
3. **Push changes** to the main branch
4. **Access your presentation** at: `https://yourusername.github.io/your-repo-name/`

### Deployment Features:
- Automatic HTML generation from modular slide files
- GitHub Actions workflow (`.github/workflows/marp-deploy.yml`)
- Beautiful index page linking to all slide sections
- Live preview available at GitHub Pages URL

## 📊 Build Results

Successfully generates **22 files** when using modular approach:
- **11 HTML files** - One for each slide section
- **11 PDF files** - PDF versions of each section
- Each slide file becomes a separate presentation
- Consistent theming across all presentations
- Individual sections can be used independently

## 🔧 Technical Implementation

### MARP CLI Features Used:
- `--input-dir` - Process multiple markdown files from directory
- `--theme-set` - Apply external CSS themes
- `--output` - Specify output directory
- `--html` / `--pdf` - Choose output formats

### Build Script Features:
The `build-slides.sh` script provides:
- Automated dependency checking
- Consistent output directory management
- Optional PDF generation
- Progress reporting
- Cross-platform compatibility

## 💻 VS Code Integration

### Recommended Extensions:
- [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) for:
  - Live preview while editing
  - Export commands
  - Syntax highlighting
  - Auto-completion

### Development Workflow:
1. Edit slide files in `slides/` directory
2. Use VS Code Marp extension for live preview
3. Run `./build-slides.sh` to generate final outputs
4. Commit changes to trigger GitHub Pages deployment

## 📚 MARP Resources

### Documentation:
- [MARP CLI Documentation](https://github.com/marp-team/marp-cli)
- [Marpit Markdown Documentation](https://marpit.marp.app/)
- [Theme Development Guide](https://marpit.marp.app/theme-css)

### Slide Syntax:
```markdown
---
# Front matter (configuration)
marp: true
theme: vibe-coding
paginate: true
---

# First Slide Title
Content here

---

# Second Slide Title
More content with **bold** and *italic* text

- Bullet points
- Work great too
```

## 🤝 Contributing

### Adding New Content:
1. Create new slide files following naming convention: `##-section-name.md`
2. Include proper YAML front matter with `theme: vibe-coding`
3. Test your slides with `./build-slides.sh`
4. Update documentation if adding new features

### Content Guidelines:
- Use consistent front matter across all slide files
- Follow the established naming convention for new sections
- Test both HTML and PDF outputs before committing
- Keep individual slide files focused on single topics

## ⚡ Advantages of This Approach

✅ **Pure Markdown** - Keep your content in version control  
✅ **Multiple output formats** - HTML, PDF, PowerPoint  
✅ **GitHub Pages ready** - Automatic deployment  
✅ **VS Code extension** - Live preview while editing  
✅ **Customizable themes** - CSS styling support  
✅ **No JavaScript frameworks** - Simple, reliable rendering  
✅ **Modular architecture** - Better organization and collaboration  
✅ **Version control friendly** - Track changes effectively  

## 🎬 Presentation Content

This presentation covers:
- AI-Assisted Development fundamentals
- Tool landscape (Copilot, Agents, Roo Code, etc.)
- Spec-driven development approaches
- Iterative workflows and best practices
- Troubleshooting common issues
- Future trends in AI-assisted development

Perfect for developers looking to enhance their AI collaboration skills!

---

*This modular MARP approach provides maintainability and flexibility while keeping the simplicity of Markdown-based presentations!*
