{La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso y las
notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el alumno
con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a cada alumno
deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente
por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se
recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de la
estructura generada en el inciso 1. El alumno puede no existir.}

program ejer7;

type 
	
rango = 1..24,

			alumno = record
				numero:integer;
				apellido:string;
				nombre:string;
				correo_elec:string;
				año_ingreso:integer;
				año_egreso:integer
				nota:rango;
			end;	

vector = array [rango] of real

lista =^nodo;
nodo = record
	datos:alumno;
	sig:lista;
end;

procedure leer(var a:alumno);
begin
	read(a.numero);
	if(numero <> -1) then
	begin
		read(a.apellido);
		read(a.nombre);
		read(a.correo_elec);
		read(a.año_ingreso);
		read(a.año_egreso);
		read(a.nota);
	end;	
end;	


procedure agregar(var l:lista; a:alumno );
var
	nue:lista;
begin
	new(nue);
	nue^.datos:=a;
	nue^.sig:=l;
	l:=nue;
end;	

procedure cargar (l:lista);
var
	a:alumno;
begin
	leer(a);
	while(a.numero <> -1) then
	begin
		agregar(l,a);
		leer(a);
	end;	
end;

procedure inicializar (var v:vector);
var
i:rango;
begin
	for i:= 1 to 24 do
	v[i]:=0;
end;


function promedio_notas(v:vector):real;
var
	suma:real;
	i:rango;
begin
		suma:=0;
		for i := 1 to 24 do 
		begin
			suma:=suma+v[i];
		end;
		promedio_notas:=suma/24;
end;			


function solo_Pares (dni:integer):boolean;
var
	cumple:boolean
begin
	cumple:=true;
	while(dni <> 0) and (cumple = true) do
	begin
		if(dni MOD 2 =0) then
		cumple:=false
		else 
		solo_Pares:=cumple;
	end;
end;	

procedure incisos (l:lista);
var	
aux:lista;
cant:integer;
min1,min2:integer;
nom1,nom2,ape1,ape2:string;
dir_email1,dir_email2:string;
begin
	min1:=9999;
	min2:=9999;
	nom1:='';
	nom2:='';
	ape1:='';
	ape2:='';
	dir_email1:='';
	dir_email2:='';
	aux:=l;
	while(l  <> nil) do
	begin
		if(aux^.datos.año_ingreso = 2012) and (solo_pares(aux^.dato.dni)) then
		cant:=cant+1
		
		if(aux^.datos.año_egreso < min1)then
		begin
			nom2:=
			dir_email2:=
			ape2:=
			nom1:=aux^.datos.nombre;
			dir_email1:=aux^.datos.correo_elec;
			ape1:=aux^.datos.apellido;
		end
		else
		if(aux^.datos.año_egreso < min2)then
		begin
			nom2:=aux^.datos.nombre;
			ape2:=aux^.datos.apellido;
			dir_email2:=aux^.datos.xorreo_elec;
		end;
		aux:=aux^.sig
	end;
	write(nom1,nom2,ape1,ape2,dir_email1,dir_email2);
	write('el promedio de notas es:'promedio_notas(aux^.datos.nota));
	write(' La cantidad de alumnos ingresantes 2012 cuyo número está compuesto únicamente por impares son : ',cant );
end;	


procedure eliminar (pi:lista; numero);
var
	ant,act:lista;
	act:=pi;
begin	
	while(act <> nil) and (act^.datos.numero <> numero) do
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
l:lista
numero:integer;
begin
	l:=nil;
	cargar(l);
	inicializar(v);
	incisos(act:=pi;
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
l:lista;
numero:integer;
begin
	l:=nil;
	cargar(l);act:=pi;
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
l:lista;
numero:integer;
v:vector;
begin
	l:=nil;
	cargar(l);
	inicializar(v)
	incisos(l);
	read(numero);
	eliminar(l,numero);
end;	
