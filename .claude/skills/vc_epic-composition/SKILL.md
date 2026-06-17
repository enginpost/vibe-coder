---
name: vibe:5-epic-composition
version: 1.0.0
description: "Step 5: Create epic documents from roadmap BVPs. Triggers on requests like \"let's compose an epic\", \"create an epic\", \"build an epic\", or \"work on epics\"."
author: Steve McDonald
user-invocable: true
allowed-tools: Read, Write, Edit, Bash
---

# Epic Composition

$ARGUMENTS

**Template:** `.claude/skills/vc_pm-templates/epic.template.md`
**Output:** `product-documentation/epics/epic--<product-name>--<epic-name>.md`
**Also updates:**
- `product-documentation/roadmap--<product-name>.md` — epic link and status
- Each included story file — annotated with epic association

---

## Dependency Check

1. Look for `product-documentation/product-vision--<product-name>.md`. If missing, stop:
   > "No product vision found. Please run the **Product Discovery** skill first."

2. Look for `product-documentation/roadmap--<product-name>.md`. If missing, stop:
   > "No roadmap found. Please run the **Roadmap Management** skill first."

3. Look for story files in `product-documentation/features/`. If none exist, stop:
   > "No stories found. Please run the **Feature Decomposition** skill first."

If all exist, identify roadmap BVPs without an associated epic file and present them as candidates.

---

## Behavioral Rules

- One question at a time. Wait for the answer.
- After each answer, summarize what will be recorded and confirm before writing.
- Write only the confirmed section — no batching.
- If the user says "that's enough for now" or similar, stop and save.

### Story Ordering Rules

1. Group stories by parent feature.
2. Order feature groups by the feature's rank in the product vision Scope section.
3. Within each group, order stories by their rank in the feature's Stories section.
4. Present the proposed order, confirm before writing, adjust one at a time.

### Story-to-Epic Annotation

After the epic is created, append to each included story file:

```markdown
## Epic Association
**Epic:** [<Epic Name>](../../../epics/epic--<product-name>--<epic-name>.md)
```

---

## Instructions

Read the **Instructions for AI** section of the template and follow it exactly.
