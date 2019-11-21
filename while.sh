#!/bin/bash
while :
do
dibujarmenu(){
	echo " Si pulsas 1 dime uid "
	echo " Si pulsas 2 dime dc "
	echo " Si pulsas 3 dime extension "
	echo " Si pulsas 4 sales " 
}
existirfichero(){
	echo "Comprobando si existe el fichero"
	sleep 1 
	if [ -e salida.txt ]
		then
			echo "el fichero existe"
		else
			echo "el fichero no existe"
	read -p "Pulsa S para sobreescribir el fichero" sobreescribe
		if [ sobreescribe ="S" ]
			then 
				cat $todo >> salida.txt
		fi
}

func_result="$(dibujarmenu)"
echo $func_result
	read -p " Elige 1 o 4 " prueba
	case $prueba in 
		1)
		read -p " Dime el uid " uid
			;;
		2)
		read -p " Dime el dc " dc
				;;

		3)
			read -p " Dime la extension " extension
			;;
		4)
			todo="uid="$uid",dc="$dc",dc="$extension 
			echo $todo
				if [ -f salida.txt ]
				then
				$todo >> salida.txt
				fi
			echo " puedes salir "
			exit 0
			;;
esac
done

