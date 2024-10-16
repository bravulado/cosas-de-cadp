{El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas, 2:
planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido observados.
Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe procesarse). La
estructura generada debe mantener el orden en que fueron leídos los datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.}

program ejer6;

type 

rango = 1..7;

		objeto = record
			codigo:integer;
			categoria:rango;
			nombre:string;
			dist_tierra:real;
			nom_descubridor:string;
			año_descubrimiento:integer;
		end;
		
vector = array [rango] of integer;

lista =^nodo;
nodo = record			
	datos:objeto;
	sig:lista;
end;

procedure leer (var o:objeto);
begin
	read(o.codigo);
	if(o.codigo <> -1 ) then
	begin
		read(o.categoria);
		read(o.nombre);
		read(o.dist_tierra);
		read(o.nom_descubridor);
		read(o.año_descubrimiento);
	end;
end;

procedure agregar (var l:lista; o:objeto);
var
	nue:lista;
begin
	new(nue);
	nue^.datos:=o;
	nue^.sig:=l;
	l:=nue;	
end;

procedure cargar (l:lista);
var
	o:objeto;
begin
	leer(o);
	while(o.codigo <> -1) do
	begin
		leer(o);
		agregar(l,o);
	end;		
end;

procedure inicializar (var v:vector);
begin
	for i := 1 to 7 do
	v[i]:=0;
end;


function mas_pares (codigo:integer):boolean
var
dig,par,inpar:integer;
begin
	par:=0;
	inpar:=0;
	while(codigo <> 0) do
	begin
		dig:=codigo MOD 10
		if(dni MOD 2= 0) then
		par:= par+1;
		else
		inpar=inpar+1;
		dig:=dig DIV 10;
	end;	
	if(par > inpar) then
	mas_Pares:=true
	else 
	mas_pares:=false;
end;

procedure incisos (l:lista);
var
	v:vector;
	aux:lista;
	nom:string;
	max1,max2:real;
	codmax1,codmax2,cant:integer;
begin
	max1:=-1;
	max2:=-1;
	codmax1:=0;
	codmax2:=0;
	cant:=0;
	aux:=l;
	while(l  <> nil) do
	begin
	
		if(aux^.datos.dist_tierra > max1) then
		begin
			max2:=max1;
			codmax2:=codmax1;
			max1:=aux^.datos.dist_tierra;
			codmax1:=aux^.datos.codigo;
		end
		else
		if(aux^.datos.dist_tierra > max2)then
		begin
			max1:=aux^.datos.dist_tierra;
			codmax1:=aux^.datos.codigo;
		end;
		
		if(aux^.datos.nom_descubridor = 'galileo galilei') and (aux^.datos.año_descubrimiento < 1600) then
		cant:= cant+1;
		
		v[aux^.datos.categoria]:= v[aux^.datos.categoria]+1
		
		if(mas_pares(aux^.datos.codigo)) then
		nom:= aux^.datos.nombre
	
		aux:=aux^.sig;
	end;
	write('los objetos mas lejanos a la tierra son: ',codmax1,' y ',codmax2),
	write('la cantidad de planetas descubiertos por galileo son: ', cant);
	write('el nombres de la estrella cuyo código de objeto posee más dígitos pares que impares es: ',nom);
end;		
		
var
l:Lista;
v:vector;		
begin	
	l:=nil;
	cargar(l);
	inicializar(v);
	incisisos(v);	
end.
		
		
