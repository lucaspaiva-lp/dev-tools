**Comandos básicos do pacman (Arch / EndeavourOS)**

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
