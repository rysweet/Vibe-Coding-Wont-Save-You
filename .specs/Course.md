# Vibe Coding Won't Save You

An AI-Assisted Development Tutorial

## Course Overview

This course is designed as a self-directed learning experience for developers wanting to learn more about collaborating with AI in their development workflow. It is necessarily a point-in-time snapshot, in a field that is changing hourly.
This course represents a set of practices that has been working for me, sometimes. Its not a comprehensive survey of what is available. 
The objective is that the developer comes way with a set of practices that they can apply to their own work, and a set of tools that they can use to explore what works for them. 

## Target Audience

This course is for developers who are interested in learning how to effectively collaborate with AI tools in their development workflow. It is suitable for developers of all levels, but you will have a much better sense for what is going on if you have some mid-level experience with programming and software development concepts.

## Key Topics Covered

- Intro to AI Assisted Development
- AI-Assisted Development Tools
- GitHub Copilot
- GitHub Agents
- Roo Code
- What is Spec Driven Development?
- Iterative Workflow
- Troubleshooting and Problem Solving
- Tips and Best Practices
- Heading into the Future

## Prerequisites/Preparation

To make things easier for us during the workshop let’s take some preparation steps. Many of you will already have this stuff as part of your daily work, but please check just in case. Setting all of this up from zero may take between 20-45 minutes. 

