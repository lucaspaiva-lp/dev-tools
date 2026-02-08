# Software Development Lifecycle (SDLC)

## Documentation-Oriented View (End-to-End)

This model describes  **what must be documented, when, and why**, independent of technology choices (with or without database).

---

## 1. Conception / Initiation

### Goal

Define  **why the system should exist**.

### Mandatory Documentation

**`README.md` — Project Intent**

### Content

* Problem statement
* Project purpose
* Target users or systems
* High-level exclusions (what the system is not)

### Role in SDLC

Establishes the **conceptual foundation** of the system.

All later decisions must align with this intent.

---

## 2. Requirements Definition

### Goal

Define  **what the system will and will not do**.

### Mandatory Documentation

**`docs/scope.md` — Scope Boundaries**

### Content

* Functional capabilities
* Explicit non-goals
* Assumptions and constraints
* Supported use cases

### Role in SDLC

Prevents ambiguity and scope creep.

Acts as the **functional contract** of the project.

---

## 3. System Design

### Goal

Define **how the system is structured** at a high level.

### Mandatory Documentation

**`docs/architecture.md` — Architecture Direction**

### Content

* Architectural style
* Layer responsibilities
* System boundaries
* Key technical constraints
* Explicit non-decisions

### Role in SDLC

Guides implementation and refactoring.

Preserves architectural intent over time.

---

## 4. Detailed Design (Progressive)

### Goal

Refine decisions as certainty increases.

### Optional / Incremental Documentation

**`docs/decisions/` — Architectural Decision Records (ADRs)**

### Content

* Decision context
* Chosen solution
* Rejected alternatives
* Consequences

### Role in SDLC

Creates  **engineering memory**.

Critical for future evolution and review.

---

## 5. Implementation

### Goal

Translate design into working software.

### Supporting Documentation

**Code + minimal supporting docs**

* Folder responsibility descriptions
* Contribution rules (`CONTRIBUTING.md`, optional)
* Coding constraints and conventions

### Role in SDLC

Ensures consistency and maintainability during development.

---

## 6. Validation & Integration

### Goal

Ensure the system behaves according to defined contracts.

### Documentation Focus

**System Contracts**

* API schemas
* Input/output definitions
* Validation rules
* Error semantics

### Role in SDLC

Acts as the **truth reference** for correct behavior,

independent of storage or infrastructure.

---

## 7. Deployment & Operation

### Goal

Run the system in a controlled environment.

### Documentation (when applicable)

* Configuration assumptions
* Environment constraints
* Operational notes

### Role in SDLC

Supports repeatable and predictable execution.

---

## 8. Evolution & Maintenance

### Goal

Adapt the system safely over time.

### Documentation Updates

* Update scope when behavior changes
* Update architecture when structure changes
* Add decision records for new trade-offs

### Role in SDLC

Keeps documentation aligned with reality.

Prevents architectural drift.

---

## Canonical Mapping (Summary Table)

| SDLC Phase      | Documentation             |
| --------------- | ------------------------- |
| Conception      | README.md                 |
| Requirements    | docs/scope.md             |
| Design          | docs/architecture.md      |
| Detailed Design | docs/decisions/           |
| Implementation  | Code + contribution rules |
| Validation      | Contracts / schemas       |
| Deployment      | Operational notes         |
| Evolution       | Updated docs + decisions  |


# OBRIGATORIOS

## README.md (mandatory)

**Purpose:**

Explains **WHY** the project exists.

**Answers:**

* What problem does this project solve?
* Who is it for?
* What is explicitly out of scope (high level)?

**Role:**

Entry point and context anchor for the entire project.

---

## docs/scope.md

**Purpose:**

Defines **WHAT** the system does and does not do.

**Answers:**

* Supported use cases
* Explicit boundaries
* Assumptions and constraints

**Role:**

Protects against feature creep and ambiguity.

---

## docs/architecture.md

**Purpose:**

Explains **HOW** the system is structured.

**Answers:**

* High-level architecture
* Layer responsibilities
* Core technical decisions and constraints

**Role:**

Records architectural intent so the code remains defensible over time.

---
