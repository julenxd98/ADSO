#!/bin/bash
while :
do
	echo " Si pulsas 1 dime uid "
	echo " Si pulsas 2 dime dc "
	echo " Si pulsas 3 dime extension "
	echo " Si pulsas 4 sales " 
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
			echo " puedes salir "
			exit 0
			;;
	
esac
done

