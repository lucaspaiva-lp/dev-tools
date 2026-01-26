sudo docker run -d
--name mc
--network host
-v /mnt/Nuvem/Server/minecraft-server-data:/data
-e EULA=TRUE
-e TYPE=FORGE
-e VERSION=1.20.1
-e INIT_MEMORY=2G
-e MAX_MEMORY=4G
itzg/minecraft-server
