#!/bin/bash

# Directorio donde están los logs (puedes cambiarlo)
LOG_DIR="$1/logs"

# Carpeta de destino para logs antiguos
DEST_DIR="$1/logs_old"

# Verifica que exista el directorio
if [ ! -d "$LOG_DIR" ]; then
    echo "❌ El directorio $LOG_DIR no existe."
    exit 1
fi
# Crear la carpeta destino si no existe
mkdir -p "$DEST_DIR"

echo "📁 Logs modificados hace más de 7 días en $LOG_DIR:"

# Buscar y mover logs más antiguos de 7 días
find "$LOG_DIR" -name "*.log" -type f -mtime +7 -exec mv -f {} "$DEST_DIR" \;
timestamp=$(date "+%Y-%m-%d_%H-%M-%S")
cat >> "filtrar_logs_antiguos.log" <<EOF
Ultimo cambio realizado $timestamp a $LOG_DIR
EOF
echo "✅ Logs antiguos movidos a $DEST_DIR"