#!/bin/bash


# Crear un script para la gestión de usuario básico, generando un menú de opciones que permita las siguientes opciones:
# 1 - Agregar usuario, 2 - Borrar usuario, 3 - Consultar la información de un usuario, 4 - cambiar la  contraseña de un usuario, S - Salir.
# Las opciones deben permanecer activas hasta que el usuario selecciones la opción salir.


# Funcion para crear un nuevo usuario
function anyadir_usuario() {
	read -p "Introduce el nombre del usuario a crear: " nombre_usuario
	useradd $nombre_usuario
	echo "El usuario $nombre_usuario ha sido creado correctamente."
}

# Funcion para borrar usuarios
function borrar_usuario() {
	read -p "Introduce el nombre del usuario a borrar: " nombre_usuario
	userdel -r $nombre_usuario
	echo "El usuario $nombre_usuario ha sido borrado correctamente."
}

# Funcion para ver informacion sobre un usuario
function ver_usuario() {
	read -p "Introduce el nombre del usuario a consultar informacion: " nombre_usuario
	grep $nombre_usuario /etc/passwd
}

# Funcion para cambiar la contrasenya
function cambiar_ctrs() {
	read -p "Introduce el nombre del usuario a cambiar contrasenya" nombre_usuario
	read -s "Introduce la nueva contrasenya" nueva_ctrs # Opcion -s para que no se vean los caracteres de la contrasenya
	echo # Este echo es solo para hacer otro salto de linea para que se lea mejor
	echo "La contrasenya de $nombre_usuario ha sido cambiada correctamente"
	passwd $nombre_usuario <<< "$nueva_ctrs"
}

while true
do
	clear
	echo "Menu"
	echo "1. Anyadir usuario"
	echo "2. Borrar usuario"
	echo "3. Ver info de un usuario"
	echo "4. Cambiar la contrasenya de un usuario"
	echo "5. Salir"
	read -p "Selecciona una opción: " opcion

	case $opcion in
		1) anyadir_usuario ;;
		2) borrar_usuario ;;
		3) ver_usuario ;;
		4) cambiar_ctrs ;;
		5) exit 0 ;;
		*) echo "Elige una opcion valida" ;;
	esac

	read -n 1 -p "Presiona cualquier tecla para continuar" # Para que no se termine todo sin que el usuario se entere
done
