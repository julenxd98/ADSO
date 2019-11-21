#!/bin/bash
#comparar dos parametros
if [ $1 -gt $2 ]
then
	echo "es un numero grande" $2
else
	echo "es un numero pequeno" $2
fi 
exit 0
