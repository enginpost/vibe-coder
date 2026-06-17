---
name: vibe:6-solution-architecture-planning
version: 1.0.0
description: "Step 6: Define the solution architecture — the living record of technology decisions. Triggers on requests like \"let's define our solution architecture\", \"set up solution architecture\", \"work on the tech stack\", or \"define our architecture\"."
author: Steve McDonald
user-invocable: true
allowed-tools: Read, Write, Edit, Bash
---

# Solution Architecture Planning

$ARGUMENTS

**Template:** `.claude/skills/vc_pm-templates/solution-architecture.template.md`
**Output:** `product-documentation/solution-architecture--<product-name>.md`

---

## Dependency Check

Look for `product-documentation/product-vision--<product-name>.md`. If missing, stop:
> "No product vision found. Please run the **Product Discovery** skill first."

If it exists, read it fully before asking any questions — it informs deployment context and technology choices.

---

## Behavioral Rules

- One question at a time. Wait for the answer.
- After each answer, summarize what will be recorded and confirm before writing.
- Write only the confirmed section — no batching.
- If vague, ask one follow-up. If the user declines, insert `> [needs clarification]` and move on.
- If the user says "that's enough for now" or similar, stop and save.

### Living Document Rules

- Never delete or replace this document — only amend it.
- Every change must be recorded in the Decision Log with a date and reason.
- If invoked during story refinement to add a new decision, add only that decision and its log entry — do not re-interview on existing decisions.

---

## Instructions

Read the **Instructions for AI** section of the template and follow it exactly.
