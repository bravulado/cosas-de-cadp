{Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y peso
registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un programa
que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo}

program ejer4;

type

rango = 1..42;

		paciente = record 
			nombre:string;
			apellido:string;
			peso:rango;
		end;	
		
lista =^nodo
nodo = record 
	datos:paciente;
	sig:lista;
end;

vector = array [rango] of real;

procedure leer(var p:paciente);// se dispone

procedure agregar (var l:Lista; p:paciente);// se dipone

procedure cargar (l:lista); // se dispone

procedure incisos (var v:vector) // se dipone

procedure incisos (l:lista);
var
	aux:lista;
	max:real;
	dl:integer
	aux_2:integer;
	sem_max,i,peso_total:integer;
begin
	aux:=l;
	dl:=0;
	max:=-1;
	aux_2:=1;
	while(l <> nil) do
	begin
		for i := 1 to dl do
		begin
			if(v[i] > max) then
			begin
				max:=v[i];
				sem_max:=i;
			end;
			peso_total:=dl-v[aux_2];
		end;		
	end;
end;

var
l:lista;
begin
	l:=nil;
	inicializar(v);// se dispone
	cargar(l);// s edipone
	incisos(l);
end;	
