#!/bin/bash
#Declaramos las variables globales
$uid
$ou
$dc
$extension
$csv_path
$todo 
echo "uid="$uid",ou="$ou",dc="$dc",dc="$extension",csv"$csv_path=$todo
#Creamos el menu
function dibujarMenu(){
	OUTPUT="/tmp/csv.tmp"
        dialog  --title "Parseador CSV a LDIF" \
                --ok-label "Aceptar" \
                --cancel-label "Cancelar" \
                --menu "$MSGBOX" 20 0 20 \
               1  "Indica el nombre del admin OpenLDAP" \
               2  "Indica la unidad organizativa" \
               3 "Indica el nombre del servidor"  \
               4  "Indica la extensión del servidor" \
               5  "Indica el nombre del fichero CSV" \
               6 "Guardar salida"  \
	       0 "Salir" 2>/tmp/salida.tmp
		a=$(cat /tmp/salida.tmp)
		respose=$?
		rm /tmp/csv.tmp
}
function pedirAdmin(){
		 OUTPUT="/tmp/input.txt"	
		 dialog	--title "Nombre del administrador" \
		--ok-label "Aceptar" \
		--cancel-label "Cancelar" \
		--inputbox "Indica el nombre del administrador"8 60 2>$OUTPUT
		echo "por ahora llevas" $todo 
		uid=$(<$OUTPUT)
		rm /tmp/input.txt
}
function pedirOu(){ 
		 OUTPUT="/tmp/input.txt"
		dialog       --title "Nombre de la unidad organizativa" \
                --ok-label "Aceptar" \
                --cancel-label "Cancelar" \
                --inputbox "Indica el nombre de la unidad organizativa"8 60 2>$OUTPUT
		echo "por ahora llevas" $todo 
		ou=$(<$OUTPUT)
		rm /tmp/input.txt
		}

function pedirDomain(){ 
		OUTPUT="/tmp/input.txt"
		dialog       --title "Nombre del dominio" \
                --ok-label "Aceptar" \
                --cancel-label "Cancelar" \
                --inputbox "Indica el nombre del dominio"8 60 2>$OUTPUT
		echo "por ahora llevas" $todo 
		dc=$(<$OUTPUT)
		rm /tmp/input.txt
}

function pedirExt(){ 
		OUTPUT="/tmp/input.txt"
		dialog       --title "Nombre de la extension" \
                --ok-label "Aceptar" \
                --cancel-label "Cancelar" \
                --inputbox "Indica la extension del dominio"8 60 2>$OUTPUT
		echo "por ahora llevas" $todo 
		extension=$(<$OUTPUT)
		rm /tmp/input.txt
function pedirCsv(){
    	OUTPUT="/tmp/input.txt"
    	dialog --title "El nombre del archivo CSV a parsear" \
    	--backtitle "Parseador de CSV a LDIP" \
    	--inputbox "Indica el nombre del archivo CSV que está en esta carpeta para parsear" 8 60 2>$OUTPUT
    	echo "por ahora llevas" $todo 
    	csv_path=$(<$OUTPUT)
    	rm /tmp/input.txt
}
function salida(){
	$todo >> salida.ldif
}
	while true
	do
		dibujarMenu
	done
