#!/bin/bash

# @author jarasa03

# ENUNCIADO: Realizar un script en Bash que solicite al usuario dos números y realice las operaciones aritméticas básicas con
#            ellos, teniendo en cuenta que se desea una precisión de cuatro decimales.

echo "Introdue un numero"
read numero1
echo "Introduce otro numero"
read numero2

suma=$(echo "scale=4; $numero1 + $numero2" | bc -l)
resta=$(echo "scale=4; $numero1 - $numero2" | bc -l)
multi=$(echo "scale=4; $numero1 * $numero2" | bc -l)
divi=$(echo "scale=4; $numero1 / $numero2" | bc -l)

echo "La suma es igual a: $suma"
echo "La resta es igual a: $resta"
echo "La multiplicacion es igual a: $multi"
echo "La division es igual a: $divi"
