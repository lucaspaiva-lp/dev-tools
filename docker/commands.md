## Docker — Essential Commands (Quick Reference)

### 🔹 General

- `docker version` → client/server versions
- `docker info` → daemon status & config
- `docker help` → global help

---

### 🔹 Images

- `docker images` → list local images
- `docker pull <image>` → download image
- `docker build -t <name>:<tag>.` → build image
- `docker rmi <image>` → remove image
- `docker image prune` → remove unused images

---

### 🔹 Containers

- `docker ps` → running containers
- `docker ps -a` → all containers
- `docker run <image>` → run container
- `docker run -d <image>` → run detached
- `docker run -it <image> sh` → interactive shell
- `docker stop <container>` → stop container
- `docker start <container>` → start container
- `docker restart <container>` → restart container
- `docker rm <container>` → remove container
- `docker container prune` → remove stopped containers

---

### 🔹 Execution & Inspection

- `docker exec -it <container> bash` → exec shell
- `docker logs <container>` → view logs
- `docker logs -f <container>` → follow logs
- `docker inspect <container>` → full metadata
- `docker stats` → live resource usage

---

### 🔹 Networking

- `docker network ls` → list networks
- `docker network inspect <net>` → network details
- `docker network create <net>` → create network
- `docker network rm <net>` → remove network

---

### 🔹 Volumes

- `docker volume ls` → list volumes
- `docker volume inspect <vol>` → volume details
- `docker volume create <vol>` → create volume
- `docker volume rm <vol>` → remove volume
- `docker volume prune` → remove unused volumes

---

### 🔹 Cleanup (Safe Ops)

- `docker system df` → disk usage
- `docker system prune` → remove unused objects
- `docker system prune -a` → aggressive cleanup

---

### 🔹 Docker Compose (Modern CLI)

- `docker compose up` → start services
- `docker compose up -d` → detached mode
- `docker compose down` → stop & remove
- `docker compose ps` → service status
- `docker compose logs` → service logs
- `docker compose build` → build images
- `docker compose exec <svc> sh` → exec into service

---

## Mental Grouping (fast recall)

- **Images** → build / pull / clean
- **Containers** → run / stop / inspect
- **Exec & logs** → debug
- **Volumes** → persistence
- **Networks** → connectivity
- **Compose** → orchestration
- **Prune** → hygiene
