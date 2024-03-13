#!/bin/bash
#ENUNCIADO: Realiza un script que solicite los datos para calcular el volumen de una esfera y de un cilindro.
echo "Introduce el radio de la esfera"
read radio_esfera
pi=3.141593
volumen_esfera=$(echo "4 * $pi * $radio_esfera^3 / 3" | bc -l)
echo "El volumen de la esfera es: $volumen_esfera"
echo "Ahora introduce el radio de la base de tu cilindro"
read radio_cilindro
echo "Introduce la altura de tu cilindro"
read altura
volumen_cilindro=$(echo "(4 * $pi * $radio_cilindro ^ 2) * $altura" | bc -l)
echo "El volumen del cilindro es: $volumen_cilindro"
