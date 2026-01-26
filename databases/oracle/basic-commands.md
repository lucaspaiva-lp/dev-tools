# Oracle – Command Map (Multitenant)

---

## Command Categories and Criteria

| Category                    | Responsibility               | Scope                 | Typical Commands                                       |
| --------------------------- | ---------------------------- | --------------------- | ------------------------------------------------------ |
| OS & Filesystem             | Physical storage preparation | Operating System      | `mkdir`                                                |
| CDB / PDB Management        | Multitenant lifecycle        | Database architecture | `CREATE PLUGGABLE DATABASE`,`ALTER PLUGGABLE DATABASE` |
| Session & Container Control | Execution context            | SQL session           | `ALTER SESSION SET CONTAINER`                          |
| Network & Listener          | Client connectivity          | Infrastructure        | `lsnrctl`,`tnsnames.ora`                               |
| User & Security             | Authentication and access    | Database security     | `CREATE USER`,`GRANT`                                  |
| Profile Management          | Password & login rules       | Security policy       | `ALTER PROFILE`                                        |
| Tablespace Management       | Logical storage              | Database storage      | `CREATE TABLESPACE`                                    |
| Quotas & Defaults           | Resource allocation          | User storage          | `ALTER USER`                                           |
| Schema Objects              | Application data             | SQL schema            | `CREATE TABLE`,`CREATE INDEX`                          |

---

## OS & Filesystem

```bash
mkdir -p /opt/oracle/oradata/FREE/RHPDB
```

---

## CDB / PDB Management

```sql
CREATE PLUGGABLE DATABASE RHPDB
ADMIN USER RHADMIN IDENTIFIED BY "oracle"
FILE_NAME_CONVERT=(
  '/opt/oracle/oradata/FREE',
  '/opt/oracle/oradata/FREE/RHPDB'
);

SHOW PDBS;

ALTER PLUGGABLE DATABASE RHPDB OPEN READ WRITE;
ALTER PLUGGABLE DATABASE RHPDB SAVE STATE;
```

---

## Session & Container Control

```sql
ALTER SESSION SET CONTAINER = RHPDB;
```

---

## Network & Listener

```bash
lsnrctl status
```

`$ORACLE_HOME/network/admin/tnsnames.ora`

---

## User & Security

```sql
CREATE USER app_rh IDENTIFIED BY "oracle";
GRANT CREATE SESSION TO app_rh;
```

---

## Profile Management

```sql
SELECT resource_name, limit
FROM dba_profiles
WHERE profile = 'DEFAULT';

ALTER PROFILE default
LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;
```

---

## Tablespace Management

```sql
CREATE TABLESPACE APP_RH_DADOS
DATAFILE '/opt/oracle/oradata/FREE/RHPDB/app_rh_dados01.dbf'
SIZE 100M AUTOEXTEND ON;

CREATE TABLESPACE APP_RH_INDEX
DATAFILE '/opt/oracle/oradata/FREE/RHPDB/app_rh_index01.dbf'
SIZE 100M AUTOEXTEND ON;
```

---

## Quotas & Default Tablespace

```sql
ALTER USER app_rh QUOTA UNLIMITED ON app_rh_dados;
ALTER USER app_rh QUOTA UNLIMITED ON app_rh_index;
ALTER USER app_rh DEFAULT TABLESPACE app_rh_dados;
```

---

## Schema Objects

```sql
CREATE TABLE pessoas (
  id   NUMBER(2),
  nome VARCHAR2(20)
);

CREATE INDEX idx001
ON pessoas (id)
TABLESPACE app_rh_index;

SELECT object_name FROM user_objects;
```
