---
marp: true
theme: vibe-coding
paginate: true
backgroundColor: #0a0a0a
color: #e0e0e0
---

## Things to watch out for and first-aid

- **Throttling** → switch models
- **Editing/diff failures** → switch models
- **Getting stuck** → give a prompt hint or switch models
- **Context management** → sometimes instruct the agent to refresh context & reiterate guidelines
- **Task stoppage** → remind it to continue until implementation is complete
- **Docker miasma of pain:** invest in container-management logic if you have multiple check-outs

---

## Going off the rails

- **Laziness** → OMG we'd fire these guys
- **Forgetfulness** → move common reminders into rules/instructions
- **Testing shenanigans** → always check!
  - Skipping tests
  - Writing tests but not running them
  - Ensuring tests always exit `true`
- **Pre-commit & checks** → beware sneaking in `--no-verify`

---

## You have to always look at the code… but you won't

- Seriously, you can't skip this
- Once you're grooving and it "just works," you *will* skip it

**Here's what to do:**
- Ask the model to explain the code – you'll often be horrified (update instructions!)
- Ask the model to perform code review (different persona)
- *Still* go look at the diffs – way easier before they're committed

---

## You have to always run the code… but you won't

- You *do* need to run the code
- But you'll forget or won't try everything

**Idea:** Build a demo-script document that exercises the end-to-end flow; turn it into an integration test.
- Add to it with each PR
- Use it to showcase the work