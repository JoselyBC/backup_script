#!/bin/bash

SRC="/opt"
DEST="/backup/opt"
mkdir -p "$DEST"
rsync -av --delete "$SRC/" "$DEST/"
if [ $? -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup realizado com sucesso em $DEST" >> /var/log/backup_opt.log
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Erro no backup do diretório $SRC para $DEST" >> /var/log/backup_opt.log
fi
