#!/usr/bin/env bash
# Script de auditoria y diagnostico defensivo para red local

set -euo pipefail

ROUTER_IP=$(ip route show default | awk '{print $3}')
MI_IP=$(ip -brief address show | grep UP | awk '{print $3}' | head -n 1)

echo "============================================="
echo "[*] Tu IP local:         $MI_IP"
echo "[*] IP del Router (GW):  $ROUTER_IP"
echo "============================================="

echo -e "\n[+] Dispositivos detectados en la red local (Cache ARP):"
ip neigh show | grep -v FAILED

echo -e "\n[+] Auditando puertos estandar en el router ($ROUTER_IP)..."
nmap -sT -F "$ROUTER_IP"

echo -e "\n[*] Analisis completado."
