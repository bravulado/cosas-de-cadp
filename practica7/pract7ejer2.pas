{2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada
(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 1122,
el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el cliente
debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su
seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

program ejer2;

type

rango = 1..6;

		cliente = record
			codigo= integer;
			dni:integer;
			apellido:string;
			nombre:string;
			cod_poliza:codigo;
			monto_basico:real;
		end;
		
vector = array [rango] of real;

lista =^nodo;
nodo = record
	datos:cliente;
	sig:lista;
end;

procedure leer(var c:cliente);
begin
	read(c.codigo);
	if(codigo <> 1122) then
	begin
		read(c.dni);
		read(c.apellido);
		read(c.nombre);
		read(c.cod_poliza);
		read(c.monto_basico);
	end;
end;


procedure agregar (var l:Lista, c:cliente);
var
	nue:lista;
begin
	new(nue);
	nue^.datos:=c;
	nue^.sig:=l;
	l:=nue;
end;

procedure cargar (l:Lista);	
var
	c:cliente;
begin
	repeat
		leer(c);
		agregar(l,c);
	until(dni = 112);
end;

procedure inicializar (var v:vector);
var
begin
	for i :=1 to 6 do
	v[i]:=0;
end;
	
function digitos_9 (dni:integer):boolean;
var
	num,dig:integer;
begin
	num:=0;
	dig:=dni MOD 10;
	if(dni = 9) then
	num:=num+1;
	dig:=dig DIV 10;
	if(num = 2 ) then
	digitos_9:=true;
	else
	digitos_9:=false;
end;	

procedure incisos (l:lista; v:vector);
var
	monto_completo:real;
	aux:lista;
	nom,ape:string;
begin	
	monto_completo:=0;
	aux:=l;
	while(l <> nil)do
	begin
		monto_completo:= aux^.datos.monto_basico+v[aux^.datos.cod_poliza];
		
		if(digitos_9(aux^.datos.dni)) then
		begin
			nom:=aux^.datos.nombre;
			ape:=aux^.datos.apellido;
		end;
		aux:=aux^.sig;
		write('el monto que paga mensualmente es: 'monto_completo);
		write('los clientes con dni que almenos tienen dos 9 son: ',nom,' y ',ape);
	end;
end;		

procedure eliminar (pi:Lista; codigo:integer);
var
	act,ant:lista;
begin
	act:=pi;
	while(act <> nil) and (act^.datos.codigo <> codigo) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act <> nil)then	
	if(act = nil)then
	pi:=pi^.sig
	else	
		ant^.sig:=act^.sig;
		dispose(act);
end;		

var
	l:Lista;
	v:vector;
	codigo:integer;
begin	
	l:=nil;
	cargar(l);
	inicializar(v);
	incisos(l,v);
	read(codigo);
	eliminar(l,codigo);
end.		
