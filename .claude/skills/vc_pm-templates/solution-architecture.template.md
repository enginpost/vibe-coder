# Solution Architecture Template

---

## Standards

### File Naming Convention

```
solution-architecture--<product-name>.md
```

- Example: `solution-architecture--expense-tracker.md`

### File Location

```
project-root/
└── product-documentation/
    ├── product-vision--<product-name>.md
    ├── solution-architecture--<product-name>.md
    └── ...
```

### Purpose

This is a living product-level document. It captures all technology decisions that apply across the entire product. Every story solution hypothesis must be consistent with this document. When a new technology decision is required during story refinement, this document is updated first and the story hypothesis reflects the updated decision.

This document is the source of record for all technology standards. It is never deleted — only amended.

---

### Document Structure

```markdown
# Solution Architecture: <Product Name>

**Product Vision:** [<Product Name>](./product-vision--<product-name>.md)

> This is a living document. Update it whenever a new technology decision is made during story refinement. All solution hypotheses must be consistent with this document.

## Deployment Context
- **App type**: <desktop / web / mobile / cloud / hybrid>
- **Hosting**: <local / self-hosted / cloud provider / serverless>
- **Target environments**: <development / staging / production>

## Languages & Runtimes
- <Language and version — e.g., TypeScript 5.x, Python 3.12>

## Frontend
- **Framework**: <e.g., Next.js, React, Vue, none>
- **Styling**: <e.g., Tailwind CSS, custom CSS, CSS Modules>
- **UI component library**: <e.g., shadcn/ui, MUI, none>
- **UX standards**: <any interaction or accessibility standards>

## Backend
- **Framework**: <e.g., Express, FastAPI, Next.js API routes, none>
- **API style**: <REST / GraphQL / tRPC / none>
- **AI integration**: <none / API calls / long-running agents / embedded models>

## Data
- **Database technology**: <e.g., PostgreSQL, SQLite, MongoDB, none>
- **ORM / query layer**: <e.g., Prisma, Drizzle, SQLAlchemy, none>
- **Data structures**: <key shared data models or schemas — updated as defined>

## Security
- **Authentication**: <e.g., NextAuth, Clerk, JWT, none>
- **Authorization model**: <e.g., role-based, attribute-based, none>
- **Standards**: <any compliance or security requirements>

## Testing
- **Unit testing**: <e.g., Jest, Vitest, pytest>
- **Integration testing**: <e.g., Supertest, Playwright>
- **Test strategy**: <e.g., test-driven, coverage thresholds>

## Developer Workflow
- **Version control**: <e.g., Git — branching strategy>
- **Branch naming convention**: <e.g., story/<action-slug>>
- **CI/CD**: <e.g., GitHub Actions, none>

## Decision Log
*Record significant technology decisions and the reason they were made. Append — never delete.*

| Date | Decision | Reason |
|------|----------|--------|
| <date> | <what was decided> | <why> |
```

---

## Instructions for AI

> These instructions tell the AI how to create and maintain the Solution Architecture document. Apply Universal Behavioral Rules from SKILL.md throughout — one question, one confirmation, one write at a time.

### Overview

When a user says "let's define our solution architecture" or when no solution architecture document exists and story refinement is about to begin, your job is to:

1. Check whether `product-documentation/solution-architecture--<product-name>.md` already exists.
2. If it exists: load it, present a summary, and ask if the user wants to review or update any section.
3. If it does not exist: conduct the creation interview below.

---

### Creation Interview

Read the product vision first to understand the product context before asking any questions.

Work through each section of the document one question at a time. For each decision:

1. Ask the question.
2. Summarize the answer.
3. Confirm with the user.
4. Write the confirmed decision to the file.

Suggested question sequence:

**Deployment Context**
> "What kind of app is this — desktop, web, mobile, cloud-hosted, or some combination?"

**Languages & Runtimes**
> "What programming language or languages will this product be built in?"

**Frontend**
> "Does this product have a user interface? If so, what frontend framework and styling approach are you planning to use?"

**Backend**
> "What does the backend look like — framework, API style, and any AI integration?"

**Data**
> "What database technology will you use, and how will the app talk to it?"

**Security**
> "How will authentication and authorization work? Are there any compliance or security standards to follow?"

**Testing**
> "What testing tools and strategy will you use?"

**Developer Workflow**
> "What's your branching strategy and CI/CD setup, if any?"

After all sections are confirmed, add an initial entry to the Decision Log with today's date summarizing the initial architecture choices.

---

### Updating During Story Refinement

When a story's solution hypothesis requires a technology decision not already captured in this document:

1. Pause the story refinement.
2. Inform the user:
   > "This story requires a decision about [topic] that isn't in the solution architecture yet. Let's add it before continuing."
3. Ask the relevant question, confirm the answer, and write it to the solution architecture document.
4. Add an entry to the Decision Log with the date, decision, and reason.
5. Resume story refinement with the updated architecture as context.
