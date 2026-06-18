# Roadmap Template

---

## Standards

### File Naming Convention

```
roadmap--<product-name>.md
```

- Example: `roadmap--expense-tracker.md`

### File Location

```
project-root/
└── product-documentation/
    ├── product-vision--<product-name>.md
    ├── roadmap--<product-name>.md
    ├── features/
    └── epics/
```

### Guiding Principles

- A roadmap is not a timeline. It contains no dates.
- A roadmap is a single, continuously refined rank-ordered list of Business Value Propositions (BVPs).
- Each BVP corresponds to one epic. The rank order reflects the relative value of delivering that epic given inherently limited resources.
- Rank order is adaptive — it should be revisited every time a new epic is added, and any time market demands shift.
- No BVP with a status other than Executing or Done may be ranked below a BVP that is Executing.
- Once a BVP is Executing, nothing may be inserted above it in the rank order.

### Epic Status Definitions

| Status | Meaning |
|--------|---------|
| Ideation | No epic output file exists yet — the BVP is anticipated but not yet defined |
| Created | The epic output file exists and stories are associated with it |
| Ready | Stories have solution hypotheses and story sizes; epic size is validated |
| Executing | Stories are actively being delivered |
| Done | All stories in the epic are completed |

### Epic Size Scale

T-shirt sizes reflect the relative effort to deliver all stories in the epic:

`xs` · `s` · `m` · `l` · `xl`

The epic output file is the source of record for epic size. If a BVP is in Ideation (no epic file exists), size may be a rough guess. Once the epic file exists, the roadmap must reflect the size from that file.

---

### Document Structure

```markdown
# Roadmap: <Product Name>

**Product Vision:** [<Product Name>](./product-vision--<product-name>.md)

> This roadmap is a rank-ordered list of Business Value Propositions. It contains no dates.
> Re-rank whenever a new epic is added or market priorities shift.
> Nothing may be inserted above an Executing item.

## Business Value Propositions

| Rank | BVP Statement | OKR / KPI | Epic | Size | Status |
|------|--------------|-----------|------|------|--------|
| 1 | <What value is delivered to whom and why it matters> | <OKR or KPI from product vision> | [<Epic Name>](<relative-path>.md) | m | Created |
| 2 | <What value is delivered to whom and why it matters> | <OKR or KPI from product vision> | [<Epic Name>](<relative-path>.md) | — | Ideation |
```

---

## Instructions for AI

> These instructions tell the AI how to conduct the roadmap interview and produce the output document. Apply the Universal Behavioral Rules from SKILL.md throughout — one question, one confirmation, one write at a time.

### Overview

When a user wants to work on the roadmap, your job is to:

1. **Read the product vision** — load KPIs/OKRs and the linked product name.
2. **Read all existing epic files** — load each epic's goal statement, success criteria, size, and status.
3. **Check for an existing roadmap file** — if one exists, load it and apply the Resuming Work rules.
4. **Build or update the rank-ordered BVP list** one entry at a time, enforcing re-ranking rules.
5. **Keep the epic file as source of record** for size and status — sync from it, never override it.

---

### Interview Sequence

---

#### Step 1 — Identify the Product

If not clear from context, ask:
> "Which product's roadmap are we working on?"

- Load the product vision and all epic files for that product.
- Check whether `product-documentation/roadmap--<product-name>.md` already exists.
  - If yes: load it and go to **Resuming an Existing Roadmap** below.
  - If no: proceed to Step 2.

---

#### Step 2 — Create the Roadmap File

Inform the user:
> "I'll create the roadmap file now. It will start empty and we'll add Business Value Propositions one at a time."

- Create `product-documentation/roadmap--<product-name>.md` with the document structure stubbed out.
- Add a reference link to this roadmap in the product vision's **Timeline & Roadmap** section if not already present.

---

#### Step 3 — Add a Business Value Proposition

For each BVP entry, work through the following sub-steps one at a time.

**3a. BVP Statement**

Ask:
> "What value does this epic deliver, to whom, and why does it matter? State it as a business value proposition."

