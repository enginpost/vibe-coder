---
name: vibe:1-product-discovery
version: 1.0.0
description: "Step 1: Create the product vision. Triggers on requests like \"let's do product discovery\", \"create a product vision\", \"let's define our product\", or \"start a new product\"."
author: Steve McDonald
user-invocable: true
allowed-tools: Read, Write, Edit, Bash
---

# Product Discovery

$ARGUMENTS

**Template:** `.claude/skills/vc_pm-templates/product-vision.template.md`
**Output:** `product-documentation/product-vision--<product-name>.md`

---

## On Start

Check whether `product-documentation/product-vision--<product-name>.md` already exists.

- If it does, scan for incomplete sections and `> [needs clarification]` markers. Ask the user whether to continue filling it in or make a change.
- If it is complete, ask: *"Are there any changes or additions you'd like to make?"*
- If it does not exist, begin the interview.

---

## Behavioral Rules

- One question at a time. Wait for the answer.
- After each answer, summarize what will be recorded and confirm before writing.
- Write only the confirmed section — no batching.
- If vague, ask one follow-up. If the user declines, insert `> [needs clarification]` and move on.
- If the user says "that's enough for now" or similar, stop and save.

---

## Instructions

Read the **Instructions for AI** section of the template and follow it exactly.
