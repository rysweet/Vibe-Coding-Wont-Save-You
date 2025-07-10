# Marp Presentation Setup

This repository contains a Marp-based presentation that automatically deploys to GitHub Pages.

## Files

- `presentation.md` - The main presentation file in Markdown format
- `.github/workflows/marp-deploy.yml` - GitHub Actions workflow for automatic deployment
- `.specs/Course.md` - Original course content

## How to Use

### Local Development

1. **Install Marp CLI:**
   ```bash
   npm install -g @marp-team/marp-cli
   ```

2. **Preview the presentation:**
   ```bash
   # Generate HTML file
   marp presentation.md --html --output index.html
   
   # Or start live preview server
   marp presentation.md --server
   ```

3. **Export to different formats:**
   ```bash
   # Export to PDF
   marp presentation.md --pdf --output presentation.pdf
   
   # Export to PowerPoint
   marp presentation.md --pptx --output presentation.pptx
   ```

### GitHub Pages Deployment

The presentation automatically deploys to GitHub Pages when you push to the main branch.

1. **Enable GitHub Pages** in your repository settings
2. **Set source to "GitHub Actions"**
3. **Push changes** to the main branch
4. **Access your presentation** at: `https://yourusername.github.io/your-repo-name/`

## Editing the Presentation

The presentation uses standard Markdown with Marp extensions:

- `---` separates slides
- Front matter at the top controls theme and styling
- Standard Markdown syntax for content
- Custom CSS in the `style:` section

### Slide Structure

```markdown
---
# This is the front matter (configuration)
marp: true
theme: default
---

# First Slide Title
Content here

---

# Second Slide Title
More content

---
```

## Advantages of Marp

✅ **Pure Markdown** - Keep your content in version control  
✅ **Multiple output formats** - HTML, PDF, PowerPoint  
✅ **GitHub Pages ready** - Automatic deployment  
✅ **VS Code extension** - Live preview while editing  
✅ **Customizable themes** - CSS styling support  
✅ **No JavaScript frameworks** - Simple, reliable rendering  

## VS Code Extension

Install the [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) extension for:

- Live preview while editing
- Export commands
- Syntax highlighting
- Auto-completion

## Customization

The presentation includes custom dark theme styling. You can modify the `style:` section in the front matter to customize:

- Colors
- Fonts
- Layout
- Animations
- Background gradients

This approach is much more maintainable than complex JavaScript presentation frameworks!