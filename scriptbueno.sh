#!/bin/bash
#Declaramos las variables globales
$uid
$ou
$dc
$extension
$csv_path
$todo 
let a
echo "uid="$uid",ou="$ou",dc="$dc",dc="$extension",csv="$csv_path=$todo
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
                case $a in 
			1)
				pedirAdmin
				exit 0
                                ;;
                        2)
				pedirOu
  				exit 0
				;;
		        3)	

				pedirDomain
				exit 0
				;;
			4)
				pedirExt
				exit 0
				;;
			5)
				pedirCsv
				exit 0
				;;
			6)
				salida	
				exit 0
				;;
			esac
function pedirAdmin(){
		 respose=$?
		 OUTPUT="/tmp/input.txt"	
		 dialog	--title "Nombre del administrador" \
		--ok-label "Aceptar" \
		--cancel-label "Cancelar" \
		--inputbox "Indica el nombre del administrador"8 60 2>$OUTPUT
		echo "por ahora llevas" $todo 
		uid=$(cat $OUTPUT)
		rm /tmp/input.txt
}
function pedirOu(){
		respose=$? 
	        OUTPUT="/tmp/input.txt"
		dialog       --title "Nombre de la unidad organizativa" \
                --ok-label "Aceptar" \
                --cancel-label "Cancelar" \
                --inputbox "Indica el nombre de la unidad organizativa"8 60 2>$OUTPUT
		echo "por ahora llevas" $todo 
		ou=$(cat $OUTPUT)
		rm /tmp/input.txt
		}

function pedirDomain(){
                respose=$? 
		OUTPUT="/tmp/input.txt"
		dialog       --title "Nombre del dominio" \
                --ok-label "Aceptar" \
                --cancel-label "Cancelar" \
                --inputbox "Indica el nombre del dominio"8 60 2>$OUTPUT
		echo "por ahora llevas" $todo 
		dc=$(cat $OUTPUT)
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
        respose=$?
    	OUTPUT="/tmp/input.txt"
    	dialog --title "El nombre del archivo CSV a parsear" \
    	--backtitle "Parseador de CSV a LDIP" \
    	--inputbox "Indica el nombre del archivo CSV que está en esta carpeta para parsear" 8 60 2>$OUTPUT
    	echo "por ahora llevas" $todo 
    	csv_path=$(cat $OUTPUT)
    	rm /tmp/input.txt
}
function salida(){
	$todo >> salida.ldif
}

#while true
#do
#dibujarMenu
#done
