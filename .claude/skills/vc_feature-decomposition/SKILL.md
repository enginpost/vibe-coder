---
name: vibe:3-feature-decomposition
version: 1.0.0
description: "Step 3: Write user stories for a feature. Triggers on requests like \"let's write stories\", \"decompose a feature\", \"do feature decomposition\", \"add stories to a feature\", or \"let's define user stories\"."
author: Steve McDonald
user-invocable: true
allowed-tools: Read, Write, Edit, Bash
---

# Feature Decomposition

$ARGUMENTS

**Template:** `.claude/skills/vc_pm-templates/feature-stories.template.md`
**Output:** `product-documentation/features/feature--<product-name>--<feature-name>/<story-slug>.md`
**Also updates:** `product-documentation/features/feature--<product-name>--<feature-name>.md` (Stories section)

---

## Dependency Check

1. Look for `product-documentation/product-vision--<product-name>.md`. If missing, stop:
   > "No product vision found. Please run the **Product Discovery** skill first."

2. Look for feature files in `product-documentation/features/`. If none exist, stop:
   > "No features found. Please run the **Feature Discovery** skill first."

If both exist, ask the user which feature to decompose.

---

## Behavioral Rules

- One question at a time. Wait for the answer.
- After each answer, summarize what will be recorded and confirm before writing.
- Write only the confirmed section — no batching.
- If vague, ask one follow-up. If the user declines, insert `> [needs clarification]` and move on.
- Story statements and acceptance criteria must describe needs and outcomes — not solutions. Flag and reframe any that imply implementation detail.
- If the user says "that's enough for now" or similar, stop and save.

---

## Instructions

Read the **Instructions for AI** section of the template and follow it exactly.