- You may want to set things up in a DevBox:
https://devbox.microsoft.com/
It will help if you ensure its up to date (Windows Update)
- Download and Install [VS Code Insiders](https://code.visualstudio.com/insiders/) - and ensure you are up to date (click the “settings” tool icon and click “restart to update” if it is available. *Note: I’m using Insiders because new AgentMode features, model access, etc shows up there daily. It can be sketchy​ at times and  95% of all of this will work with the VS Code monthly release...*
- Make sure you have [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) if you are on Windows, [Homebrew](https://brew.sh/) if you are on Mac
- On Windows - make sure you can open code-insiders from a WSL terminal (note this is different from starting it with the icon on the windows desktop - see here: https://code.visualstudio.com/docs/remote/wsl)
- You will want [git](https://git-scm.com/) ([or for macOS](https://git-scm.com/downloads/mac)),  [GitHub CLI](https://cli.github.com/), [python](https://www.python.org/), and [uv](https://pypi.org/project/uv/)
  - You may want to make sure that you can run “gh auth login” to authenticate the gh cli. 
- Setting Up VS Code Extensions
  - [Install the GitHub Copilot](https://code.visualstudio.com/docs/copilot/setup) extensions in VS Code Insiders
  - [Signup for GH Copilot](https://github.com/github-copilot/signup)
  - [Install python extensions](https://code.visualstudio.com/docs/languages/python) in VS Code Insiders
  - [Install the Roo Code Extension](https://docs.roocode.com/getting-started/installing) in VS Code Insiders
- Optional  (We will cover this in the workshop but if you want to do it ahead of time you can):
  - Setup some MCP servers in VS Code, and Roo Code
  - GitHub MCP server: https://github.com/github/github-mcp-server
  - Microsoft Learn Docs MCP: https://github.com/MicrosoftDocs/mcp
  - Azure MCP Server: https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/
  - Context7 (Docs) MCP: https://github.com/upstash/context7
  - Playwright MCP: https://github.com/microsoft/playwright-mcp
- We will use the [VS Code LM API model endpoint](https://code.visualstudio.com/api/extension-guides/ai/language-model) so you don’t need to deploy your own model endpoints but if you want to use your own model endpoints look [here for VS Code GH Copilot](https://code.visualstudio.com/docs/copilot/language-models), and [here for Roo Code](https://docs.roocode.com/getting-started/connecting-api-provider) (for Azure Open AI use “OpenAI Compatible”). 
- For some early parts of the workflow we will use a more conversational approach and I find that works well with ChatGPT. You may also try Claude Desktop or Azure AI Foundry Chat Playground. Note that you have to be aware of data and IP concerns when chatting with externally hosted models. For our purposes it will be fine. 

# Introduction

## So, What the Heck is Going On?

*Corporate Management has found a new religion – the “New Production Function” aka “The Software Factory”*

- "It sounds like a cult when they talk about it - What does this mean?”
  - Adventurous AI practitioners and experienced engineers are demonstrating productivity gains by changing how they work. 
  - It means bringing the AI into your work as a partner, not just autocomplete. 
  - It means expanding your ideas about what is possible and how we iterate. 
  - It means continuously learning and experimenting
- The potential for big gains is real, and we all need to embrace it. 

*Let me show you what has been (sometimes) working for me…*

## Welcome to your new Job as a Manager

- One of the fastest and easiest ways to get your head into the right space is to pretend you just hired at least 5 of this lady:

  - ![Amelia Bedelia](./images/AmeliaBedelia.png)  <sub align="top">*(Amelia Bedelia is a character in American children’s books who is very helpful but takes everything literally and gets into funny situations as a result)</sub>* 

- But it turns out its kind of like she comes along with 3-4 of these guys too:
  - ![Screen Grab showing the phsyicists from the Big Bang Theory TV show](./images/BigBangTheory.png) <sub align="top">*(in The BigBang Theory, a group of super-smart physicists are comically awkward and are taught practical life lessons by their friend and neighbor)
</sub>*

- Your job is to learn how to coach them. Consider the AI like a team of interns who are super smart, but need to be taught how to do things the way you want them done.

## But doesn't the AI produce lots of garbage code?

- Yes, it does. Frequently.
- But increasingly it produces code that is useful, and sometimes even surprisingly good.
- By setting up the right guardrails and paying close attention to what it is doing, you can get it to produce code that is useful, functional, sometimes even innovative.
- It can help you discover how to do things you didn't know how to do, and it can let you move very quickly through the parts of the code that you already know how to do.
 - That means you can focus on the parts of the problem that are genuinely novel and interesting.

# Coding Agents

## Brief overview of tools out there …OMG the agents are everywhere

- **OpenAI Codex** – works on your repo in a VM in the cloud  
- **Claude Code** – CLI you can run in your terminal  
- Both let you dialog about what you want and “spill their guts” about every step they take, with guard-rails  
- **GH Copilot Agent Mode** – runs in VS/VS Code; short bursts, not very autonomous  
- **GH Agents** – work on your repo in GitHub, driven by issues  
- **Cline / Roo Code** – Roo is an improved fork of Cline; OSS and similar to (better than) Agent Mode  
- Long tail of others: Augment, DevN, Windsurf, etc. 

## Where I’m at today – chasing my own tail?

- Loved Claude Code; Codex was second, but cost was too high…  
- Always use VS Code Insiders and update daily.  
- Settled on Roo Code as my primary tool; now like it better than Claude Code or Codex.  
- Frequent detours to ChatGPT and GH Copilot Agent Mode.  
- Try Agent Mode every other day (be a good citizen – it *is* getting better).  
- Check in regularly with colleagues who are also experimenting. 

## GH Copilot Agent Mode

- **The Good:** Microsoft team I can give feedback to; relatively cautious; lots of model choice; BYOM possible.  
- Use `./github/copilot-instructions.md`.  
- **The Bad:** optimized for speed over quality; barely autonomous – you must approve nearly every command. 

## GH Agents

- **The good:** runs in the GitHub cloud on your repo, driven by issues, forces you to think a little more.  
- **The bad:** very cautious; hard to spot problems while they happen; troubleshooting isn’t interactive. 

## Roo Cline …it’s like adding a boxing kangaroo to your team!

- VS Code extension (use VS Code Insiders).  
- Fine-grained control over models, parameters, custom instructions & modes; can work autonomously across complex task trees. 

### Setting Up Models

- *\<demo>* 

### Approving commands

- *\<demo>* 

### Custom modes and Rooles

- *\<demo>* 

# Let's Get to Work!


## So I just talk to it, right?

- You can get really far by just describing what you want to do, and asking it to help you do it.
- But after a certain point, it will go off the rails, and you will need to give it more structure.

## Spec-Driven Development

- Create the specification you would want to receive as a developer.  
- Create the specification your PM would normally give you.  
- Talk to it like one of your besties…  
  - Write a spec as if you were trying to set an intern up for success. 

## But what if I don’t have a spec?

- Write a few sentences, then talk to o3 or GPT-4.1/4.5.  
- Iterate with the model to build the spec together.  
- Just talk out loud about what you want to do.  
- Great use of drive time! 

## Iterative Workflow

- Ideate; keep a backlog.  
- Refine ideas and dig into details.  
- Run an Agent-Mode/Roo experiment.  
- Tweak the spec, try again.  
- Ask the model to review and update the spec.  
- Focus on tests and checks.  
- Validate, commit, PR! 

## Create an Issue, branch, PR, Microspec

- The model can literally do all of this – use the `gh` CLI liberally. 

## Pre-commit, tests, check-in, push…

- Everything falls apart without robust checks:  
  - Formatting / linting  
  - Type safety (skip JS; use TypeScript, or Pyright in Python)  
  - Unit tests  
  - Integration tests  
  - GitHub Actions? (I always run out of quota…)  [oai_citation:3‡VibeCoding Wont Save You Part 2.pdf](file-service://file-ToVtwAY41jyaJBwWezND18)

## Things to watch out for and first-aid

- **Throttling** → switch models  
- **Editing/diff failures** → switch models  
- **Getting stuck** → give a prompt hint or switch models  
- **Context management** → sometimes instruct the agent to refresh context & reiterate guidelines  
- **Task stoppage** → remind it to continue until implementation is complete  
- **Docker miasma of pain:** invest in container-management logic if you have multiple check-outs. 

## Going off the rails

- **Laziness** → OMG we’d fire these guys  
- **Forgetfulness** → move common reminders into rules/instructions  
- **Testing shenanigans** → always check!  
  - Skipping tests  
  - Writing tests but not running them  
  - Ensuring tests always exit `true`  
- **Pre-commit & checks** → beware sneaking in `--no-verify` 

## You have to always look at the code… but you won’t

- Seriously, you can’t skip this.  
- Once you’re grooving and it “just works,” you *will* skip it.  
  **Here’s what to do:**  
  - Ask the model to explain the code – you’ll often be horrified (update instructions!).  
  - Ask the model to perform code review (different persona).  
  - *Still* go look at the diffs – way easier before they’re committed. 

## You have to always run the code… but you won’t

- You *do* need to run the code.  
- But you’ll forget or won’t try everything.  
  **Idea:** Build a demo-script document that exercises the end-to-end flow; turn it into an integration test.  
  - Add to it with each PR.  
  - Use it to showcase the work. 

## Side-quests and Prompt Explorations

- Treat the model like an employee/colleague – ask it questions.  
- Do “what-ifs.”  
- Ask it to ask *you* questions and take notes.  
- Repeatedly have it explain things, then ask probing questions.  
- *(See a theme? Curiosity helps!)* 

## This is just a waypoint – where are we going?

- The capabilities keep increasing.  
- We are headed to self-improving programs. 