- Summarize the statement and confirm before writing.
- If an epic file already exists for this BVP, suggest pulling language from its goal statement:
  > "The epic goal says: '[goal statement]'. Would you like to use that as the BVP, or phrase it differently?"

**3b. OKR / KPI**

Read the product vision's success metrics. Ask:
> "Which OKR or KPI from the product vision does this BVP advance?"

- Present the list of defined metrics for reference.
- If the user identifies a metric not in the product vision, offer to add it:
  > "That metric isn't in the product vision yet. Would you like to add it there before continuing?"
  - If yes: update the product vision's Success Metrics section, confirm, then continue.
- Confirm the selected metric before writing.

**3c. Link to Epic**

Ask:
> "Does an epic file exist for this BVP?"

- If yes: locate the file, confirm the link, set status to reflect the epic file's current Status field.
- If no: record status as `Ideation` and leave the epic link as `—` (to be updated when the epic is created).

**3d. Epic Size**

- If an epic file exists: read the Epic Size field from the file and use it. Inform the user:
  > "I'm pulling the epic size from the epic file: [size]. This is the source of record."
- If no epic file exists: ask:
  > "Do you have a rough size estimate for this epic? (xs / s / m / l / xl — or skip for now)"
  - If skipped, record `—`.

**3e. Confirm the Full BVP Entry**

Present the complete entry for confirmation before writing:
> "Here is the BVP entry:
> - **Statement**: [statement]
> - **OKR/KPI**: [metric]
> - **Epic**: [link or Ideation]
> - **Size**: [size or —]
> - **Status**: [status]
>
> Does this look right?"

Write to the roadmap only after confirmation.

---

#### Step 4 — Re-ranking

After each new BVP is added, present the full current rank-ordered list and trigger a re-ranking review:

> "Here is the current roadmap:
> [numbered list of BVP statements with status]
>
> Given limited resources and current priorities, does this order reflect the right sequence of value delivery? Would you like to change the rank of anything?"

Apply the following constraints when re-ranking:

- **No BVP with status Executing or Done may be moved** — these are locked in place.
- **Nothing may be inserted above an Executing item** — if the user attempts this, flag it:
  > "I can't place this above [BVP name] because it is currently Executing. It can go below the last Executing or Done item. Would you like to place it there?"
- Apply each re-ranking change one at a time, confirming before writing.

---

#### Step 5 — Add Another BVP?

After re-ranking is confirmed, ask:
> "Would you like to add another Business Value Proposition to the roadmap?"

- If yes: return to Step 3.
- If no: proceed to Step 6.

---

#### Step 6 — Review & Close

Once the user is done:

1. Present the final rank-ordered roadmap table.
2. List any entries still in Ideation status — remind the user these need epic files to advance.
3. Ask: *"Is the roadmap ready to save, or would you like to adjust anything?"*
4. Remind the user: *"Re-visit the roadmap rank order whenever a new epic is added or priorities shift."*

---

### Resuming an Existing Roadmap

When a roadmap file already exists:

1. Load the file and read all BVP entries.
2. For each entry that has a linked epic file, read the epic file and check:
   - Has the **Epic Size** changed? If so, update the roadmap entry and inform the user:
     > "The epic size for [Epic Name] has changed to [new size] in the epic file. I've updated the roadmap to match."
   - Has the **Status** changed? Apply the same sync.
3. After syncing, present the current roadmap and ask:
   > "Here is your current roadmap. Would you like to add a new BVP, re-rank existing ones, or make any other changes?"
4. Apply the Universal Behavioral Rules and re-ranking constraints from that point forward.

---

### Editing the Product Vision from the Roadmap Context

If there are no new BVPs to add and no re-ranking needed, ask:
> "Would you like to make any edits to the Product Vision?"

The user may respond with intent to:
- Add or edit an element of the product vision (risk, KPI/OKR, target user, pain, gain, etc.)
- Add or edit a Feature
- Add or edit a Feature Story
- Add or edit an Epic

Load the appropriate template and follow its Instructions for AI, applying Universal Behavioral Rules throughout.
