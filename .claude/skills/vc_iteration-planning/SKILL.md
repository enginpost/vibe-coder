---
name: vibe:7-iteration-planning
version: 1.0.0
description: "Step 7: Refine epic stories and build the phase plan — solution hypotheses, story sizes, phases, and tasks. Does not execute code. Triggers on requests like \"let's do iteration planning\", \"refine an epic\", \"plan our next iteration\", or \"let's update the roadmap plan\"."
author: Steve McDonald
user-invocable: true
allowed-tools: Read, Write, Edit, Bash
---

# Iteration Planning

$ARGUMENTS

**Template:** `.claude/skills/vc_pm-templates/epic-plan.template.md`
**Output:** `product-documentation/epics/epic-plan--<product-name>--<epic-name>.md`
**Also updates:**
- `product-documentation/epics/epic--<product-name>--<epic-name>.md` — validated size and status → Ready
- `product-documentation/roadmap--<product-name>.md` — phases nested under BVP; size and status synced
- Story files — solution hypothesis and size written back
- `product-documentation/solution-architecture--<product-name>.md` — if new technology decisions arise

---

## Dependency Check

1. Look for `product-documentation/solution-architecture--<product-name>.md`. If missing, stop:
   > "No solution architecture found. Please run the **Solution Architecture Planning** skill first."

2. Look for `product-documentation/roadmap--<product-name>.md`. If missing, stop:
   > "No roadmap found. Please run the **Roadmap Management** skill first."

3. Look for epic files in `product-documentation/epics/`. If none exist, stop:
   > "No epics found. Please run the **Epic Composition** skill first."

If all exist, identify the topmost roadmap BVP that is neither Executing nor Done. Confirm with the user:
> "The next epic to plan is [Epic Name]. Is that right, or would you like to work on a different one?"

---

## Behavioral Rules

- One question at a time. Wait for the answer.
- After each answer, summarize what will be recorded and confirm before writing.
- Write only the confirmed section — no batching.
- If the user says "that's enough for now" or similar, stop and save.

### Solution Architecture Gate

Before writing any solution hypothesis, read the solution architecture document in full. If a story requires a technology decision not yet captured:
1. Pause immediately.
2. Tell the user: *"This story needs a decision about [topic] not yet in the solution architecture. Let's add it first."*
3. Confirm the decision, update the solution architecture and Decision Log, then resume.

### Human Task Front-loading

When building phase task lists, identify all human tasks (decisions, approvals, setup, credentials) across all story hypotheses in the phase. List them all first — before any AI tasks. Human tasks must be completed before AI execution begins.

### Story Ordering in Phases

1. Respect input/output story dependency links — a story that feeds another precedes it.
2. Group stories that share prerequisites or whose outputs connect into coherent delivery chunks.
3. Default sequence within a phase follows the epic's story rank order.
4. Present proposed groupings one at a time for confirmation before writing.

---

## Instructions

Read the **Instructions for AI** section of the template and follow it exactly — through Phase 2 (Phase Planning) only. Do not execute Phase 3. This skill ends when the epic plan is complete with confirmed phases and tasks, and the epic status is updated to Ready.
