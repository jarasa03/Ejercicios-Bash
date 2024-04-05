#!/bin/bash


# Crear un Script que pida 3 nombres de comando y para cada uno de ellos diga:
#  • Si es un fichero que está en /bin/
#  • Si ocupa más de 10 kb.


# Solicito los tres comandos.
echo "Introduce el nombre del primer comando"
read comando1

echo "Introduce el nombre del segundo comando"
read comando2

echo "Introduce el nombre del tercer comando"
read comando3


# Verifico si el comando se encuentra en /bin
for comando in $comando1 $comando2 $comando3
do
	if [ -x "/bin/$comando" ]; then # Compruebo la ubicación del archivo y en base a ella hablo.
		echo "$comando es un fichero que está en /bin"

		tamanyo=$(stat -c %s "/bin/$comando") # Doy a la variable tamanyo el tamanyo del archivo en bytes (opción %s seguida de -c)
						      # El -c es para poder especificar el formato de salida, para poder poner %s
		if [ $tamanyo -gt 10240 ]; then # En función de su tamanyo hablo.
                	echo "$comando ocupa más de 10kb"
        	else
                	echo "$comando ocupa menos de 10kb"
        	fi
	else 
		echo "$comando no es un fichero que esté en /bin"
		continue;
	fi
done
