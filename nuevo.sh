dibujarMenu() {
        dialog --clear \
                --title "Parseador CSV a LDIF" \
                --ok-label "Aceptar" \
                --cancel-label "Cancelar" \
                --menu "$MSGBOX" 20 0 20 \
                "Indica el nombre del admin OpenLDAP" \
                 "Indica la unidad organizativa" \
                "Indica el nombre del servidor" \
                 "Indica la extensión del servidor" \
                 "Indica el nombre del fichero CSV" \
                "Salir del script" \
               2> /tmp/csv.tmp.$$
}

crearLDIF() {
                        uid=`cat /tmp/csv.tmp.$$`
                        ou=`cat /tmp/csv.tmp.$$`
                        dc=`cat /tmp/csv.tmp.$$`
                        extension=`cat /tmp/csv.tmp.$$`
                        todo="uid="$uid",ou="$ou",dc="$dc",dc="$extension
			echo $todo
}

dibujarMenu
crearLDIF
