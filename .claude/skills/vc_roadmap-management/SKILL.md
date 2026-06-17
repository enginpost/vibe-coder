---
name: vibe:4-roadmap-management
version: 1.0.0
description: "Step 4: Build and maintain the product roadmap. Triggers on requests like \"let's work on the roadmap\", \"update the roadmap\", \"add an epic to the roadmap\", or \"manage the roadmap\"."
author: Steve McDonald
user-invocable: true
allowed-tools: Read, Write, Edit, Bash
---

# Roadmap Management

$ARGUMENTS

**Template:** `.claude/skills/vc_pm-templates/roadmap.template.md`
**Output:** `product-documentation/roadmap--<product-name>.md`
**Also updates:** `product-documentation/product-vision--<product-name>.md` (Timeline & Roadmap link)

---

## Dependency Check

1. Look for `product-documentation/product-vision--<product-name>.md`. If missing, stop:
   > "No product vision found. Please run the **Product Discovery** skill first."

2. Look for feature files in `product-documentation/features/`. If none exist, stop:
   > "No features found. Please run the **Feature Discovery** skill first."

BVPs in Ideation status are valid — a roadmap can be started before any epic files exist.

---

## Behavioral Rules

- One question at a time. Wait for the answer.
- After each answer, summarize what will be recorded and confirm before writing.
- Write only the confirmed section — no batching.
- If the user says "that's enough for now" or similar, stop and save.

### Re-ranking Rules

Apply whenever the BVP list changes:

1. Every time a new BVP is added, present the full list and ask the user to confirm or adjust order.
2. BVPs with status Executing or Done are locked — cannot be moved.
3. Nothing may be inserted above an Executing BVP. If attempted, block it and offer the next available position below the last Executing or Done item.
4. Single continuous rank order only — no tiers or groupings.
5. On every session start, sync epic size and status from the epic file (source of record) before presenting the list.
6. Once an epic plan exists, its phases appear as nested checklist entries beneath their BVP row.

---

## Instructions

Read the **Instructions for AI** section of the template and follow it exactly.
