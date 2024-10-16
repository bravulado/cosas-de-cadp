{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho
casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que
prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega una
persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
Invocar dicho módulo en el programa principal.}


program ejer1;

type

rango = 1..5;

		persona = record
			dni:integer;
			nombre:string;
			edad:integer;
			codigo:rango;
		end;	
		
		
vector = array [rango] of integer

lista=^nodo
nodo = record
	datos:persona;
	sig:lista;
end;	
		
procedure leer(var p:persona);
begin
	read(p.dni);
	if(p.dni <> 33555444)then
	begin
		read(p.nombre);
		read(p.edad);
		read(p.categoria);
	end;
end;

procedure agregar(var l:lista; p:persona);
var
nue:lista
begin
	nue^.datos:=p;
	nu^.sig:=l;
	l:=nue;
end;

procedure cargar (L:Lista);
var
p:persona;
begin
	leer(p);
	while(p.dni <> 33555444) do
	begin
		agregar(l,p);
		leer(p)
	end;
end;

procedure inicializar(var v:vector);
var
	i:rango;
begin
	for i := 1 to 5 do
	v[i]:=0;
end;


function mas_pares (dni:integer):boolean;
var
	dig,par,inpar:integer;
begin
	par:=0;
	inpar:=0;
	while(dni <> 0) do
	begin
		dig:= dni MOD 10;
		if(dni MOD 2 =0 ) then
		begin
			par:= par+1;
			else
			inpar:=inpar+1;
			dni:=dni DIV 10;
		end;
	end;
	if(par > inpar) then
	mas_pares:=true;
	else
	mas_pares:=false;
end;	


procedure dosmax(v:vector; var codmax1,codmax2:genero; var max1,max2:integer);
var
i:rango;
begin
	for i :=1 to 5 do
	begin
		if(v[i] > max) then
		begin
			codmax2:=codmax1;
			max2:=max1;
			codmax1:=i;
			max1:=v[i];
		end
		else
		begin
			if(v[i] > max2) then
			begin
				max2:=v[i];
				codmax2:=i;
			end;
		end;
	end;   
end;
procedure incisos (l:lista);
var
cant:integer;
aux:lista;
codmax1,codmax2:genero;
max1,max2:integer;
v:vector;
i:rango;
begin
	aux:=l;
	max1:=0;
	max2:=0;
	codmax:=0;
	codmax:=0
	while(l<>nil ) do
	begin
		if(mas_pares(au^.datos.dni)) then
		cant:= cant+1;

		
		v[aux^.datos.codigo]:=v[aux^.datos.codigo]+1;
				dosmax(v,codmax1,codmax2,max1,max2);
	end;
	aux:=aux^.sig;
	write('la cantidad de personas con mas dni pares qie inpares son: ',cant);
	write('los dos codigos mas elegidos son: ',codmax1,codmax2);
end;				

procedure inciso_C(pi:lista; dni:integer);
var
	ant,act:lista;
begin
	act:=pi;
	while(act<>nil) and (act^.datos.dni <> dni) do
	begin
		ant:=act;
		act:=act^.sig;
	end;	
	if(act<>nil) then
	if(act = nil) then
	pi:=pi^.sig
	else
		ant^.sig:=act^.sig;
		dispose(act);
end;


var
l:Lista;
v:vector;
dni:integer;
begin
	l:=nil;
	cargar(l);
	inicializar(v);
	incisos(l);
	read(dni);
	inciso_C(l,dni);
end;	
