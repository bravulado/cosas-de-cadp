{. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones.
De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en toneladas que puede
transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De cada
viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros recorrida,ciudad de destino, año en que se realizó el viaje y DNI del chofer.
 La lectura finaliza cuando se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas
y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el
viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}


program ejer5;

type

rango=1..100;

	camion = record
		patente:integer
		año_fabricacion:integer;
		capacidad:real;
	end;
	
	viaje = record	
		codigo_viaje:integer;
		codigo_camion:rango;
		km_recorridos:real;
		ciudad_destino:string;
		año_de_viaje:integer;
		dni:integer;
	end;
	
vector_camiones = array [rango] of camion;

lista =^nodo;
nodo = record
	datos=viaje;
	sig:lista;
end;


procedure leer(var v:viaje);
begin
	read(v.codigo_viaje);
	if(v.codigo_viaje <> -1) then
	begin
		read(v.codigo_camion);
		read(v.km_recorridos);
		read(v.ciudad_destino);
		read(v.año_de_viaje);
		read(v.dni);
	end;
end;

 procedure agregar (var l:lista, v:viaje);
 var
	nue:lista;
begin
	new(nue);
	nue^.datos:=v;
	nue^.sig:=l;
	l:=nue;
end;

procedure cargar (l:lista);
var
	v:viaje;
begin
	leer(v);
	while(v.codigo_viaje <> -1) do
	begin
		leer(v);
		agregar(l,v);
	end,
end;

procedure inicializar (var v:vector); 
var 
	i:rango;
begin
	for i :=1 to 100 do
	v[i]:=0;
end;

procedure inciso_A (v:viaje; var max_patente,min_patente:integer; var max_km,min_km:integer);
begin
	if(v.km_recorridos > max_km ) then
	begin
		max_km:=v.km_recorridos;
		max_patente:=v.codigo_camion;
	end;	
	
	if(v.km_recorridos < min_km) then
	begin
		min_km:=v.km_recorridos;	
		min_patente:=v.vodigo_camion;
	end;
end;


procedure inciso_B (vc:vector_camiones; var cant:integer)
var
i:rango;
begin
	for i := 1 to 100 do
	begin
		if (v[i] < 30.5) then
		cant := cant+1;
	end;
end;		
			

procedure incisos (l:lista);	
var
cant,max_patente,min_patente:integer;
min_km,max_km:real;
vc:vector_camiones;
aux:lista;
begin
	aux:=l;
	cant:=0;
	min_km:=9999;
	max_km:=-1;
	max_patente:0;
	min_patente:=0;
	while(l <> nil) do
	begin
		inciso_A(aux^.datos,max_patente,min_patente,max_km,min_km);
		
		inciso_B(vc,cant);
		aux:=aux^.sig;
		end;	
		write('la patente con km recorridos es: ',max_patente,' y  la que menos km tiene es: ',min_patente);
		write('los camiones con mas de 30.5 toneladas son: 'cant);
end;

var
	l:lista;
	vc:vector_camiones
begin
	l:=nil;
	inicialzar(vc)
	cagar(l)
	incisos(l)
end.
