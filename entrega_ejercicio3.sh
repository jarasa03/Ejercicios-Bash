#!/bin/bash


# Realiza un script  llamado “descompos" que visualiza los divisores de un número facilitado como argumento en la llamada del script.


echo "Los divisores de $1 son:"

num=$1 # Le doy el nombre num para trabajar más cómodamente con él.

for (( i=1; i<=num; i++)); do
	if [ $((num%i)) -eq 0 ]; then
		echo "$i es divisor de $num"
	fi
done
