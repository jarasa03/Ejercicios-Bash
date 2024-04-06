#!/bin/bash


# Realizar un script “primo" que verifique si un número introducido como argumento es primo o no.
# El programa deberá ejecutarse en modo bucle, hasta que el usuario escriba la palabra FIN.
# Cada 10 repeticiones del bucle, se deberá limpiar la pantalla.


# Funcion para que devuelve 1 si es primo o 0 si no lo es (True o False)
function esPrimo() {
	local numero=$1  # La hago local para poder usarla fuera sin que afecte
	if (( numero <= 1 )); then
		return 1;
	fi
	for (( i=2; i<numero; i++ )); do
		if (( numero % i == 0 )); then
			return 1;
		fi
	done
	return 0
}

# Bucle principal
contador=0
while true; do
	contador=$((contador+1))
	read -p "Introduce un numero entero positivo (0 para salir): " numero
	if (( numero == 0 )); then # Si el numero es cero termina el programa
		break
	fi
	if esPrimo $numero; then # En base a lo que devuelva la funcion hablo
		echo "$numero es primo"
	else
		echo "$numero no es primo"
	fi
	if (( contador % 10 == 0 )); then # Condicion solicitada en el enunciado de a las 10 repeticiones borrar la pantalla
		sleep 5 # Espero 5 segundos para borrar la pantalla para poder ver primero el resultado del numero pedido
		clear
	fi
done
