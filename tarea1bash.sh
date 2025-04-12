#!/bin/bash

# Comprobamos si se ha pasado un argumento
# y si no, mostramos un mensaje de uso y salimos
if [ $# -ne 1 ]; then
    echo "Uso: $0 nombre_carpeta"
    exit 1
fi      

nombre_carpeta=$1   
echo $nombre_carpeta

if [ -d ./$nombre_carpeta ]; then
    echo "La carpeta ya existe, se eliminará y se volverá a crear"
    rm -rf $nombre_carpeta
fi

mkdir $nombre_carpeta   
cd $nombre_carpeta



for i in {1..10}; do
    timestamp=$(date "+%Y-%m-%d_%H-%M-%S.%3N")
    cat > "archivo $i $timestamp.txt" <<EOF
Este es el contenido del archivo $i
Fecha de creación: $timestamp
EOF
sleep 0.001
#usleep 1000
done       
ls
