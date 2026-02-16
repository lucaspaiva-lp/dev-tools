
# Fluxo Básico de Verificação de Segurança

## Ver comportamento de rede

> Ver tráfego ativo e quem está consumindo banda em tempo real.

    sudo nethogs
    sudo iftop

---

## Ver processos suspeitos

> Identificar processos estranhos ou conexões abertas inesperadas.

    htop
    ss -tunap

---

## Scanner de malware

> Verificar arquivos infectados ou assinaturas conhecidas de malware.

    sudo pacman -S clamav
    sudo freshclam
    sudo clamscan -r /

---

## Ver persistência

> Descobrir serviços ou tarefas que iniciam automaticamente.

    systemctl list-unit-files --state=enabled
    crontab -l
    sudo crontab -l

---

## Integridade do sistema

> Detectar rootkits e alterações suspeitas no sistema.

    sudo pacman -S rkhunter
    sudo rkhunter --check

### Após usar o rkhunter
1. Criar baseline (Registro em snapshot do estado seguro)
sudo rkhunter --propupd

2. Atualizar banco
sudo rkhunter --update

3. Scan novamente depois
sudo rkhunter --check

---

## Situação Ferramenta
```
Internet estranha -	nethogs / iftop
Programa suspeito -	htop / ss
Suspeita de malware	- clamav
Suspeita de spyware persistente -	systemctl / cron
Suspeita de rootkit	- rkhunter

```
