# Product Vision Template

---

## Standards

### File Naming Convention

```
product-vision--<product-name>.md
```

- Use lowercase kebab-case for `<product-name>` (e.g., `product-vision--expense-tracker.md`)
- Replace spaces with hyphens; omit special characters

### File Location

Completed product vision documents are created in a subfolder named `product-documentation/` within the project root. Templates are stored in `.claude/skills/vc_pm-templates/`.

```
project-root/
└── product-documentation/
    └── product-vision--<product-name>.md
```

### Related Documents

The following templates extend this document and should be created after the product vision is complete:

| Document | Template | Links from |
|---|---|---|
| Feature Definition | `feature.template.md` | Scope section |
| Feature Stories | `feature-stories.template.md` | Feature documents |
| Epics | `epic.template.md` | Feature stories |
| Roadmap | `roadmap.template.md` | Timeline section |

---

### Document Structure

A completed product vision document follows this structure:

```markdown
# Product Vision: <Product Name>

## Problem Statement
<What problem exists, for whom, and why it matters now.>

## Target Users

### <Role Title>
**Differentiators**
- <Attribute or behavior that makes this user distinct>
- <Attribute or behavior that makes this user distinct>

**Pains & Gains** *(ordered by priority)*
1. <Gain they want more of / Pain they want less of>
2. <Gain they want more of / Pain they want less of>

### <Role Title>
...

## Value Proposition
<How this product increases a positive gain or decreases a negative pain for target users.>

## Success Metrics
- <KPI or OKR — business-oriented metric that validates value>
- <KPI or OKR>

## Scope

*Ordered by anticipated priority. Each item represents a potential feature area.*

1. <High-level service or capability the product provides>
2. <High-level service or capability the product provides>

## Assumptions & Risks

**Assumptions**
- <Something believed to be true that has not been validated>

**Risks**
- <Something that could prevent success or require a pivot>

## Stakeholders
- <Name or role> — <relationship to product>

## Roadmap
> See: [Roadmap](../product-documentation/roadmap--<product-name>.md)
```

---

## Instructions for AI

> These instructions tell the AI assistant how to conduct the product vision interview and produce the output document.

### Overview

When a user wants to create a product vision, your job is to:

1. Interview them **one question at a time**, waiting for each response before continuing.
2. **Immediately create** the output file `product-documentation/product-vision--<product-name>.md` after learning the product name, and **continuously update it** as answers come in.
3. When answers are vague, **ask one follow-up** for clarification. If they decline or remain vague, insert a `> [needs clarification]` marker in the relevant section and move on.
4. At the start of any session where a draft already exists, **scan for `[needs clarification]` markers** and offer to work through them before continuing.

---

### Interview Sequence

Follow this order. Do not skip ahead or combine questions.

---

#### Step 1 — Product Name

Ask:
> "What is the name of this product?"

- Use the answer to name the output file immediately: `product-vision--<product-name>.md`
- Create the file in `product-documentation/` with the full document structure stubbed out.

---

#### Step 2 — Problem Statement

Ask:
> "What problem does this product solve, and for whom? Why does it matter now?"

- Encourage specificity: who is affected, what the current situation is, and what changes if this problem is solved.
- If the answer is vague, follow up once: *"Can you say more about who specifically experiences this, or what triggers the problem?"*
- Write the answer into the **Problem Statement** section.

---

#### Step 3 — Target Users (repeat for each user type)

Ask:
> "Who are the different types of users for this product? List each role or user type — just the titles for now."

Then, for each user type, ask in sequence:

**3a. Differentiators**
> "What makes <Role> different from your other users? Think about their technical ability, access level, goals, or behaviors that would affect how the product works for them."

- Capture as an unordered list of attributes or behaviors.

**3b. Pains & Gains**
> "For <Role>, list the outcomes they most want — more of something good, or less of something bad. Order them from most to least important to them."

- Capture as a numbered list (1 = highest priority).
- Label implicitly as a gain ("more of...") or pain ("less of...") based on phrasing.

Repeat 3a–3b for each user type before moving on.

---

#### Step 4 — Value Proposition

After all users and their pains/gains are captured:

> "Based on what you've told me, here is a draft value proposition: [draft a sentence or two from the pains/gains]. Does this capture it, or would you like to refine it?"

- Synthesize from the pains and gains already captured.
- Let the user confirm, edit, or replace it.
- Write into the **Value Proposition** section.

---

#### Step 5 — Success Metrics

Ask:
> "What business metrics would tell you this product is succeeding? Think about what you'd measure to validate the value proposition."

- Capture as an unordered list.
- If none are offered, prompt: *"For example, would you measure adoption rate, cost reduction, time saved, revenue generated, or customer satisfaction?"*

---

#### Step 6 — Scope

After pains and gains are captured for all users, perform an affinity grouping:

- Review all pains and gains across users.
- Identify clusters that represent a distinct product capability or service.
- Present the proposed groupings to the user:
  > "Based on your users' needs, here are potential feature areas I see: [list]. Does this feel right, or would you add, remove, or rename any?"

- Capture confirmed items as a numbered ordered list in **Scope**.
- Remind the user: *"Each of these will become a Feature document later using the feature template."*

---

#### Step 7 — Assumptions & Risks

Ask:
> "What are you assuming to be true that hasn't been validated yet?"

Then:
> "What could go wrong, or what might force a significant change in direction?"

- Capture assumptions and risks as separate unordered lists.

---

#### Step 8 — Stakeholders

Ask:
> "Who are the key stakeholders for this product? Include anyone who influences, funds, uses, or is accountable for it."

- Capture as: `Name or Role — relationship to product`

---

#### Step 9 — Roadmap Placeholder

Do not ask the user any questions for this step.

- Write the **Roadmap** section with only the placeholder link: `See: [Roadmap](../product-documentation/roadmap--<product-name>.md)`
- Leave no other content under this section — it will be populated when running the roadmap-management skill.

---

#### Step 10 — Review & Close

Once all sections are complete:

1. Present a brief summary of what was captured.
2. List any `[needs clarification]` markers that remain.
3. Ask: *"Would you like to work through any of the unclear items now, or is this document ready to save as a draft?"*
4. Confirm the file is saved at the correct path.
