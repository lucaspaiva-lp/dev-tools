## Executing SQL files from `queries/`

Files inside `queries/` are **read-only inspection scripts**.

They are meant to **observe, validate, and debug data**, not to change it.

They are executed using the PostgreSQL CLI tool: `psql`.

---

### Basic execution pattern

<pre class="overflow-visible! px-0!" data-start="408" data-end="483"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>psql -h <host> -U <db_user> -d <database> -f <path_to_sql_file>
</span></span></code></div></div></pre>

---

### Example (based on your structure)

<pre class="overflow-visible! px-0!" data-start="529" data-end="611"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>psql -h localhost -U clinic_user -d clinic_db -f queries/debugging.sql
</span></span></code></div></div></pre>

This command:

- connects to PostgreSQL on `localhost`
- authenticates as `clinic_user`
- opens database `clinic_db`
- executes all SQL statements inside `queries/debugging.sql`
- prints results to the terminal

---

### Optional but recommended flags

<pre class="overflow-visible! px-0!" data-start="866" data-end="966"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>psql -h localhost -U clinic_user -d clinic_db -W -v ON_ERROR_STOP=1 -f queries/joins.sql
</span></span></code></div></div></pre>

- `-W` → forces password prompt (safer)
- `ON_ERROR_STOP=1` → stops execution if any query fails

---

### Execution characteristics (important)

- Queries run **top to bottom**
- No state is persisted after execution
- Results are **printed**, not stored
- Nothing changes unless the SQL file contains mutating commands

---

### Intended usage of `queries/`

Use these files to:

- validate business invariants at the data level
- inspect relationships (`joins.sql`)
- check aggregates and totals (`aggregates.sql`)
- debug inconsistencies (`debugging.sql`)

They are **safe to run repeatedly** and **safe in production** _if they contain only SELECTs_.
