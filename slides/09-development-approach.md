---
marp: true
theme: vibe-coding
paginate: true
backgroundColor: #0a0a0a
color: #e0e0e0
---

## So I just talk to it, right?

- You can get really far by just describing what you want to do, and asking it to help you do it
- But after a certain point, it will go off the rails, and you will need to give it more structure

---

## Spec-Driven Development

- Create the specification you would want to receive as a developer
- Create the specification your PM would normally give you
- Talk to it like one of your besties…
  - **Write a spec as if you were trying to set an intern up for success**

---

## But what if I don't have a spec?

- Write a few sentences, then talk to o3 or GPT-4.1/4.5
- Iterate with the model to build the spec together
- Just talk out loud about what you want to do
- Great use of drive time!

---

## Iterative Workflow

- Ideate; keep a backlog
- Refine ideas and dig into details
- Run an Agent-Mode/Roo experiment
- Tweak the spec, try again
- Ask the model to review and update the spec
- Focus on tests and checks
- Validate, commit, PR!

---

## Create an Issue, branch, PR, Microspec

The model can literally do all of this – use the `gh` CLI liberally.

---

## Pre-commit, tests, check-in, push…

Everything falls apart without robust checks:

- Formatting / linting
- Type safety (skip JS; use TypeScript, or Pyright in Python)
- Unit tests
- Integration tests
- GitHub Actions? (I always run out of quota…)