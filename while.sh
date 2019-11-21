#!/bin/bash
while :
do
	echo "Si pulsas 1 sigo"
	echo "Si pulsas 2 salgo"
	echo "Si pulsas 3 salgo"
		read -p "Elige [ 1 2  o 3 ]" prueba
	case $prueba in
		1)

			echo "Has elegido 1, vuelvo a preguntar" 
				;;
		*)
			echo "Puedes salir"
				exit 0
			;;
esac
done

