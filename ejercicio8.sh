#!/bin/bash

# @author jarasa03

# ENUNCIADO: Realizar un script que haga lo siguiente:
#            1. Que pida un número y diga si es par o no.
#            2. Que le pasemos dos datos y nos diga cual de ellos es mas grande. Hacerlo primero usando parametros y despues
#               usando la orden read (incluir ambas opciones).
#            3. Que pregunte que usuario ha ejecutado el script y nos muestre si hemos acertado o no.
#            4. Ampliar el 3 haciendo una pequenya comprobacion de errores, antes de comparar el texto introducido con el usuario
#               actual (#USER), se debe asegurar que el usuario ha introducido algo, es decir, que la variable que usemos para 
#               guardar esa informacion no este vacia.

# Apartado 1.
echo "Escribe un numero"
read num

if [ $((num % 2)) -eq 0 ]; then
	echo "El numero es par"
else
	echo "El numero es impar"
fi

# Apartado 2.
echo "Introduce un numero"
read num2
echo "Introduce otro numero"
read num3

if [ $num2 -gt $num3 ]; then
	echo "$num2 es mayor que $num3"
else
	echo "$num3 es mayor que $num2"
fi

# Apartado 3 y 4.

echo "¿Que usuario ha ejecutado el script?"
read usu

if [ -n "$usu" ]; then
	if [ "$usu" = "$USER" ]; then
		echo "Correcto"
	else
		echo "Incorrecto, el usuario $usu no es el que lo ha ejecutado, lo es $USER"
	fi
else
	echo "Has de introducir algun usuario"
fi
