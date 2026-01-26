```
Database System Stack
├── **Hardware** -> Physical resources: CPU, RAM, storage, network
│
├── **Firmware (BIOS / UEFI)** -> Initializes hardware and hands control to the bootloader
│
├── **Bootloader** -> Loads the operating system kernel into memory
│
├── **Operating System** -> Kernel, memory, process and filesystem management
│
│ ├── **User Space** -> Execution context for user-level processes
│ │ ├── root
│ │ ├── database users
│ │ │ ├── oracle
│ │ │ └── postgres
│ │ └── application users
│
├── **Database Software (Installed Binaries)** -> Database executables and libraries
│ ├── Oracle binaries
│ └── PostgreSQL binaries
│
├── **Database Engine Runtime** -> In-memory structures and running processes
│ ├── **Oracle Instance**
│ │ ├── SGA
│ │ └── Background processes
│ │
│ └── **PostgreSQL Server Processes**
│ ├── Postmaster
│ ├── Backend processes (per connection)
│ └── Shared memory
│
├── **Database Architecture (Logical Layer)** -> Logical organization and isolation
│ ├── **Oracle**
│ │ ├── CDB (Container Database)
│ │ └── PDBs (Pluggable Databases)
│ │
│ └── **PostgreSQL**
│ ├── Cluster
│ └── Databases
│
└── **Database Storage (On Disk)** -> Persistent physical data
├── Datafiles
├── Redo / WAL logs
└── Control / Catalog files

```
