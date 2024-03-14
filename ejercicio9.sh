#!/bin/bash

# @author jarasa03

# ENUNCIADO: Escribe un script que llame a varias funciones en Bash que tome dos numeros como entrada y llame a la
#            funcion suma, funcion resta, funcion multiplicar y funcion dividir. Habra que representar la respuesta
#            obtenida del valor que devuelve cada funcion. Para las operaciones internas matematicas dentro de la
#            funcion utilizar el comando bc con precision de 4 decimales.


# Zona de funciones.
suma() {
	echo "scale=4; $1 + $2" | bc -l
}

resta() {
	echo "scale=4; $1 - $2" | bc -l
}

multiplicar() {
	echo "scale=4; $1 * $2" | bc -l
}

dividir() {
	echo "scale=4; $1 / $2" | bc -l
}


# Doy valor a dos variables.
valor1=15
valor2=14


# Ejecuto las funciones.
resultado_suma=$(suma "$valor1" "$valor2")
resultado_resta=$(resta "$valor1" "$valor2")
resultado_multiplicar=$(multiplicar "$valor1" "$valor2")
resultado_dividir=$(dividir "$valor1" "$valor2")


# Muestro el resultado de las funciones.
echo "La suma de $valor1 y $valor2 resulta en $resultado_suma"
echo "La resta de $valor1 y $valor2 resulta en $resultado_resta"
echo "La multiplicacion de $valor1 y $valor2 resulta en $resultado_multiplicar"
echo "La division de $valor1 y $valor2 resulta en $resultado_dividir"
