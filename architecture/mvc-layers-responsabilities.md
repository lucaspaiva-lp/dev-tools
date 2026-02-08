## MVC — Responsibilities (Simplified Table)

| Layer                | Main Responsibilities (Keywords)                                 |
| -------------------- | ---------------------------------------------------------------- |
| **Model**      | Data, entities, business rules, validations, domain logic        |
| **View**       | Response format, JSON, presentation, output                      |
| **Controller** | Request handling, input validation, flow control, calling models |

---

## One-line Mental Model

* **Model** → *What the system **is** and **knows***
* **View** → *How data is **shown***
* **Controller** → *How requests are **handled***

---



## MVC Architecture — Layers and Responsibilities

### **Model**

**What it is**

* Represents the **core data and business rules** of the system.

**Responsibilities**

* Define entities and their structure (e.g. `User`, `Order`)
* Enforce domain rules and validations
* Represent the state of the application
* Be independent of UI and HTTP

**What it must NOT do**

* Handle HTTP requests or responses
* Know about routes, controllers, or frameworks
* Format output (JSON, HTML)

**In your project**

* `models/entities/users.py`
* (Future) domain rules related to users

---

### **View**

**What it is**

* The **representation of data** sent to the outside world.

In APIs, the “View” is usually:

* JSON responses
* HTTP status codes
* Response schemas

**Responsibilities**

* Format data for clients
* Define response structure
* Present results of operations

**What it must NOT do**

* Contain business rules
* Access the database
* Make decisions

**In your project**

* Flask `jsonify(...)`
* API responses from routes

---

### **Controller**

**What it is**

* The **entry point** for external input.
* Orchestrates the flow between View and Model.

**Responsibilities**

* Receive HTTP requests
* Validate input (basic validation)
* Call the appropriate Model / Application logic
* Decide which response to return

**What it must NOT do**

* Implement business rules
* Access the database directly
* Contain complex logic

**In your project**

* Flask routes / Blueprints (`user_route.py`)
* Future service/application calls

---

## MVC Flow (Simple)

1. Client sends request
2. **Controller** receives and interprets input
3. **Model** processes data and rules
4. **View** formats the response
5. Response is returned to the client

---

## Important Reality Check (Very Important)

Classic MVC was created for  **UI-based applications**.

In  **backend APIs**, MVC usually becomes:

* Controller → Route / Endpoint
* Model → Entity + Repository
* View → JSON Response

This is normal and  **industry standard**.

---

## Your Current Project Mapping

| MVC Layer      | Your Project                   |
| -------------- | ------------------------------ |
| Model          | `entities`,`repositories`  |
| View           | `jsonify`, response payloads |
| Controller     | Flask routes                   |
| Infrastructure | DB, SQLAlchemy, SQLite         |
