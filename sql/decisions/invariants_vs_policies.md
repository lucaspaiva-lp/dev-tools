### 1. Integrity Rules / Structural Invariants

These rules state:

> “This state must **never** exist.”

Examples:

- department without a name
- role without a department
- employee without a role
- duplicated email

Characteristics:

- **atemporal** (always valid)
- **universal**
- **do not depend on context**
- **do not depend on the user**
- **do not depend on flow**

These rules **legitimately belong to the database (persistence layer)** .

➡️ They are _business invariants_ , but **structural** , not behavioral.

---

### 2. Behavioral Business Rules (Policy / Flow)

These rules state:

> “In a given context, this may or may not happen.”

Examples:

- when a department can be created
- who is allowed to create a department
- whether a department with roles can be deleted
- whether a department can be renamed after X

Characteristics:

- **context-dependent**
- **time-dependent**
- **user-dependent**
- **subject to policy changes**
- **may differ by scenario**

These **do not belong to the database** .

➡️ They belong to the **application layer** (Service Layer).

---

## The correct statement (without ambiguity)

The database:

> Enforces **structural invariants of the domain**

The application:

> Executes **business policies, flows, and decisions**

---

## Directly addressing the example

### “A department cannot exist without a name”

Yes — this is a business rule.

But it is a **structural, invariant rule** .

Therefore:

- it belongs in the database
- it must be enforced via constraints
- it must not be optional in the code
