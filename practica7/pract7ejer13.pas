{La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello, Amazon
cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura, Historia,
Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de veces
que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la editorial
“Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con más
de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial y el
título de cada libro con más de 250 ventas.}


program ejer13;

type 

	rango = 1..35;
	
	
		libro = record
			titulo:string;
			nom_editorial:string;
			cant_paginas:integer;
			ano_edicion:integer;
			cant_veces_vendido:integer;
			cod_area:rango;
		end;	

vector_tematicas = array [rango] of string

lista =^nodo
nodo = record
	dato:libro;
	sig:lista;
end;	


procedure leer (var li:libro);
begin
	read(li.titulo);
	read(li.nom_editorial);
	read(li.cant_paginas);
	read(li.ano_edicion);
	read(li.cant_veces_vendido);
	read(li.cod_area);
end;

procedure agregar (var l:lista; li:Libro);
var
nue:lista;
begin
	new(nue);
	nue^.dato:=li;
	nue^.dato:=l;
	nue:=l;
end;

procedure cargar (l:lista);
var
li:libro;
begin
	leer (li);
	repeat
		agregar (l,li);
	until (li.titulo = 'relato de un naufrago');
end;		
