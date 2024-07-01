### backup_script

Este repositório contém um script de backup para sistemas Linux que realiza o backup do diretório /opt para o diretório /backup/opt diariamente às 02:00. O script é agendado para execução automática utilizando CRON. A documentação inclui instruções detalhadas sobre como configurar, testar e verificar a execução do backup.

# Script de Backup

O script `backup_opt.sh` realiza o backup do diretório `/opt` para o diretório `/backup/opt` diariamente às 02:00.

# Conteúdo do Script

#!/bin/bash

# Diretório de origem
SRC="/opt"

# Diretório de destino
DEST="/backup/opt"

# Cria o diretório de backup se não existir
mkdir -p "$DEST"

# Realiza o backup usando rsync para copiar arquivos novos e modificados
rsync -av --delete "$SRC/" "$DEST/"

# Registro de logs
echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup realizado com sucesso em $DEST" >> /var/log/backup_opt.log

# Torne o script executável
chmod +x /usr/local/bin/backup_opt.sh

# Executando o script manualmente
/usr/local/bin/backup_opt.sh

# importante verificar se o backup foi criado corretamente no diretório "/backup/opt"
ls -lha /backup/opt

## Agendar o Script com o Cron

#Editando a crontab com o usuário root para agendar o backup diário
sudo crontab -e

# Adicionand a linha a crontab para agendar o script de backup para ser executado diariamente às 2:00 AM
0 2 * * * /usr/local/bin/backup_opt.sh

# Importante verificar se o CRON está funcionando 
sudo grep CRON /var/log/syslog

## Informações adicionais
# É importante verificar se o horário do servidor está correta
timedatectl

# Caso esteja incorreta, ajuste a data
sudo timedatectl set-time 'YYYY-MM-DD HH:MM:SS'
# Ex
sudo timedatectl set-time '2024-06-28 14:30:00'

# Verifique as configurações
timedatectl
























