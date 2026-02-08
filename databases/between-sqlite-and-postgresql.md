# SQLite vs PostgreSQL / MySQL

## Purpose

This document explains the practical differences between **SQLite** and **server-based databases** (PostgreSQL / MySQL), focusing on **writes vs reads** and  **project suitability**.

The goal is to clarify  **when each database should be used**.

---

## Core Concept: Reads vs Writes

### Read (Leitura)

Operations that  **do not change data**.

Examples:

* Listing users
* Searching records
* Generating reports
* Viewing historical data

SQL examples:

<pre class="overflow-visible! px-0!" data-start="723" data-end="782"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"></div></pre>

<pre class="overflow-visible! px-0!" data-start="723" data-end="782"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-sql"><span><span>SELECT</span><span></span><span>*</span><span></span><span>FROM</span><span> users;
</span><span>SELECT</span><span></span><span>COUNT</span><span>(</span><span>*</span><span>) </span><span>FROM</span><span> users;
</span></span></code></div></div></pre>

---

### Write (Escrita)

Operations that  **modify data**.

Examples:

* Registering a user
* Updating patient data
* Deleting records
* Creating appointments

SQL examples:

<pre class="overflow-visible! px-0!" data-start="956" data-end="1062"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"></div></pre>

<pre class="overflow-visible! px-0!" data-start="956" data-end="1062"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-sql"><span><span>INSERT INTO</span><span> users </span><span>VALUES</span><span> (...);
</span><span>UPDATE</span><span> users </span><span>SET</span><span> name </span><span>=</span><span></span><span>'John'</span><span>;
</span><span>DELETE</span><span></span><span>FROM</span><span> users </span><span>WHERE</span><span> id </span><span>=</span><span></span><span>1</span><span>;
</span></span></code></div></div></pre>

---

## SQLite

### What it is

* Embedded database
* Single local `.db` file
* No database server process

---

### Strengths

* Zero configuration
* Very simple setup
* Excellent read performance
* Lightweight and fast
* Easy to version schema (`schema.sql`)

---

### Limitations (important)

* **Only one write at a time**
* Write operations lock the database file
* No remote access (local file only)
* No built-in user/role system
* Limited scalability

---

### Ideal project types

SQLite is ideal for:

* Learning projects
* Prototypes
* Small APIs
* CLI tools
* Internal tools
* Read-heavy systems
* Single-user or low-concurrency apps

---

### Example (Clinic system)

✅ Good fit:

* Viewing patient list
* Searching patient records
* Generating reports

❌ Poor fit:

* Many simultaneous patient registrations
* High-frequency updates
* Multiple users writing at the same time

---

## PostgreSQL / MySQL

### What they are

* Server-based databases
* Run as separate services
* Support remote connections

---

### Strengths

* Multiple concurrent writers
* High scalability
* Advanced indexing
* Strong data integrity
* User roles and permissions
* Designed for production systems

---

### Trade-offs

* Requires setup and configuration
* Higher operational complexity
* Needs database server management

---

### Ideal project types

PostgreSQL / MySQL are ideal for:

* SaaS platforms
* Production APIs
* Multi-user systems
* Financial systems
* Systems with frequent writes
* Distributed or cloud-based services

---

### Example (Clinic system)

✅ Good fit:

* Patient registration
* Appointment scheduling
* Concurrent staff usage
* Audit and integrity requirements

---

## Side-by-Side Comparison

| Aspect               | SQLite        | PostgreSQL / MySQL |
| -------------------- | ------------- | ------------------ |
| Database type        | Embedded      | Server-based       |
| Writes               | Single writer | Multiple writers   |
| Reads                | Very fast     | Very fast          |
| Concurrency          | Low           | High               |
| Setup                | Minimal       | Moderate           |
| Scalability          | Low           | High               |
| Production readiness | Limited       | High               |

---

## Architectural Takeaway

SQLite is a  **starting point**, not a limitation.

A well-designed backend:

* Separates domain logic from persistence
* Allows swapping SQLite → PostgreSQL later
* Avoids coupling business rules to the database

Using SQLite early is  **a design decision**, not a shortcut.

---

## Final Summary

* SQLite is excellent for **learning and small systems**
* PostgreSQL/MySQL are required for **write-heavy, multi-user systems**
* The key difference is **concurrent writes**
* Reads are cheap; writes define scalability

---
