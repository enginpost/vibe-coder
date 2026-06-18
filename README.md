# vibe-coder

A set of Claude Code skills that bring a product-centric design approach to software development. Rather than jumping straight into code, vibe-coder guides you through a structured discovery and planning process — building a ranked backlog, decomposing it into epics, planning releases, and then executing them with Claude Code one phase at a time.

## What it does

vibe-coder installs eight interlinked skills into any Claude Code project. Together they walk you from a raw product idea all the way through shipping — capturing the vision, discovering features, writing user stories, building a rank-ordered roadmap, composing epics, defining the architecture, planning iterations, and finally executing each phase with Claude as your AI developer.

Each skill produces structured Markdown documents in a `product-documentation/` folder. Those documents become the shared context that later skills depend on, so the workflow is always grounded in decisions you have already made and confirmed.

## Installation

**1. Clone this repository to a permanent location on your machine.**

Pick somewhere you are happy to keep it — the install script is referenced by path each time you add it to a new project.

```bash
git clone https://github.com/your-org/vibe-coder.git ~/tools/vibe-coder
```

**2. Open your project in Claude Code and run the install script from the project root.**

In the Claude Code terminal, `cd` to your project and call the `install.sh` from wherever you cloned this repo:

```bash
cd ~/your-project
bash ~/tools/vibe-coder/install.sh
```

The script copies the skills into `.claude/skills/` and creates an empty `product-documentation/` folder. It never overwrites an existing `product-documentation/` directory.

**3. Restart Claude Code.**

Close and reopen Claude Code (or reload the window) so it picks up the newly installed skills. After restart the skills are available as slash commands — type `/vibe:1-product-discovery` to begin.

---

## The Skills

The eight skills are numbered and ordered. Each skill depends on the outputs of the ones before it. Work through them in sequence — the dependency checks built into each skill will stop you and point back if a prerequisite is missing.

### Step 1 — `/vibe:1-product-discovery`

**Purpose:** Create the product vision document.

This is the starting point. The skill interviews you one question at a time — problem statement, target personas, pains and gains, success metrics, scope, and constraints — and writes a confirmed `product-vision--<product-name>.md` file. If you return to the skill later it scans for incomplete sections and asks whether you want to fill them in or make changes.

**Output:** `product-documentation/product-vision--<product-name>.md`

---

### Step 2 — `/vibe:2-feature-discovery`

**Purpose:** Define individual features from the product vision.

For each feature you want to explore, the skill reads the product vision to infer personas and context, then walks you through the feature's value proposition, target users, and acceptance conditions. Each confirmed feature gets its own file and is registered in the Scope section of the product vision.

**Output:** `product-documentation/features/feature--<product-name>--<feature-name>.md`  
**Also updates:** Product vision (Scope section)

---

### Step 3 — `/vibe:3-feature-decomposition`

**Purpose:** Write user stories for a feature.

You pick a feature; the skill decomposes it into user stories, each with a role, need, and outcome statement plus acceptance criteria. Stories describe needs and outcomes — not solutions. The skill flags and reframes any story that drifts into implementation detail. Stories are saved as individual files and listed back in the parent feature document.

**Output:** `product-documentation/features/feature--<product-name>--<feature-name>/<story-slug>.md`  
**Also updates:** Parent feature file (Stories section)

---

### Step 4 — `/vibe:4-roadmap-management`

**Purpose:** Build and maintain the rank-ordered product roadmap.

The roadmap is a prioritized list of Business Value Propositions (BVPs) — each representing a planned epic. You add BVPs, set their status, and rank them. The skill enforces strict ordering rules: in-progress and completed BVPs are locked in place, nothing can be inserted above an executing BVP, and the list stays as a single continuous rank order with no tiers. Once epic plans exist, their phases appear as nested checklist entries beneath each BVP row.

**Output:** `product-documentation/roadmap--<product-name>.md`  
**Also updates:** Product vision (Timeline & Roadmap section)

---

### Step 5 — `/vibe:5-epic-composition`

**Purpose:** Create an epic document from a roadmap BVP.

The skill identifies BVPs on the roadmap that do not yet have a corresponding epic file and presents them as candidates. You confirm which stories from the feature backlog belong in the epic. Stories are ordered by feature rank and then by story rank within each feature. After the epic is saved, each included story file is annotated with a back-link to the epic.

**Output:** `product-documentation/epics/epic--<product-name>--<epic-name>.md`  
**Also updates:** Roadmap (epic link and status), included story files (Epic Association section)

---

### Step 6 — `/vibe:6-solution-architecture-planning`

**Purpose:** Define and maintain the solution architecture.

This is the living record of all technology decisions: runtime, frameworks, data stores, integrations, deployment targets, and constraints. The skill reads the product vision first to inform its questions. Every decision is logged with a date and reason. The document is never replaced — only amended — so the history of architectural choices is always preserved. Later skills gate on this document before writing any implementation hypothesis.

**Output:** `product-documentation/solution-architecture--<product-name>.md`

---

### Step 7 — `/vibe:7-iteration-planning`

**Purpose:** Refine epic stories and build a phased execution plan.

Working from the topmost unstarted epic on the roadmap, the skill walks through each story to agree on a solution hypothesis, then groups stories into phases and builds a task list for each phase. Human tasks (decisions, credentials, approvals, setup) are always listed first within a phase before any AI tasks. If a story requires a technology decision not yet in the solution architecture, the skill pauses and adds it before continuing. The epic plan is the direct input to execution.

**Output:** `product-documentation/epics/epic-plan--<product-name>--<epic-name>.md`  
**Also updates:** Epic file (size and status → Ready), roadmap (phases nested under BVP), story files (solution hypothesis and size), solution architecture (any new decisions)

---

### Step 8 — `/vibe:8-product-iteration`

**Purpose:** Execute the next epic plan phase, one task at a time.

This is where Claude writes code. It picks up the topmost Ready or Executing epic, identifies the next incomplete phase, and works through its task list in order. Human tasks are surfaced and waited on before any AI task that depends on them. AI tasks are announced, executed, and checked off before moving on. If a new technology decision surfaces mid-execution, the skill pauses and updates the solution architecture before resuming. Each phase ends with a summary of what was built and how to verify it. The next phase does not start until you ask.

**Input:** `product-documentation/epics/epic-plan--<product-name>--<epic-name>.md`  
**Also updates:** Epic plan (task checkboxes), roadmap (phase and epic status)

---

## Document structure

All outputs land under `product-documentation/` in your project:

```
product-documentation/
  product-vision--<product>.md
  roadmap--<product>.md
  solution-architecture--<product>.md
  features/
    feature--<product>--<feature>.md
    feature--<product>--<feature>/
      <story-slug>.md
  epics/
    epic--<product>--<epic>.md
    epic-plan--<product>--<epic>.md
```

## Updating

When a new version of vibe-coder is available, pull the latest changes to your local clone and re-run the installer from your project root:

```bash
cd ~/tools/vibe-coder
git pull

cd ~/your-project
bash ~/tools/vibe-coder/install.sh
```

The installer only writes to `.claude/skills/` and will create `product-documentation/` if it does not exist. It will never overwrite or delete anything in `product-documentation/`, so your existing vision documents, features, epics, and plans are safe. Restart Claude Code after updating to load the new skill versions.

---

## How the skills connect

```
product-discovery
    └── feature-discovery
            └── feature-decomposition
                    └── roadmap-management
                            └── epic-composition
                                    └── solution-architecture-planning
                                            └── iteration-planning
                                                    └── product-iteration
```

Each skill checks that its upstream documents exist before starting. If they are missing it tells you exactly which skill to run first.
