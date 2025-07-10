---
marp: true
theme: vibe-coding
paginate: true
backgroundColor: #0a0a0a
color: #e0e0e0
---

## Prerequisites/Preparation

To make things easier for us during the workshop let's take some preparation steps. Many of you will already have this stuff as part of your daily work, but please check just in case. Setting all of this up from zero may take between 20-45 minutes.

- You may want to set things up in a DevBox: https://devbox.microsoft.com/ - It will help if you ensure its up to date (Windows Update)
- Download and Install [VS Code Insiders](https://code.visualstudio.com/insiders/) - and ensure you are up to date (click the "settings" tool icon and click "restart to update" if it is available. *Note: I'm using Insiders because new AgentMode features, model access, etc shows up there daily. It can be sketchy​ at times and  95% of all of this will work with the VS Code monthly release...*
- Make sure you have [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) if you are on Windows, [Homebrew](https://brew.sh/) if you are on Mac
- On Windows - make sure you can open code-insiders from a WSL terminal (note this is different from starting it with the icon on the windows desktop - see here: https://code.visualstudio.com/docs/remote/wsl)

---

## Prerequisites/Preparation (continued)

- You will want [git](https://git-scm.com/) ([or for macOS](https://git-scm.com/downloads/mac)),  [GitHub CLI](https://cli.github.com/), [python](https://www.python.org/), and [uv](https://pypi.org/project/uv/)
  - You may want to make sure that you can run "gh auth login" to authenticate the gh cli. 
- Setting Up VS Code Extensions
  - [Install the GitHub Copilot](https://code.visualstudio.com/docs/copilot/setup) extensions in VS Code Insiders
  - [Signup for GH Copilot](https://github.com/github-copilot/signup)
  - [Install python extensions](https://code.visualstudio.com/docs/languages/python) in VS Code Insiders
  - [Install the Roo Code Extension](https://docs.roocode.com/getting-started/installing) in VS Code Insiders

---

## Prerequisites/Preparation (continued)

- Optional  (We will cover this in the workshop but if you want to do it ahead of time you can):
  - Setup some MCP servers in VS Code, and Roo Code
  - GitHub MCP server: https://github.com/github/github-mcp-server
  - Microsoft Learn Docs MCP: https://github.com/MicrosoftDocs/mcp
  - Azure MCP Server: https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/
  - Context7 (Docs) MCP: https://github.com/upstash/context7
  - Playwright MCP: https://github.com/microsoft/playwright-mcp
- We will use the [VS Code LM API model endpoint](https://code.visualstudio.com/api/extension-guides/ai/language-model) so you don't need to deploy your own model endpoints but if you want to use your own model endpoints look [here for VS Code GH Copilot](https://code.visualstudio.com/docs/copilot/language-models), and [here for Roo Code](https://docs.roocode.com/getting-started/connecting-api-provider) (for Azure Open AI use "OpenAI Compatible"). 
- For some early parts of the workflow we will use a more conversational approach and I find that works well with ChatGPT. You may also try Claude Desktop or Azure AI Foundry Chat Playground. Note that you have to be aware of data and IP concerns when chatting with externally hosted models. For our purposes it will be fine.