# Feature Stories Template

---

## Standards

### File Naming Convention

```
story--<action-slug>.md
```

- `<action-slug>` is derived from the `<perform some action>` portion of the story statement
- Use lowercase kebab-case
- Example: "check my used tokens this month" → `story--check-my-used-tokens-this-month.md`

### File Location

Stories live in a subfolder named after their parent feature file, inside `product-management/features/`:

```
product-management/
└── features/
    ├── feature--<product-name>--<feature-name>.md
    └── feature--<product-name>--<feature-name>/
        ├── story--<action-slug>.md
        └── story--<action-slug>.md
```

Example:

```
product-management/
└── features/
    ├── feature--expense-tracker--receipt-capture.md
    └── feature--expense-tracker--receipt-capture/
        ├── story--capture-a-receipt.md
        └── story--review-captured-receipts.md
```

### Relationship to Other Documents

- **Parent**: `feature--<product-name>--<feature-name>.md` — the Stories section links to this story
- **Siblings**: other stories in the same feature folder, or stories in sibling feature folders
- **Inputs**: stories whose outcome this story depends on (linked in the story)
- **Outputs**: stories that depend on this story's outcome (linked in the story)

After a story is created, the parent feature's **Stories** section must be updated with a linked, rank-ordered entry. The user is asked to confirm the ordering each time.

---

### Document Structure

```markdown
# Story: <Story Title>

**Statement:** As a <role>, I need to <perform some action>, so that <I get the desired outcome>.

**Parent Feature:** [<Feature Name>](../../feature--<product-name>--<feature-name>.md)

## Story Title
<action-slug in readable form — same as the <perform some action> portion of the statement>

## Input Stories
*Stories whose outcome this story depends on as a precondition.*

- [<Story Title>](<relative-path-to-story>.md) — <why this story's outcome is needed here>

> If none: None identified.

## Output Stories
*Stories that depend on this story's outcome.*

- [<Story Title>](<relative-path-to-story>.md) — <why this story's outcome feeds that story>

> If none: None identified.

## Acceptance Criteria
*Written in Gherkin format. Each criterion describes a need and a verifiable outcome — not a solution.*

- GIVEN <one or more preconditions> WHEN <an action occurs> THEN <one or more verifiable outcome signals>

## Story Size
> [not yet estimated]

## Solution Hypothesis
> [not yet defined]
```

---

## Instructions for AI

> These instructions tell the AI assistant how to conduct the feature story interview and produce output documents. Apply the Universal Behavioral Rules from SKILL.md throughout — one question, one confirmation, one write at a time.

### Overview

When a user wants to create feature stories, your job is to:

1. **Read the parent feature document** — load acceptance criteria, target users, and pains/gains.
2. **Derive a candidate list of stories** from the feature's acceptance criteria and present them to the user one at a time for confirmation.
3. **Work through each confirmed story individually** using the interview sequence below.
4. **Create the story file** in the correct subfolder as each story is completed.
5. **Update the parent feature's Stories section** after each story, maintaining a rank-ordered linked list.

---

### Phase 1 — Setup

#### Step 1 — Identify the Feature

If not clear from context, ask:
> "Which feature are we writing stories for?"

- Locate `product-management/features/feature--<product-name>--<feature-name>.md`.
- Read it fully: acceptance criteria, target users, pains/gains, and existing Stories section.
- Create the story subfolder if it does not exist:
  `product-management/features/feature--<product-name>--<feature-name>/`

#### Step 2 — Derive Candidate Stories

Review the feature's acceptance criteria. Identify distinct user needs — each need that can be independently delivered is a candidate story.

Present the candidate list to the user:
> "Based on the acceptance criteria for [Feature Name], here are the candidate stories I see:
> 1. [candidate story statement]
> 2. [candidate story statement]
>
> Does this list look right? Would you add, remove, or reframe any of these?"

Confirm or adjust the list before proceeding. Do not start writing story files yet.

---

### Phase 2 — Story Interview (repeat for each confirmed story)

Work through one story at a time. Complete each story fully before moving to the next.

#### Step 3 — Story Statement

Present the candidate story statement derived from the acceptance criteria:
> "Here is a draft story statement: 'As a [role], I need to [action], so that [outcome].' Does this capture it correctly, or would you like to adjust it?"

- Confirm the role matches a persona from the product vision.
- Ensure the statement describes a **need**, not a solution.
- If the statement implies a solution (e.g., "I need a button to..."), flag it and reframe: *"Let's keep this focused on the need — what does the user need to accomplish, not how?"*
- Derive the `<action-slug>` from the confirmed action phrase.
- Once confirmed, create the story file stub at the correct path.

#### Step 4 — Input Stories

Ask:
> "Does this story depend on the outcome of any other story as a precondition?"

If yes, present a list of sibling stories from this feature's folder and stories from sibling features:
> "Here are the other stories I can see: [list]. Which of these feed into this one?"

- For each identified input story, confirm: *"[Story title] — is that right?"*
- Capture each as a linked entry with a one-line reason.

If none, record `> If none: None identified.`

#### Step 5 — Output Stories

Ask:
> "Does any other story depend on the outcome of this story as a precondition?"

Present the same sibling story list as above for reference.

- For each identified output story, confirm one at a time.
- Capture each as a linked entry with a one-line reason.

If none, record `> If none: None identified.`

#### Step 6 — Acceptance Criteria

Work through acceptance criteria one at a time.

For the first criterion, ask:
> "Let's define the acceptance criteria. What is the first condition that must be true for this story to be considered done? Think about: what state must the system or user be in, what action triggers the need, and what verifiable signal tells us it worked."

After each answer:

1. Draft a Gherkin statement:
   `GIVEN <preconditions> WHEN <action> THEN <verifiable outcome signals>`
2. Present it to the user for confirmation.
3. Check: does it describe a **need and outcome**, not a solution? If it implies implementation detail, flag and reframe before confirming.
4. Ask: *"Is there anything missing from this criterion — additional preconditions, actions, or outcome signals?"* Add them one at a time.
5. Once confirmed, write it to the file.

Then ask:
> "Is there another acceptance criterion for this story?"

Repeat until the user indicates no more criteria are needed.

**Robustness check**: Before closing out acceptance criteria, review all criteria together and ask:
> "Looking at these criteria together — do they cover the edges? For example, what happens if a precondition isn't met, or if the action partially fails?"

Surface any gaps as suggested additional criteria, one at a time, for the user to accept or decline.

#### Step 7 — Story Size & Solution Hypothesis

Inform the user:
> "I've left placeholders for Story Size and Solution Hypothesis — we won't fill those in now. They'll be addressed later."

Write the placeholders to the file as-is.

#### Step 8 — Update the Parent Feature

After the story file is saved:

1. Open the parent feature document.
2. Add the new story to the **Stories** section as a linked entry:
   `[<Story Title>](<feature-name>/<story-slug>.md)`
3. Present the full updated Stories list:
   > "Here is the updated story list for [Feature Name]. These should be ordered by delivery priority — would you like to reorder anything?"
4. Apply any reordering and save the feature document.

---

### Phase 3 — Wrap Up

After all confirmed stories are complete:

1. Present a summary: stories created, any `[needs clarification]` markers, and the final rank-ordered list in the parent feature.
2. Ask: *"Are there any other stories you'd like to add for this feature, or are we done here?"*
3. If done, remind the user: *"When you're ready to group stories into a deployable release, use the epic template."*
