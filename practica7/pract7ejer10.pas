{Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les
provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la
ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo de la empresa se
registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de
meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información se
ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada empresa
se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).
Una vez leída y almacenada la información, calcular e informar:

b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código de
empresa posee al menos dos ceros.

c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al
total de hectáreas.

d. La empresa que dedica más tiempo al cultivo de maíz

e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}

program ejer 10;

type

rango_cultivo:1..20;

	empresa = record 
		codigo:integer;
		nombre:string;
		est_o_priv:string;
		nom_ciudad_radica:string,
		cult_realiza:rango_cultivo;
	end;
	
	cultivo = record
		tipo:string;
		cant_hect:integer;
		cant_meses:integer;
	end;
	
vector = array [rango_cultivo] of cultivo;

lista = ^nodo
nodo = record
	dato:empresa;
	sig:lista;
end;

procedure leerCultivo(var c:cultivo);
begin
	read(c.tipo);
	read(c.cant_hect);
	if(c.cant_hect <> 0) then
	begin
		read(c.cant_meses);
	end;
end;


procedure leerVector(var v:vector);
dl:integer;
c:cultivo;
begin
	dl:=0;
	leerCultivo(c);
	while(c.cant_hect <> 0) and (dl < 20) do
	begin
		dl:=dl+1;
		v[dl].tipo:=c.tipo
		v[dl].cant_hect:=c.cant_hect;
		v[dl].cant_meses:=c.cant_meses;
		leerCultivo(c);
	end;	
end;


procedure leer(var e:empresa);
begin
	read(e.codigo);
	if(e.codigo <> -1)then
	begin
		read(e.nombre);
		read(e.est_o_priv);
		read(e.nom_ciudad_radica);
		read(e.cant_realiza);
		leerVector(v)
		
	end;	
end;	

procedure agregar (var l:Lista; e:empresa;);
var
nue:lista;
begin
	new(nue);
	nue^.dato:=e;
	nue^.sig:=l;
	l:=nue,
end;

procedure cargar (l:lista);
var
e:empresa;
begin
	leer(e);
	while(e.codigo <> -1) do
	begin
		agregar(l,e);
		leer(e);
	end;	
end; 

function cumple (tipo:string):boolean;
var
dl:integer;
begin
	

procedure incisos (l:lista);
var
nom:string;
begin
	while(l <> nil) do
	begin
		if(l^.dato.nom_ciudad_radica = 'san miguel del monte') and ()
	end;
