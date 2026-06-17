---
name: vibe:2-feature-discovery
version: 1.0.0
description: "Step 2: Define features from the product vision. Triggers on requests like \"let's define a feature\", \"add a feature\", \"do feature discovery\", or \"work on features\"."
author: Steve McDonald
user-invocable: true
allowed-tools: Read, Write, Edit, Bash
---

# Feature Discovery

$ARGUMENTS

**Template:** `.claude/skills/vc_pm-templates/feature.template.md`
**Output:** `product-documentation/features/feature--<product-name>--<feature-name>.md`
**Also updates:** `product-documentation/product-vision--<product-name>.md` (Scope section)

---

## Dependency Check

Look for `product-documentation/product-vision--<product-name>.md`. If it does not exist, stop:
> "No product vision found. Please run the **Product Discovery** skill first."

---

## Behavioral Rules

- One question at a time. Wait for the answer.
- After each answer, summarize what will be recorded and confirm before writing.
- Write only the confirmed section — no batching.
- If vague, ask one follow-up. If the user declines, insert `> [needs clarification]` and move on.
- When inferring from the product vision (personas, pains/gains), present each inference as an assumption to confirm — one at a time.
- If the user says "that's enough for now" or similar, stop and save.

---

## Instructions

Read the **Instructions for AI** section of the template and follow it exactly.
