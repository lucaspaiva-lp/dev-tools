# Backend Project Setup — Linear Checklist (Python / FastAPI)

## Step 0 — Preconditions

- Python ≥ 3.11 installed
- PostgreSQL running locally
- Project cloned from GitHub (clean clone, no reused artifacts)

---

## Step 1 — Enter the project directory

<pre class="overflow-visible! px-0!" data-start="541" data-end="575"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>cd</span><span> backend-clinica-api
</span></span></code></div></div></pre>

Ensure you are at the **project root** (where `pyproject.toml` lives).

---

## Step 2 — Create a new virtual environment

**Never reuse old virtual environments**

<pre class="overflow-visible! px-0!" data-start="743" data-end="775"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>python -m venv .venv
</span></span></code></div></div></pre>

Reason:

- Prevent dependency leakage
- Ensure reproducibility
- Match project state exactly

---

## Step 3 — Activate the virtual environment

Linux (EndeavourOS):

<pre class="overflow-visible! px-0!" data-start="943" data-end="980"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>source</span><span> .venv/bin/activate
</span></span></code></div></div></pre>

Quick check:

<pre class="overflow-visible! px-0!" data-start="996" data-end="1020"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>which</span><span> python
</span></span></code></div></div></pre>

Expected:

<pre class="overflow-visible! px-0!" data-start="1032" data-end="1080"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre!"><span><span>.../backend-clinica-api/.venv/bin/python
</span></span></code></div></div></pre>

---

## Step 4 — Verify `pyproject.toml` exists and is versioned

Example (minimal working setup):

<pre class="overflow-visible! px-0!" data-start="1182" data-end="1571"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-toml"><span><span>[build-system]</span><span>
</span><span>requires</span><span> = [</span><span>"setuptools"</span><span>]
</span><span>build-backend</span><span> = </span><span>"setuptools.build_meta"</span><span>

</span><span>[project]</span><span>
</span><span>name</span><span> = </span><span>"backend-clinica-api"</span><span>
</span><span>version</span><span> = </span><span>"0.1.0"</span><span>
</span><span>requires-python</span><span> = </span><span>">=3.11"</span><span>

</span><span>dependencies</span><span> = [
    </span><span>"fastapi"</span><span>,
    </span><span>"uvicorn"</span><span>,
    </span><span>"sqlalchemy>=2.0"</span><span>,
    </span><span>"psycopg2-binary"</span><span>,
    </span><span>"python-dotenv"</span><span>,
]

</span><span>[tool.setuptools]</span><span>
</span><span>package-dir</span><span> = {</span><span>""</span><span> = </span><span>"src"</span><span>}

</span><span>[tool.setuptools.packages.find]</span><span>
</span><span>where</span><span> = [</span><span>"src"</span><span>]
</span></span></code></div></div></pre>

Key points:

- `python-dotenv` **must** be listed if `.env` is used
- `src-layout` requires `package-dir` configuration

---

## Step 5 — Install dependencies from `pyproject.toml`

Preferred (editable install for development):

<pre class="overflow-visible! px-0!" data-start="1801" data-end="1829"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>pip install -e .
</span></span></code></div></div></pre>

Alternative (non-editable):

<pre class="overflow-visible! px-0!" data-start="1860" data-end="1885"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>pip install .
</span></span></code></div></div></pre>

Quick verification:

<pre class="overflow-visible! px-0!" data-start="1908" data-end="1928"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>pip list
</span></span></code></div></div></pre>

Confirm:

- fastapi
- uvicorn
- sqlalchemy
- psycopg2-binary
- python-dotenv

---

## Step 6 — Load environment variables in code

In `src/main.py` (top of file):

<pre class="overflow-visible! px-0!" data-start="2093" data-end="2151"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-python"><span><span>from</span><span> dotenv </span><span>import</span><span> load_dotenv
load_dotenv()
</span></span></code></div></div></pre>

This **must execute before** reading environment variables.

---

## Step 7 — Recreate `.env` manually

Create the file:

<pre class="overflow-visible! px-0!" data-start="2275" data-end="2297"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>touch</span><span> .</span><span>env</span><span>
</span></span></code></div></div></pre>

Manually type values (do not blindly copy):

<pre class="overflow-visible! px-0!" data-start="2344" data-end="2425"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-env"><span>DATABASE_URL=postgresql+psycopg2://postgres@localhost:5432/clinica_dev
</span></code></div></div></pre>

---

## Step 8 — Verify `.env` is being loaded

<pre class="overflow-visible! px-0!" data-start="2475" data-end="2542"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>python -c </span><span>"import os; print(os.getenv('DATABASE_URL'))"</span><span>
</span></span></code></div></div></pre>

Expected:

<pre class="overflow-visible! px-0!" data-start="2554" data-end="2619"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre!"><span><span>postgresql+psycopg2://postgres@localhost:5432/clinica_dev
</span></span></code></div></div></pre>

If it prints `None`:

- `.env` is missing, misnamed, or not loaded
- `python-dotenv` not installed
- `load_dotenv()` not executed

---

## Step 9 — Start the backend

<pre class="overflow-visible! px-0!" data-start="2787" data-end="2840"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>uvicorn src.main:app --reload --port 8001
</span></span></code></div></div></pre>

Expected:

<pre class="overflow-visible! px-0!" data-start="2852" data-end="2900"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre!"><span><span>Uvicorn</span><span> running </span><span>on</span><span> http://127.0.0.1:8001
</span></span></code></div></div></pre>

---

# Errors Encountered & Resolutions

## Error 1 — `ModuleNotFoundError: No module named 'dotenv'`

**Cause**

- `python-dotenv` missing from dependencies

**Fix**

- Add `python-dotenv` to `pyproject.toml`
- Re-run:

<pre class="overflow-visible! px-0!" data-start="3121" data-end="3149"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>pip install -e .
</span></span></code></div></div></pre>

---

## Error 2 — `sqlalchemy.exc.ArgumentError: Expected string or URL object, got None`

**Cause**

- `DATABASE_URL` not loaded (returned `None`)

**Fix**

- Ensure:
  - `.env` exists
  - `load_dotenv()` is called
  - Variable name matches exactly

---

## Error 3 — PostgreSQL: `role "user" does not exist`

**Cause**

- Connection string used a non-existent role

**Fix**

- Correct `DATABASE_URL`:

<pre class="overflow-visible! px-0!" data-start="3551" data-end="3632"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-env"><span>DATABASE_URL=postgresql+psycopg2://postgres@localhost:5432/clinica_dev
</span></code></div></div></pre>

---

## Error 4 — `psql: No such file or directory`

**Cause**

- Wrong file path or filename typo (`-` vs `_`)

**Fix**

- Verify file exists:

<pre class="overflow-visible! px-0!" data-start="3777" data-end="3799"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>ls</span><span> scripts
</span></span></code></div></div></pre>

- Execute with correct name:

<pre class="overflow-visible! px-0!" data-start="3831" data-end="3899"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>psql -U postgres -d clinica_dev -f scripts/reset_dev.sql
</span></span></code></div></div></pre>

---

# Final Notes

- `.venv`, `.env`, `__pycache__` are **never** versioned
- Re-cloning a project **always** requires:
  - New virtual environment
  - Fresh dependency install
  - Manual environment setup
- This process is **portable across projects**
