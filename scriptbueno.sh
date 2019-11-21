#!/bin/bash
let uid
let ou
let dc
let extension
let csv_path
OUTPUT="/tmp/csv.tmp"

dibujarMenu() {
        dialog  --title "Parseador CSV a LDIF" \
                --ok-label "Aceptar" \
                --cancel-label "Cancelar" \
                --menu "$MSGBOX" 20 0 20 \
               Nombre  "Indica el nombre del admin OpenLDAP" \
               OU  "Indica la unidad organizativa" \
               Servidor "Indica el nombre del servidor" \
               Extension  "Indica la extensión del servidor" \
               CSV  "Indica el nombre del fichero CSV" \
               Salir "Salir del script" \
		2> /tmp/csv.$$		
}

crearuid() {
	dialog	--title "Nombre del administrador" \
		--ok-label "Aceptar" \
		--cancel-label "Cancelar" \
		--inputbox "$2" 8 60 "$uid" \
		2> /tmp/csv.tmp.$$
             uid=$(cat /tmp/csv.tmp.$$)
}
crearou() {
                        ou=$(cat /tmp/csv.tmp.$$)
}
creardc() {
                     dc=$(cat /tmp/csv.tmp.$$)
}
crearext() {
		extension=$(cat /tmp/csv.tmp.$$)
}
creartodo() {
	todo="uid="$uid",ou="$ou",dc="$dc",dc="$extension
}

dibujarMenu
