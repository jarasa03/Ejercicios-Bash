#!/bin/bash

# @author jarasa03

# ENUNCIADO: Anyade una funcion en bash que incluya el calculo de la raiz cuadrada de un numero y con la estructura
#            completa crea una libreria que sea llamada desde otro script y que contenga la funcion principal de 
#            llamadas a todas las funciones de la libreria.


raiz() {
	echo "scale=4; sqrt($1)" | bc -l
}
