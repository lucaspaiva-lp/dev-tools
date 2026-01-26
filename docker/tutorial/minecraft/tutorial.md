Criar servidor Minecraft no Linux (Docker + ZeroTier)

Abaixo está a sequência real e sem redundâncias, do jeito que funciona no seu caso.

1️⃣ Instalar o ZeroTier One

Permite acessar o servidor pela internet sem abrir portas.

curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join <ID_DA_REDE>

Depois, no painel zerotier: autorizar o cliente.

2️⃣ Instalar Docker
sudo apt update
sudo apt install docker.io -y

Ativar e permitir:

sudo systemctl enable --now docker
sudo usermod -aG docker $USER

Reinicie o terminal.

3️⃣ Criar sua pasta de dados do servidor

IMPORTANTE: tudo dentro de /data é persistente.

mkdir -p /mnt/Nuvem/Server/minecraft-server-data

4️⃣ Rodar o servidor Minecraft usando Docker

Aqui está o comando correto:

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

⛔ ATENÇÃO: quando usar --network host

Quando você usa:

--network host

✔️ O servidor usa a porta 25565 diretamente no Linux
✔️ ZeroTier vai enxergar 25565, sem NAT
❌ Você não pode rodar outro Minecraft no mesmo host ao mesmo tempo
❌ Não pode mapear portas com -p, pois host ignora isso

Se quiser vários servidores → me diga que eu te passo o layout certo com portas separadas.

5️⃣ Verificar se o servidor está rodando
sudo docker logs -f mc

Se estiver correto, você verá:

Done! For help, type "help"

6️⃣ Acessar o servidor via ZeroTier

No Minecraft colocar:

10.x.x.x:25565

(Esse é o IP zerotier do servidor.)

7️⃣ Parar / Iniciar o servidor
sudo docker stop mc
sudo docker start mc
