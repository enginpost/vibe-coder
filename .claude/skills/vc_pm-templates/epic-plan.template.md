# Epic Plan Template

---

## Standards

### File Naming Convention

```
epic-plan--<product-name>--<epic-name>.md
```

- Example: `epic-plan--expense-tracker--v1.md`

### File Location

```
project-root/
└── product-documentation/
    └── epics/
        ├── epic--<product-name>--<epic-name>.md        ← definition (unchanged)
        └── epic-plan--<product-name>--<epic-name>.md   ← execution plan (this file)
```

### Purpose

The Epic Plan is the planning companion to the Epic definition file. It is created when story refinement begins and is complete when the epic reaches Ready status. It contains:

- Story refinement details (solution hypotheses, story sizes)
- Phase groupings of rank-ordered stories
- Task lists per phase (human tasks front-loaded, AI tasks following)

The Epic definition file remains the source of record for what the epic *is*. The Epic Plan defines how it will be delivered. Execution is handled by a separate skill.

### Epic Status Transitions

| Transition | Trigger |
|---|---|
| Created → Ready | All stories in the epic have an approved solution hypothesis and story size, and phases are confirmed |
| Ready → Executing | Execution skill begins delivering the first phase *(handled by a future execution skill)* |
| Executing → Done | All phases complete *(handled by a future execution skill)* |

---

### Document Structure

```markdown
# Epic Plan: <Epic Name>

**Epic:** [<Epic Name>](./epic--<product-name>--<epic-name>.md)
**Solution Architecture:** [<Product Name>](../solution-architecture--<product-name>.md)
**Status:** <Created / Ready>

---

## Story Refinements

*One entry per story. Complete all refinements before moving to phases.*

### <Story Title>
**Story:** [<Story Title>](../features/<feature-name>/<story-slug>.md)
**Size:** <xs / s / m / l / xl>

**Solution Hypothesis:**
I believe if I do the following I will achieve the acceptance criteria for this story:
- [ ] <Set up technology prerequisites or framework instances if needed>
- [ ] <Design data structures>
- [ ] <Create database / add tables if a DB already exists>
- [ ] <Human task: [action required from human before AI can proceed]>
- [ ] <Write tests based on acceptance criteria>
- [ ] <Write code to pass the tests>
- [ ] <Update the Epic Review report>
- [ ] <Any additional AI tasks>

---

## Phases

*Phases group rank-ordered stories into logical delivery chunks. Approved by user before execution begins.*

### Phase <N>: <Phase Name>

**Goal:** <What this phase delivers as a coherent outcome>
**Stories included:**
- [<Story Title>](../features/<feature-name>/<story-slug>.md)

#### Human Tasks
*Complete these before AI execution begins for this phase.*

- [ ] <Human decision or action required>
- [ ] <Human decision or action required>

#### AI Tasks
- [ ] <AI task derived from story solution hypotheses>
- [ ] <AI task>

---

## Epic Size Validation
*Updated once all story sizes are confirmed.*

**Validated Epic Size:** <xs / s / m / l / xl>
> Update the epic file and roadmap to reflect this validated size.
```

---

## Instructions for AI

> These instructions tell the AI how to create and maintain the Epic Plan. Apply Universal Behavioral Rules from SKILL.md throughout — one question, one confirmation, one write at a time.

### Overview

The Epic Plan is worked through in two sequential phases:

1. **Refinement** — refine each story (solution hypothesis + size); advance epic to Ready
2. **Phase Planning** — group stories into phases, front-load human tasks, confirm with user

This template does not cover execution. When the epic plan is complete and the epic is Ready, a separate execution skill will take over.

---

### Phase 1 — Story Refinement ("Let's update the Product Roadmap Plan")

#### Step 1 — Setup

- Load the epic file: confirm the story list and current status.
- Load the solution architecture document. If it does not exist, stop and tell the user:
  > "There is no Solution Architecture document for this product yet. Let's define that first before refining stories."
  Then follow the solution-architecture template instructions.

#### Step 2 — Refine Each Story (one at a time)

For each story in the epic's rank-ordered Stories list:

**2a. Load the story file**
Read the story statement, acceptance criteria, input stories, and output stories.

**2b. Check solution architecture alignment**
Review the solution architecture document. If the story requires a technology decision not yet captured:
- Pause refinement.
- Inform the user and add the decision to the solution architecture document first.
- Resume refinement.

**2c. Propose solution hypothesis**
Draft a solution hypothesis using this structure and present it for confirmation:

> "I believe if I do the following I will achieve the acceptance criteria for this story:
> - [prerequisite setup if needed]
> - [data structure design]
> - [database / schema changes]
> - [new development branch]
> - [human tasks — decisions or actions needed before AI can proceed]
> - [write tests based on acceptance criteria]
> - [write code to pass the tests]
> - [update Epic Review report]
> - [any additional steps]
>
> Does this hypothesis look right, or would you like to adjust it?"

Confirm before writing to the story file and the Epic Plan.

**2d. Story size**
Ask:
> "Given this solution hypothesis, what size is this story? (xs / s / m / l / xl)"

Confirm and write to both the story file and the Epic Plan.

**2e. Advance to next story**
Once hypothesis and size are confirmed and written, move to the next story.

#### Step 3 — Validate Epic Size

Once all stories are refined:
- Sum the story sizes to inform an overall epic size estimate.
- Present to the user:
  > "With all stories refined, I'd suggest the overall epic size is [size] based on the story breakdown. Does that feel right?"
- Confirm and write the validated size to:
  - The Epic Plan (`## Epic Size Validation`)
  - The epic definition file (`## Epic Size`)
  - The roadmap entry for this epic

#### Step 4 — Advance Epic to Ready

Update the epic file Status field from `Created` to `Ready`.
Update the roadmap entry status to `Ready`.

---

### Phase 2 — Phase Planning

#### Step 5 — Derive Phase Groupings

Review all story solution hypotheses, input/output story links, and story ranks. Propose logical phase groupings:

- Group stories that share prerequisites or whose outputs feed into each other
- Aim for phases that deliver a coherent, demonstrable outcome
- Present the proposed phases one at a time for user confirmation:
  > "I'd suggest Phase 1 includes [Story A] and [Story B] because [reason]. Does that work, or would you like to adjust the grouping?"

#### Step 6 — Front-load Human Tasks

For each confirmed phase:
- Review all solution hypotheses for human tasks (decisions, approvals, environment setup, credentials, etc.)
- Collect all human tasks for the phase and list them first in the task list
- Present the full phase task list for confirmation:
  > "Here are the tasks for Phase [N]. Human tasks are listed first so they can be completed before AI execution begins. Does this look right?"

Confirm before writing each phase to the Epic Plan.

#### Step 7 — Confirm Phase Rank Order

Present the full phase list:
> "Here is the proposed phase order: [list]. Does this sequence make sense, or would you like to reorder anything?"

Confirm and write the final phase structure to the Epic Plan.
Update the roadmap with the confirmed phases as nested checklist entries under this epic's BVP entry.

---

### Close

Once phases are confirmed and written:

1. Update the epic file Status to `Ready`.
2. Update the roadmap BVP entry status to `Ready` and sync the validated epic size.
3. Summarize: stories refined, phases created, total tasks, any `[needs clarification]` markers.
4. Tell the user: *"This epic is now Ready. When you're ready to begin execution, use the Execution skill (coming soon)."*
