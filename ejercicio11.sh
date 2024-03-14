#!/bin/bash

# @author jarasa03

# ENUNCIADO: Anyade una funcion en Bash que incluya el calculo de la raiz cuadrada de un numero y con la estructura
#            completa crea una libreria que sea llamada desde otro script y que contenga la funcion principal de
#            llamadas a todas las funciones de la libreria.


# Importado de librerias.
source ejercicio10.sh


# Doy valor a la nueva variable numero.
numero=9


# Uso la funcion.
resultado=$(raiz $numero)


# Represento el enunciado.
echo "El resultado de la raiz de $numero es igual a $resultado"
