#!/bin/bash


# Crear un script para la gestión de usuario básico, generando un menú de opciones que permita las siguientes opciones:
# 1 - Agregar usuario, 2 - Borrar usuario, 3 - Consultar la información de un usuario, 4 - cambiar la  contraseña de un usuario, S - Salir.
# Las opciones deben permanecer activas hasta que el usuario selecciones la opción salir.


# Verifico que el usuario tenga permisos de ejecucion
if [ ! -x "$0" ]; then
    echo "No tienes permisos de ejecucion"
    exit 1
fi

# Funcion para anyadir un usuario a un grupo existente
function anyadir_usuario_grupo() {
	read -p "Introduce el nombre de usuario: " nombre_usuario
	read -p "Introduce el nombre del grupo: " nombre_grupo

	if grep -q "^$nombre_grupo:" /etc/group; then # Compruebo que el grupo exista
    	usermod -aG $nombre_grupo $username
    	echo "El usuario $username ha sido anyadido al grupo $nombre_grupo"
  	else
    	echo "El grupo $nombre_grupo no existe"
	fi
}

# Funcion para mostrar los usuarios en un grupo existente
function mostrar_usuarios_grupo() {
	read -p "Introduce el nombre del grupo: " nombre_grupo

	if grep -q "^$nombre_grupo:" /etc/group; then # Compruebo que el grupo exista
    	miembros=$(grep "^$nombre_grupo:" /etc/group | cut -d: -f4)
    	echo "Usuarios en el grupo $nombre_grupo: $miembros"
	else
    	echo "El grupo $nombre_grupo no existe"
	fi
}

# Funcion para borrar un usuario de un grupo existente
function borrar_usuario_grupo() {
	read -p "Introduce el nombre del grupo: " nombre_grupo
	if grep -q "^$nombre_grupo:" /etc/group; then
    	groupdel $nombre_grupo
    	echo "El grupo $nombre_grupo ha sido eliminado"
  	else
    	echo "El grupo $nombre_grupo no existe"
  	fi
}

# Funcion para crear grupos
function crear_grupo() {
	read -p "Introduce el nombre del nuevo grupo: " nombre_grupo
  	groupadd $nombre_grupo
  	echo "El grupo $nombre_grupo ha sido creado"
}

function renamear_grupo() {
  read -p "Introduce el nombre del grupo a renombrar: " nombre_grupo
  read -p "Introduce el nuevo nombre del grupo: " nuevo_nombre

  if grep -q "^$nombre_grupo:" /etc/group; then
    groupmod -n $nuevo_nombre $nombre_grupo
    echo "El grupo $nombre_grupo ha sido renombrado a $nuevo_nombre"
  else
    echo "El grupo $nombre_grupo no existe"
  fi
}

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
	echo "5. Gestion avanzada de usuarios"
	echo "s. Salir"
	read -p "Selecciona una opcion: " opcion

	case $opcion in
		1) anyadir_usuario ;;
		2) borrar_usuario ;;
		3) ver_usuario ;;
		4) cambiar_ctrs ;;
		5)
		while true
		do
			clear
			echo "Menu avanzado"
			echo "a. Crear nuevos usuarios en un grupo"
			echo "b. Mostrar informacion de usuarios en un grupo"
			echo "c. Borrar usuarios de un grupo"
			echo "d. Crear un nuevo grupo"
			echo "e. Renombrar un grupo"
			echo "f. Volver al menu anterior"
			echo "g. Salir del programa"

			read -p "Selecciona una opcion: " opcion_avanzada

			case $opcion_avanzada in
			a) anyadir_usuario_grupo ;;
			b) ostrar_usuarios_grupo ;;
			c) borrar_usuario_grupo ;;
			d) crear_grupo ;;
			e) renamear_grupo ;;
			f) break ;;
			g) exit 0 ;;
			*) echo "Elige una opcion valida" ;;
			esac

			read -n 1 -p "Presiona cualquier tecla para continuar"
		done
		;;
	s) exit 0 ;;
	*) echo "Elige una opcion valida" ;;
		
	esac

	read -n 1 -p "Presiona cualquier tecla para continuar" # Para que no se termine todo sin que el usuario se entere
done
