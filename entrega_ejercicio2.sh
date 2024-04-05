#!/bin/bash


# Crea un script en bash que haga una copia de seguridad de un archivo o directorio solicitado al usuario.
# Para realizar el script usar el comando "tar" y luego lo comprima con "gzip".
# El script solicitará al usuario la ubicación donde quieres guardar el archivo resultante.


# Solicito la ruta o directorio.
echo "Introduce la ruta de un archivo o directorio"
read ruta

# Solicito donde quiere guardarlo.
echo "Introduce la ruta donde quieras guardarlo"
read final

# Creo el archivo comprimido y compactado.
tar -cvf $final/comprimido.tar.gz $ruta
