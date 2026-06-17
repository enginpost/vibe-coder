# Feature Template

---

## Standards

### File Naming Convention

```
feature--<product-name>--<feature-name>.md
```

- Use lowercase kebab-case for both `<product-name>` and `<feature-name>`
- Example: `feature--expense-tracker--receipt-capture.md`

### File Location

Completed feature documents are created in `product-management/features/`, with a same-named subfolder for that feature's stories:

```
project-root/
└── product-management/
    ├── product-vision--<product-name>.md
    └── features/
        ├── feature--<product-name>--<feature-name>.md
        └── feature--<product-name>--<feature-name>/
            └── story--<action-slug>.md
```

### Relationship to Other Documents

- **Parent**: `product-vision--<product-name>.md` — the Scope section links to this feature
- **Children**: `feature--<product-name>--<feature-name>/<story-slug>.md` — stories derived from this feature's acceptance criteria, created using the feature-stories template

After a feature document is created, the parent product vision's **Scope** section must be updated to include an ordered, linked list of all features. The user is asked to review and confirm the order by relative importance.

---

### Document Structure

```markdown
# Feature: <Feature Name>

**Product:** [<Product Name>](../product-management/product-vision--<product-name>.md)

## Description
<What this feature does and why it exists.>

## Target Users
<Which personas from the product vision this feature serves.>
- <Role Title> — <why this feature matters to them>

## Pains & Gains Addressed
*Ordered by priority. Drawn from product vision personas.*

1. <Pain decreased or gain increased by this feature>
2. <Pain decreased or gain increased by this feature>

## Acceptance Criteria

### Intended Outcomes
- <What success looks like when this feature is working as intended>

### Service Boundaries
**In scope**
- <What this feature does>

**Out of scope**
- <What this feature explicitly does not do>

### Functional Expectations
- <Specific behaviors the feature must exhibit>

### Non-Functional Expectations
- <Performance, reliability, security, accessibility, or other quality requirements>

## Stories
*Populated after feature-stories are defined. Ordered by delivery priority.*

> No stories defined yet. See: [feature-stories.template.md](.claude/skills/product-management/md-templates/feature-stories.template.md)
```

---

## Instructions for AI

> These instructions tell the AI assistant how to conduct the feature interview and produce the output document.

### Overview

When a user wants to create or update a feature, your job is to:

1. **Read the product vision** first — load `product-management/product-vision--<product-name>.md` to understand existing personas, pains/gains, and the current scope list.
2. **Identify whether this is a new feature or an update** to an existing one — present the contrast to the user and confirm before proceeding.
3. **Interview one question at a time**, waiting for each response.
4. **Immediately create** the output file `product-management/feature--<product-name>--<feature-name>.md` once the feature name is confirmed, and **continuously update it** as answers come in.
5. After saving the feature, **update the product vision Scope section** with a linked entry and ask the user to confirm the ordering.
6. When answers are vague, ask one follow-up. If still vague, insert `> [needs clarification]` and move on.

---

### Interview Sequence

---

#### Step 1 — Identify the Product

If not already known from context, ask:
> "Which product is this feature for?"

- Locate the corresponding `product-vision--<product-name>.md` in `product-management/`.
- Read it fully before continuing — you will use it throughout this interview.

---

#### Step 2 — New Feature or Update to Existing?

Read the current Scope section of the product vision. List any features already documented.

Present to the user:
> "Here are the features already defined for <Product Name>:
> [numbered list of existing features, or 'none yet' if empty]
>
> Is what you have in mind a new feature, or does it relate to one of these existing features?"

- If **new feature**: proceed to Step 3.
- If **update to existing**: ask which feature, load that feature file, and work with the user to update it. Skip the creation steps and go directly to whichever section needs updating.

---

#### Step 3 — Feature Name & Description

Ask:
> "What would you call this feature? Give it a short name."

Then:
> "Describe what this feature does and why it exists — a few sentences is fine."

- Confirm the name is meaningfully distinct from existing features.
- Create the file `product-management/features/feature--<product-name>--<feature-name>.md` with the full structure stubbed out.

---

#### Step 4 — Target Users

Review the personas defined in the product vision.

Present them to the user:
> "The product vision defines these users: [list persona role titles]. Which of these does this feature serve?"

For each confirmed user:
> "How does this feature matter specifically to <Role>? What does it change for them?"

- Capture as: `<Role Title> — <why this feature matters to them>`

---

#### Step 5 — Pains & Gains Addressed

Review the pains and gains for the relevant personas in the product vision.

Propose a list:
> "Based on the pains and gains for [relevant users], here are the ones this feature seems to address: [list]. Does this look right? Would you add or remove anything?"

Once confirmed, ask:
> "How would you order these by priority for this feature — most important first?"

- Capture as a numbered ordered list.

---

#### Step 6 — Acceptance Criteria

Work through each subsection one at a time.

**6a. Intended Outcomes**
> "When this feature is working as intended, what does success look like? What should be true that isn't true today?"

**6b. Service Boundaries — In Scope**
> "What specifically will this feature do? Be as concrete as you can."

**6c. Service Boundaries — Out of Scope**
> "What should this feature explicitly NOT do — either now or ever? What's outside its boundary?"

**6d. Functional Expectations**
> "What specific behaviors must this feature exhibit? Think about user interactions, system responses, or data handling."

**6e. Non-Functional Expectations**
> "Are there any quality requirements — performance, reliability, security, accessibility, or compliance — that apply to this feature?"

For each subsection, if the answer is vague, follow up once. If still vague, add `> [needs clarification]` and continue.

---

#### Step 7 — Update the Product Vision Scope

After the feature document is saved:

1. Open `product-management/product-vision--<product-name>.md`.
2. Add the new feature to the **Scope** section as a linked entry:
   `[<Feature Name>](feature--<product-name>--<feature-name>.md)`
3. Present the full updated Scope list to the user:
   > "Here is the updated feature list for <Product Name>. Please review the order — features should be ordered by relative importance for delivery. Would you like to reorder anything?"
4. Apply any reordering the user requests and save the product vision.

---

#### Step 8 — Review & Close

Once all sections are complete:

1. Summarize what was captured.
2. List any `[needs clarification]` markers that remain.
3. Ask: *"Would you like to work through any unclear items now, or is this feature ready to save as a draft?"*
4. Remind the user: *"When you're ready to define stories for this feature, use the feature-stories template."*
