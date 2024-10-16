{12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que ofrece:
1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla con
información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se conoce el
nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una sola suscripción.
La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit o a
Todas las clases. Esta lista debe estar ordenada por DNI.}

program ejer12;

type

rango_suscripcion = 1..4;

	cliente = record;
		nombre:string;
		dni:integer;
		edad:integer;
		tipo_suscripcion:rango_suscripcion;
	end;	

vector_suscripcion = array [rango_suscripcion] of real;

lista = ^nodo
nodo=record
	dato=cliente,
	sig:lista;
end;

procedure leer(var c:cliente);
begin
	read(c.dni);
	while(c.dni <> 0) do
	begin
		read(c.nombre);
		read(c.edad);
		read(c.tipo_suscripcion);
	end;
end;

procedure agregar (var l:lista; c:cliente);
var
nue:lista;
begin
	new(nue);
	nue^.dato:=c;
	nue^.sig:=l;
	l:=nue;
end;

procedure cargar (l:lista);
var
	c:cliente;
begin
	leer(c);
	while(c.dni <> 0) do
	begin
		agregar(l,c);
		leer(c);
	end;	
end;	

procedure inicializar (var vs:vector_suscripcion);
var
i:rango_suscripcion;
begin
	for i:= 1 to 4 do
	vs:=0;	
end;
	
{- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit o a
Todas las clases. Esta lista debe estar ordenada por DNI
}

Procedure InsertarElemento ( var pri: lista; c:cliente);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := c.nombre;
    act := pri;
    ant := pri;
    
    while (act<>NIL) and (act^.dato.dni < c.dni) do 
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   
    else  
        ant^.sig  := nue; 
    nue^.sig := act ;
end;



procedure ganancia_total(vs:vector_suscripcion; var total:real);
var
i:rango_suscripcion;
begin
	for i := 1 to 4 do 
	begin
		total:= total+v[i];
	end;
end;
	
procedure dos_max(vs:vector_suscripcion; var max1,max2:integer; var tipo_suscrpcion_max1,tipo_suscripcion_max2:tipo_suscripcion);
var
i:rango_suscripcion;
begin
	for i :=1 to 4 do 
	begin
		if(v[i] > max1) then
		begin
			max2:=max1
			tipo_suscrpcion_max2:=tipo_suscripcion_max1
			max1:=v[i];
			tipo_suscrpcion_max1:=i;
		end
		else
		if(v[i] > max2) then
		begin
			max2:=v[i];
			tipo_suscrpcion_max2:=i;
		end;
	end;
end;	
		
			
procedure incisos(l:lista);	
var
total:real;
vs:vector_suscripcion;
max1,max2:integer;
tipo_suscrpcion_max1,tipo_suscripcion_max2:rango_suscripcion;
begin
	max1:=-1;
	max2:=-1;
	total:=0;
	while(l <> nil) do
	begin
		ganancia_total (vs,total);
		
		vs[l^.dato.tipo_suscripcion]:= vs[tipo_suscripcion]+1;
		dos_max (vs,max1,max2,tipo_suscrpcion_max1,tipo_suscripcion_max2);
		
		if(l^.dato.edad > 40 ) and (l^.dato.tipo_suscripcion = 'crossfit') then
		incertar_ordenado (l, l^.dato);
		
		
		l:=l^.sig;	
	end;
	write ('la ganancia total de fortaco es: ',total);
	write('las sus cripciones mas caras son: 'tipo_suscrpcion_max1,' y ',tipo_suscripcion_max2);	
end;


var
vs:vector_suscripcion,
l:lista;
begin
	l:=nil;
	cargar(l);
	inicialixar(vs);
	incisos	(l);
end.
