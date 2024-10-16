program ejer6

type

rango= 1..7;

		sonda = record
			nombre:string;
			duracion:integer;
			costo_construcion:real;
			costo_manteniminento:real;
			rango_de_espectro:rango;
		end;	
			
lista =^nodo;
nodo = record
	datos:sonda;
	sig:lista;
end;

vector = array [rango] of integer;	
			
procedure leer(var s:sonda);
begin
	read(s.nombre);
	if(s.nombre = 'GAIA') then
	begin
		read(s.duracion);
		read(s.costo_construccion);
		read(s.costo_mantenimiento);
		read(s.rango_de_espectro);
	end;
end;

procedure agregar(var l:Lista; s:sonda);
var
nue:lista;
begin
	new(nue);
	nue^.datos:=s;
	nue^.sig:=l;
	l:=nue;
end;

procedure cargar(l:lista );
var
s:sonda;
begin
	leer(s);
	while(s.nombre = 'GAIA')do
	begin
		agregar(l,s);
		leer(S);
	end;
end;

procedure inicializar (var v:vector);
var
i:rango;
begin
	for i := 1 to 7 do
	v[i]:=0
end;

procedure informo (v:vector);
var
i:rango;
begin
	for i:= 1 to 7 do
		write('la cantidad de sondas de rango',i,'son: ',v[i]);
end;
{a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).}


procedure incisisos (l:lista);
var
suma:real;
nomax:string;
max:integer;
aux:lista;
begin
	suma:=0;
	aux:=l;
	max:=-1;
	nomax:='';
	suma:=aux^.datos.costo_mantenimiento + aux^.datos.costo_construccion;
	if(suma > max) then
	begin
		max:=suma;
		nomax:=aux^.datos.nombre;
	end;
	v[rango_de_espectro]:=v[rango_de_espectro]+1;
	informo(v);
	write('la sonda mas costosa es: ',nomax);
end;

var
l:Lista;
v:vector;
begin
	l:=nil;
	cargar(l);
	inicializar(v);
	incisos(l,v);
end.

