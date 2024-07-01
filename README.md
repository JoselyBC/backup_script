# backup_script

Este repositório contém um script de backup para sistemas Linux que realiza o backup do diretório /opt para o diretório /backup/opt diariamente às 02:00. O script é agendado para execução automática utilizando CRON. A documentação inclui instruções detalhadas sobre como configurar, testar e verificar a execução do backup.

## Script de Backup

O script `backup_opt.sh` realiza o backup do diretório `/opt` para o diretório `/backup/opt` diariamente às 02:00.

### Conteúdo do Script

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
