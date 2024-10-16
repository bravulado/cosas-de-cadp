program ejer2;

type

rango = 1..500; 

		alumnos = record
			nombre: string;
		end;
			
vector = array  [rango] of alumnos;


{{{{{{{{{{{{{{{{{{{{A}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

procedure leer(var a:alumnos);
begin
	read(a.nombre);
end;
procedure cargar (var v:vector);
var
dl:rango;
begin
	leer(V[dl]);
	while(dl < 500) and (v[dl].nombre <> 'zzz') do
	begin
		dl:=dl+1;
		leer(v[dl]);
	end;	
end;

{{{{{{{{{{{{{{{{{{{{{{{{{B}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

procedure remover (indice:integer; var v:vector; var dl:integer );
var
	i:rango;
begin
	if(indice <= dl) then
	begin
		dl:= dl-1;
		for i := indice for dl do
		v[i]:=v[i+1];
	end;
end;

procedure eliminar (nombre: string; var v:vector; var dl:integer);
var
ok:boolean;
i:integer;
begin
	i:=1;
	ok:= false;
	repeat
		if(v[i].alumnos = nombre) then
		begin
			ok:=true;
			remover(i,v,dl);
		end;
		i:=i+1;
	until((ok) or (i>dl))
end;

{{{{{{{{{{{{{{{{{{{{{{{{{{{{C}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}		

procedure insertar (var v:vector; var dl:integer; num:integer; pos:integer);
var
	i:integer;
	ok:boolean;
begin
	ok:=false;
	if( (dl+1)<=500) and (pos >= 1) and (pos <= dl) then
	begin
		for i := dl downto pos do
		begin
			v[i+1]:= v[i];
			ok:=true;
			v[pos]:=num;
			dl:=dl+1;
		end;
	end;
end;
{{{{{{{{{{{{{{{{{{{{{{{{{D}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

procedure agregar (var v:vector; var dl:integer; num:integer);
var
	ok:boolean;
begin
		ok:=false;
		if((dl+1) <= 500 ) then
		begin
			ok:= true;
			dl:=dl+1;
			v[dl]:=num;
		end;
end;			
{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

var
	dl:integer;
	nombre:string;
	v:vector;
	a:alumno;
begin
	dl:=1;
	leer(a);
	while(a.nombre <> 'zzz') and (dl <= 500) do
	begin
		read(nombre),
		eliminar(nombre,v,dl);
		
		read(nombre);
		insertar(v,dl,nombre,4);
		
		rad(nombre);
		agregar(v,dl,nombre);
	end;
end.
