#!/usr/bin/env bash
# Script de auditoria y respaldo de paquetes para Android TV

set -euo pipefail

TV_IP="${1:-}"

if [[ -z "$TV_IP" ]]; then
    echo "[!] Uso: $0 <IP_DE_LA_TV>"
    exit 1
fi

echo "[*] Conectando a $TV_IP:5555 via ADB..."
adb connect "$TV_IP:5555"

echo "[*] Creando respaldo de paquetes instalados..."
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
adb shell pm list packages -f > "backup_packages_${TIMESTAMP}.log"

echo "[+] Respaldo guardado en backup_packages_${TIMESTAMP}.log"
echo "[*] TV auditada correctamente."
