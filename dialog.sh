#!/bin/bash 
#Un script para poder leer entradas
#Un archivo temporal donde guardar lo que vamos leyendo
OUTPUT="/tmp/input.txt"

#Dibuja el InpuntBox
dialog --title "El nombre del admin LDAP" \
--backtitle "Parseador de CSV a LDIP" \
--inputbox  "Indica el nombre del admin LDAP (suele ser admin)" 8 60 2>$OUTPUT
#lee lo que escribe el usario
response=$?
#lee el OUTPUT
name=$(<$OUTPUT)
echo $name
#borrar archivo temp
rm /tmp/input.txt
