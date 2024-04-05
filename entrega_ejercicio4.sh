#!/bin/bash


# Crear un script llamado "Agenda" que permite mantener una lista de personas con sus datos personales 
# (nombre, apellidos, dirección, correo electrónico y  teléfono). El script dispondrá de un menú de opciones
# permanentes y ofrecerá las opciones de añadir contacto, buscar, listar contactos, ordenar por orden alfabético
# y borrar registros. Los datos de la agenda están almacenados en un documento agenda.txt y el carácter separador entre campos será ‘;’


# Funcion para anyadir contactos
function add_contacto {
	read -p "Introduce un nombre: " nombre
	read -p "Introduce el primer apellido: " apellido1
	read -p "Introduce el segundo apellido: " apellido2
	read -p "Introduce la direccion: " dire
	read -p "Introduce el correo: " correo
	read -p "Introduce el telefono: " telefono

	echo "$nombre;$apellido1;$apellido2;$dire;$correo;$telefono" >> agenda.txt # Meto los datos en la agenda
}

# Fumcion para buscar contactos
function buscar_contacto {
	read -p "Introduce qué persona quieres buscar: " busqueda
	grep -Fi "$busqueda" agenda.txt | while IFS=';' read -r nombre apellido1 apellido2 dire correo telefono; do # Busqueda en la agenda
		echo "Nombre: $nombre"
                echo "Apellidos: $apellido1 $apellido2"
                echo "Direccion: $dire"
                echo "Correo electronico: $correo"
                echo "Telefono: $telefono"
                echo "·········································" # Barra separadora de contactos
	done
	sleep 5
}

# Funcion para listar los contactos
function listar_contactos {
	while IFS=';' read -r nombre apellido1 apellido2 dire correo telefono # Mientras encuentre un ; sigue leyendo y haciendo el do
	do
		echo "Nombre: $nombre"
		echo "Apellidos: $apellido1 $apellido2"
		echo "Direccion: $dire"
		echo "Correo electronico: $correo"
		echo "Telefono: $telefono"
		echo "·········································" # Barra separadora de contactos
	done < agenda.txt
	sleep 5
}

# Funcion para ordenar los contactos
function ordenar {
	sort -t ';' -k 1,1 -k 2,2 agenda.txt > agenda_ordenada.txt
	mv agenda_ordenada.txt agenda.txt # La vuelvo a meter en la propia agenda para que resulte ordenada
}

# Funcion para borrar un contacto
function borrar {
	read -p "Introduce un contacto a borrar: " nombre
	sed -i "/$nombre/d" agenda.txt # Elimina todas las lineas de la agenda que contengan el nombre introducido
				       # La d al final de la expresion es para borrar esa linea
}

# MENU
while true
do
	clear # Borro la pantalla entera para poner el menu
	echo "--------------------------------------------------"
	echo "1. Anyadir contacto."
	echo "2. Buscar contacto."
	echo "3. Listar contactos."
	echo "4. Ordenar la agenda."
	echo "5. Borrar contacto."
	echo "6. Salir."
	echo "--------------------------------------------------"
	read -p "Elige una opcion: " opcion # Leo la opcion que se quiera usar en el menu
	case $opcion in
	1) add_contacto ;;
	2) buscar_contacto ;;
	3) listar_contactos ;;
	4) ordenar ;;
	5) borrar ;;
	6) exit 0 ;;
	*) echo "Opcion invalida" ;; # En caso de no introducir esos numeros dice el mensaje de error
	esac
done
