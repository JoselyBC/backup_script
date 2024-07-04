#!/bin/bash
SRC="/opt"
DEST="/backup/opt"
mkdir -p "$DEST"
rsync -av --delete "$SRC/" "$DEST/"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup realizado com sucesso em $DEST" >> /var/log/backup_opt.log
