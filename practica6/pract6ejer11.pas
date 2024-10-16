program ejer11;

type

rango = 1..10;

		egresado = record
			numero:integer;
			apellido:string;
			pormedio:real;
		end;
		
		
vector = array [rango] of egresado;

lista =^nodo;
nodo=record
	datos:egresado;
	sig:lista;
end;

procedure leer(var e:egresado);
begin
	read(e.numero);
	if(e.numero <> 0 )then
	begin
		read(e.apellido);
		read(e.promedio);
	end;	
end;

procedure agregar (var l:lista; e:egresado);
var
nue:lista;
begin
	new(nue);
	nue^.datos:=e;
	nue^.sig:=l;
	l:=nue
end;	

procedure cargar (l:Lista);
var
e:egresado;
begin
	leer(e);
	while(e.numero <> 0) then
	begin
		agregar(l,e);
		leer(e);
	end;
end;

{b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio
del egresado (de mayor a menor).}

procedure incisos (pi:lista; e:egresado);
var
act,ant,nue:lista;
begin
	new(nue);
	nue^.datos:=e;
	nue^.datos:=nil;
	if(pi = nil) then
	pi:=nue
	else
	begin
		act:=pi;
		ant:=pi;
		while(act <> nil) and (act^.datos.promedio <> nue^.datos.promedio) do
		begin
			ant:=act;
			act:=act^.sig;
		end;
	end;
	if(act = nil)then		
	begin
		nue^.sig:=pi;
		pi:=nue;
	end
	else
	begin
		ant^.sig:=nue;
		nue^.sig:=act;
	end;	
end;

var
l:Lista;
begin
	cargar(l);
	incisos(l);
end.
	
	





