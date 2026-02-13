**Comandos básicos do pacman (Arch / EndeavourOS)**

**Create Many Files**

touch {1..10}-32views.sql

**Rename Many Files**

for i in {1..10}; do
  mv "${i}-players.sql" "${i}.sql"
done

### **PACMAN**

**Atualização do sistema**
sudo pacman -Syu
Atualiza a lista de repositórios e todos os pacotes instalados.

**Instalar pacotes**
sudo pacman -S nome-do-pacote

**Remover pacotes**
sudo pacman -R nome-do-pacote
sudo pacman -Rs nome-do-pacote
sudo pacman -Rns nome-do-pacote

**Buscar pacotes**
pacman -Ss nome
pacman -Qs nome
pacman -Q

**After -Syu**

pacman -Dk -> Check dependency issues
pacman -Dkk -> More details

pacman -Qk -> Verify installed package files

systemctl --failed -> Check failed services (system health)

**Tabela de sufixos/opções do pacman**

Essas letras não são comandos separados, são opções combináveis após o -.

**Opções mais usadas:**
**Opção** **Nome** **O que faz**
-S Sync Instala pacotes a partir dos repositórios
-y Refresh Atualiza a lista de repositórios
-u Upgrade Atualiza pacotes já instalados
-R Remove Remove pacotes
-n Nosave Remove também os arquivos de configuração
-s Recursive Remove dependências não utilizadas
-Q Query Consulta pacotes instalados
-S + s Search Busca pacotes nos repositórios
-Q + s Search Busca pacotes instalados

### FLATPAK

flatpak list
