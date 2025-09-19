#!/bin/bash

# === Configuration ===
BACKUP_DIR="/opt/backups"
DATE=$(date +%F_%H-%M-%S)

# Variables for MySQL (come from Ansible group_vars)
DB_NAME="{{ mysql_nextcloud_db }}"
DB_USER="{{ mysql_root_user }}"
DB_PASS="{{ mysql_root_password }}"

# Nextcloud directories
NEXTCLOUD_DIR="/var/www/nextcloud"
FILES_DIR="$NEXTCLOUD_DIR/data"
CONFIG_DIR="$NEXTCLOUD_DIR/config"

# === Create backup directory if not exists ===
mkdir -p "$BACKUP_DIR"

# === Backup database ===
echo "[INFO] Backing up database..."
mysqldump -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" \
  > "$BACKUP_DIR/nextcloud_db_$DATE.sql"

# === Backup files (data + config) ===
echo "[INFO] Backing up Nextcloud files..."
tar -czf "$BACKUP_DIR/nextcloud_files_$DATE.tar.gz" \
  "$FILES_DIR" "$CONFIG_DIR"

# === Remove old backups (older than 7 days) ===
echo "[INFO] Cleaning old backups..."
find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \;

echo "[INFO] Backup completed successfully at $DATE"