# Epic Template

---

## Standards

### File Naming Convention

```
epic--<product-name>--<epic-name>.md
```

- Use lowercase kebab-case for both `<product-name>` and `<epic-name>`
- `<epic-name>` is typically a version label or short release goal descriptor
- Example: `epic--expense-tracker--v1.md` or `epic--expense-tracker--mvp.md`

### File Location

```
project-root/
└── product-documentation/
    ├── product-vision--<product-name>.md
    ├── features/
    │   ├── feature--<product-name>--<feature-name>.md
    │   └── feature--<product-name>--<feature-name>/
    │       └── story--<action-slug>.md
    └── epics/
        └── epic--<product-name>--<epic-name>.md
```

### Relationship to Other Documents

- **Parent**: `product-vision--<product-name>.md` — KPIs/OKRs that the epic's success criteria must trace to
- **Contributing features**: one or more `feature--<product-name>--<feature-name>.md` files whose stories are included
- **Roadmap**: epics are rank-ordered on the roadmap — no delivery dates live in the epic itself

---

### Document Structure

```markdown
# Epic: <Epic Name>

**Product:** [<Product Name>](../../product-vision--<product-name>.md)
**Version / Release Label:** <e.g., MVP, v1, Beta>

## Goal Statement
<Why this epic exists. Defines the value being delivered and sets the boundary for what belongs in this epic. Stories that do not serve this goal should not be included.>

## Success Criteria
*Each criterion must trace to a KPI or OKR defined in the product vision.*

- [<KPI or OKR from product vision>] — <how this epic's delivery moves that metric>

## Stories
*Rank-ordered for delivery. Order is determined first by feature rank in the product vision, then by story rank within each feature.*

| Rank | Story | Feature | Status |
|------|-------|---------|--------|
| 1 | [<Story Title>](<relative-path>.md) | [<Feature Name>](<relative-path>.md) | Not started |
| 2 | [<Story Title>](<relative-path>.md) | [<Feature Name>](<relative-path>.md) | Not started |

## Contributing Features
*Features with one or more stories included in this epic.*

- [<Feature Name>](../../features/feature--<product-name>--<feature-name>.md) — <stories included: X of Y>

## Epic Size
> [not yet estimated] *(xs / s / m / l / xl)*

## Status
> Ideation
*(Ideation → Created → Ready → Executing → Done)*
```

---

## Instructions for AI

> These instructions tell the AI how to conduct the epic interview and produce the output document. Apply the Universal Behavioral Rules from SKILL.md throughout — one question, one confirmation, one write at a time.

### Overview

When a user wants to create an epic, your job is to:

1. **Read the product vision** — load KPIs/OKRs, the feature scope list, and any existing epics.
2. **Read all feature documents** — load each feature's rank, stories, and story ranks.
3. **Interview the user** to define the epic's goal, success criteria, and included stories.
4. **Enforce story ordering rules** — propose rank order based on feature rank then story rank; confirm with user.
5. **Challenge story inclusions** that do not align with the goal statement.
6. **Create the epic file** and update the product vision if new KPIs/OKRs are needed.

---

### Interview Sequence

---

#### Step 1 — Identify the Product

If not clear from context, ask:
> "Which product is this epic for?"

- Load `product-documentation/product-vision--<product-name>.md`.
- Load all feature files from `product-documentation/features/` and their story files.
- Note the rank order of features as listed in the product vision Scope section.
- Note the rank order of stories within each feature's Stories section.

---

#### Step 2 — Epic Name and Version Label

Ask:
> "What would you like to call this epic or release? For example: MVP, v1, Beta Launch."

- Confirm the name, derive the file slug, and create the epic file stub at `product-documentation/epics/epic--<product-name>--<epic-name>.md`.

---

#### Step 3 — Goal Statement

Ask:
> "What is the goal of this epic? Describe the value being delivered and what makes a story appropriate or inappropriate for inclusion here."

- After the user answers, summarize the goal in one or two sentences and confirm.
- Write the confirmed goal to the **Goal Statement** section.
- Keep this goal statement visible throughout the rest of the interview — you will use it to evaluate story inclusions.

---

#### Step 4 — Success Criteria

Read the product vision's KPIs/OKRs. Present them to the user:
> "The product vision defines these success metrics: [list]. Which of these does this epic move the needle on, and how?"

Confirm each one at a time:
> "[KPI/OKR] — how does delivering this epic advance that metric?"

- Capture as: `[KPI or OKR] — <how this epic's delivery moves that metric>`
- Write each confirmed criterion to the file before moving to the next.

If the user identifies a success criterion that does not map to any existing KPI/OKR:
> "That doesn't match any of the KPIs/OKRs currently in the product vision. It sounds like a new metric — would you like to add it to the product vision now before we continue?"

If yes:
- Open the product vision file.
- Add the new metric to the **Success Metrics** section.
- Confirm the addition with the user.
- Then continue adding it to the epic's success criteria.

---

#### Step 5 — Story Selection

Present all available stories across all features, grouped by feature and ordered by feature rank then story rank:

> "Here are all the defined stories for [Product Name], ordered by feature and story rank:
>
> **[Feature 1 — rank 1]**
> 1. [Story A]
> 2. [Story B]
>
> **[Feature 2 — rank 2]**
> 1. [Story I]
> 2. [Story II]
>
> Which of these belong in this epic?"

Ask the user to select stories. Confirm each inclusion one at a time:
> "Including [Story Title] from [Feature Name] — does this story serve the goal: '[goal statement]'?"

If a story seems misaligned with the goal statement, flag it:
> "I want to check — [Story Title] seems like it may not directly serve the goal of this epic: '[goal statement]'. Should we include it, set it aside for a future epic, or revisit the goal statement?"

Wait for the user's decision before moving on.

---

#### Step 6 — Story Rank Order

Once all included stories are confirmed, apply the ordering rules:

1. Group stories by their parent feature.
2. Order feature groups by the feature's rank in the product vision Scope section.
3. Within each feature group, order stories by their rank in the feature's Stories section.
4. Present the proposed order to the user:

> "Based on feature and story rank, here is the proposed delivery order for this epic:
> 1. [Story A] — Feature 1
> 2. [Story B] — Feature 1
> 3. [Story I] — Feature 2
>
> Would you like to adjust the order?"

- Apply any adjustments the user requests, one change at a time, confirming each before writing.
- Write the final confirmed story table to the file.

---

#### Step 7 — Contributing Features Summary

Derive the contributing features list from the selected stories:

For each contributing feature, count: stories included out of total stories in that feature.

Present for confirmation:
> "[Feature Name] — [X] of [Y] stories included. Does that look right?"

Write the confirmed list to **Contributing Features**.

---

#### Step 8 — Epic Size & Status

Inform the user:
> "I've left a placeholder for Epic Size — this is a T-shirt estimate (xs, s, m, l, xl) of the effort to deliver all stories in this epic. We won't estimate it now, but it can be updated at any time and is used by the roadmap."

Write the placeholders:
- **Epic Size**: `> [not yet estimated] *(xs / s / m / l / xl)*`
- **Status**: `> Created` (since the epic file now exists with stories associated)

---

#### Step 9 — Review & Close

Once all sections are complete:

1. Summarize: epic name, goal, success criteria, number of stories, contributing features.
2. List any `[needs clarification]` markers.
3. Ask: *"Is this epic ready to save as a draft, or would you like to adjust anything?"*
4. Remind the user: *"When you're ready to sequence your epics for delivery, use the roadmap template. The roadmap will also prompt you to add a T-shirt size estimate for this epic."*
