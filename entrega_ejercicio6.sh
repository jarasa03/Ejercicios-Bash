#!/bin/bash


# Realizar un script que liste los números primos existentes desde 1 hasta el número facilitado por argumento.
# El script ha de hacer uso de llamadas a funciones para el cálculo de cada uno de los números primos comprendido en el intervalo dado.


# Funcion para saber si un numero es o no primo
function esPrimo() { # Funcion sacada del ejercicio anterior
	local numero=$1
	if (( numero <= 1 )); then
		return 1 # Numero no es primo
	fi
	for (( i=2; i<=numero; i++ )); do
		if (( numero % i == 0 )); then
			return 1; # Numero no es primo
		fi
	done
	return 0; # Numero es primo
}

# Limite dado por parametro
limite=$1

# Imprime los numeros primos desde el 1 hasta el limite
echo "Numeros primos desde el 1 hasta el $limite: "
for (( i=2; i<limite; i++ )); do
	if esPrimo $i; then # Comprueba si el numero i es primo con la funcion anterior
		echo $i # Imprime el numero primo
	fi
done
