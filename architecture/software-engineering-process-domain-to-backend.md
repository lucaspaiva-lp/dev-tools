# Software Engineering Process — From Domain Conception to Implementation

This document describes, in a cohesive and technical manner, the  **classical software engineering workflow** , applied to **domain-oriented backend systems** built on  **relational databases** .

The process is  **not linear** , but iterative and incremental.

Even so, there is a **healthy order** that reduces rework, inconsistency, and fragile decisions.

> The method expresses intent.
>
> The attribute expresses the domain.

---

## Phase 1 — Domain Analysis and Definition

### 1. Domain Analysis

 **Objective** : understand the problem before any technical solution.

Core questions:

* What problem is being solved?
* Which entities exist in the domain?
* Which rules are real and invariant?

Expected outcome:

* Clear domain understanding
* Consistent vocabulary
* Explicit rules

---

### 2. Domain Review

 **Objective** : validate whether the domain understanding is coherent.

Activities:

* Identify conceptual inconsistencies
* Make implicit rules explicit
* Adjust scope

Expected outcome:

* Conceptually stable domain

---

## Phase 2 — Modeling

### 3. Conceptual Model / Domain Model

 **Objective** : represent the domain  **without concern for technology** .

 **Common forms** :

* Entity–Relationship Diagram (ER)
* Textual conceptual model
* Partial UML (only relevant entities and relationships)

 **Notes** :

* Not full UML
* Not implementation
* Used for reasoning and validation

 **Expected outcome** :

* A model that represents the real-world problem domain

---

### 4. Model Validation

 **Objective** : ensure the conceptual model accurately represents the domain.

Key questions:

* Do the entities make sense?
* Are the relationships real?
* Are dependencies mandatory or optional?

Expected outcome:

* Validated conceptual model

---

## Phase 3 — Data Design

### 5. Logical Model → Physical Model

 **Objective** : transform the conceptual model into a database implementation.

Activities:

* Table definitions
* Primary keys (PK)
* Foreign keys (FK)
* Constraints (`NOT NULL`, `UNIQUE`, etc.)

Expected outcome:

* SQL schema consistent with the domain

---

### 6. Schema Validation

 **Objective** : prove that the database functions as a technical contract.

Activities:

* Invalid insert attempts
* Constraint violation tests
* Practical confirmation of integrity

Expected outcome:

* Database actively preventing invalid states

---

### 7. Database as Technical Contract — Documentation

 **Objective** : explain **why** the database was modeled the way it was.

Typical content:

* Constraint justification
* Rules enforced by the database vs. the application
* Modeling trade-offs

Expected outcome:

* Clear, defensible technical documentation

---

## Transition Point

Up to this point, the work is primarily  **definition and design** .

From here onward, **software implementation** begins.

---

## Phase 4 — Backend Implementation

### 8. Backend Infrastructure and Project Setup

 **Objective** : prepare the technical foundation for backend implementation.

This phase establishes the  **operational base of the code** , ensuring the project is:

* reproducible
* organized
* evolvable
* compatible with modern tooling

 **Responsibilities** :

* Creation of isolated virtual environment (`.venv`)
* Dependency and packaging definition (`pyproject.toml`)
* Adoption of `src` layout
* Layer organization:
  * `domain`
  * `repositories`
  * `services`
  * `controllers`
  * `database`
* Explicit Python packages (`__init__.py`)
* Correct import and namespace configuration

 **Must not contain** :

* Business rules
* Domain logic
* SQL or queries
* HTTP endpoints

 **Expected outcome** :

* Installable project (`pip install .`)
* Predictable and stable imports
* Solid base for backend evolution
* Clear separation between infrastructure and business logic

---

### 9. Domain Layer Implementation

 **Objective** : reflect the data model in code.

 **Responsibilities** :

* Domain models (e.g., SQLAlchemy)
* Relationships
* Types and structures

 **Must not contain** :

* Business rules
* Flow logic

---

### 10. Repository Layer

 **Objective** : isolate data persistence.

 **Responsibilities** :

* CRUD operations
* Queries
* Database communication

 **Must not contain** :

* Business rules
* Domain decisions

---

### 11. Service Layer

 **Objective** : centralize system logic.

 **Responsibilities** :

* Business flows
* Validations that do not belong to the database
* Orchestration across repositories

 **Must not contain** :

* HTTP concerns
* Direct database access

---

### 12. Controller / API Layer

 **Objective** : expose the system to the outside world.

 **Responsibilities** :

* HTTP endpoints
* Input validation
* Response codes
* API documentation (Swagger / OpenAPI)

 **Must not contain** :

* Business rules
* Direct database access

---

## Phase 5 — Quality and Evolution

### 13. Automated Testing

 **Objective** : protect system behavior over time.

Common types:

* Unit tests
* Integration tests

Expected outcome:

* Confidence during evolution
* Reduced regressions

---

## Summary

This workflow represents a  **domain-oriented approach** , with the database acting as a  **technical contract** , and the backend built with  **clear separation of responsibilities** .

The proposed order reduces rework, increases architectural coherence, and facilitates long-term evolution.

---

## References

The following references support the concepts, terminology, and practices described in this document, drawn from classical literature and widely accepted sources in software engineering and system architecture:

1. Evans, Eric.  *Domain-Driven Design: Tackling Complexity in the Heart of Software* . Addison-Wesley, 2003.

   Foundational concepts for  **domain analysis** ,  **domain models** , and responsibility separation.
2. Fowler, Martin.  *Patterns of Enterprise Application Architecture* . Addison-Wesley, 2002.

   Basis for  **Repository Pattern** ,  **Service Layer** , and layered organization.
3. Fowler, Martin. “Layers”. martinfowler.com.

   Classical reference on  **Layered Architecture** .
4. Sommerville, Ian.  *Software Engineering* . Pearson, 10th Edition.

   Formal structure of the  **software engineering process** , including analysis, design, implementation, and testing.
5. Elmasri, Ramez; Navathe, Shamkant.  *Fundamentals of Database Systems* . Pearson.

   Conceptual, logical, and physical **database modeling** foundations.
6. PostgreSQL Global Development Group.  *PostgreSQL Documentation* .

   Modern practices for  **constraints** ,  **referential integrity** , and database-enforced consistency.
7. Gamma, Erich et al.  *Design Patterns: Elements of Reusable Object-Oriented Software* . Addison-Wesley.

   Structural patterns and responsibility separation in code.
