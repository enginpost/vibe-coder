---
name: vibe:8-product-iteration
version: 1.0.0
description: "Step 8: Execute the next epic plan phase — one task at a time, pausing for human tasks, stopping when the phase is complete. Triggers on requests like \"let's execute\", \"start the next phase\", \"let's iterate\", or \"product iteration\"."
author: Steve McDonald
user-invocable: true
allowed-tools: Read, Write, Edit, Bash
---

# Product Iteration

$ARGUMENTS

**Input:** `product-documentation/epics/epic-plan--<product-name>--<epic-name>.md`
**Also updates:**
- Epic plan — tasks checked off as completed
- `product-documentation/roadmap--<product-name>.md` — phase status synced

---

## Dependency Check

1. Look for `product-documentation/roadmap--<product-name>.md`. If missing, stop:
   > "No roadmap found. Please run the **Roadmap Management** skill first."

2. Find the topmost roadmap BVP with status Ready or Executing. If none exist, stop:
   > "No epic is Ready or Executing on the roadmap. Please run the **Iteration Planning** skill first."

3. Look for the corresponding epic plan file `product-documentation/epics/epic-plan--<product-name>--<epic-name>.md`. If missing, stop:
   > "No epic plan found for [Epic Name]. Please run the **Iteration Planning** skill first."

If all exist, identify the first phase in the epic plan that is not yet Done. Confirm with the user:
> "The next phase to execute is **Phase [N]: [Phase Name]** from [Epic Name]. It has [N] tasks. Ready to begin?"

---

## Behavioral Rules

- Execute one task at a time. Announce the task before starting it.
- After completing an AI task, check it off in the epic plan before moving to the next.
- For human tasks, show the task and wait — do not proceed until the user confirms it is done.
- Do not batch tasks or skip ahead.
- If the user says "that's enough for now" or similar, stop immediately. Save all checked-off progress.

---

## Execution Loop

For each task in the current phase, in order:

**If it is a human task:**
> "Human task: [task description]. Let me know when this is done."

Wait for the user to confirm. Then check it off in the epic plan and move to the next task.

**If it is an AI task:**

Announce it:
> "Next: [task description]"

Execute it. When complete, check it off in the epic plan. Confirm completion briefly before moving on.

If the task surfaces a new technology decision not in the solution architecture:
1. Pause.
2. Tell the user: *"This task requires a decision about [topic] not yet in the solution architecture. Let's add it before continuing."*
3. Update `solution-architecture--<product-name>.md` and the Decision Log.
4. Resume.

---

## Phase Completion

When all tasks in the phase are checked off:

1. Update the phase status to Done in the epic plan.
2. Update the roadmap BVP entry — if this was the last phase, set epic status to Done; otherwise set to Executing if not already.
3. Present a phase summary to the user:
   > "**Phase [N]: [Phase Name] is complete.**
   >
   > [One sentence per story: what was built and how the user can verify or experience it.]
   >
   > When you're ready, we can move on to Phase [N+1]: [Phase Name]."

Then stop. Do not begin the next phase until the user explicitly asks to continue.
