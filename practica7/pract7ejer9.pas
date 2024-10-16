{Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene:
código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5:
comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Dicha estructura
no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se debe
leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI del crítico,
apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura finaliza cuando se lee
el código de película -1 y la información viene ordenada por código de película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que
impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como
parámetro (el mismo puede no existir).}

program ejer9;
 
type

rango =1..8;

		pelicula = record
			codigo:integer;
			titulo:string;
			cod_genero:rango;
			puntaje:real;
		end;	
		
		
		critica = record
			dni:integer
			nombre:string;
			codigo:integer;
			puntaje:real;
		end;	
		
lista=^nodo;
nodo = record
	datos:pelicula;
	sig:lista;
end;

lista_c =^nodo_c;
nodo_c = record
	datos:critica;
	sig:lista_c;
end;	
			
vector = array [rango] of integer;

procedure leer (var c:critica);
begin
	read(c.);
	if(c.dni <> -1) then
	begin
		read(c.nombre);
		read(c.codigo);
		read(c.puntaje);
	end;
end;

procedure agregar (var l:Lista; c:critica);
var
nue:Lista;
begin
	new(nue);
	nue^.datos:=c;
	nue^.sig:=l;
	l:=nue;
end;

procedure cargar (l:Lista);
var
c:critica;
begin
	leer(c);
	while(c.dni <> -1) do
	begin
		agregar (l,c);
		leer(c);
	end;
end;

{b) Informar el código de género que más puntaje obtuvo entre todas las críticas.}

procedure incisos (l:lista);
var
aux:lista;
begin
	aux:=l;
	while(l <> nil) do
	begin
		
