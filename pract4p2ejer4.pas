program ejer4;

type

rango = 1..1000;

			alumno = record
				nro:integer;
				nombre:string;
				asistencias:integer;
			end;	

vector =array [rango] of alumno;

procedure leer(var a:alumno);
begin
	read(a.nro);
	read(a.nombre);
	read(a.asistencias);
end;

procedure cargar (var:vector);
var
i:rango;
begin
	for i := 1 to 200 do
	v[i]:=0;
end;

function inciso_A (nro_alumno:integer; v:vector; dl:integer):boolean;
var
i:rango;
ok:boolean;
begin
	ok:=false;
	i:=0;
	while((i <= dl) and (not ok) )do
	begin
		if(v[i].nro = nro_alumno) then
		begin
			ok:=true;
			write('el alumno'nro_alumno,'esta en la pocision'i);	
		end
		else
		write('ese alumno no existe !!');
	end;
	inciso_A:=ok
end;

procedure inciso_B (var v:vector; a:alumno; dl:integer; pos:integer);
var
i:rango;
ok:boolean;
begin
	ok:=false;
	if(dl+1)<=1000) and (pos >= 1) and (pos <= dl) then
	begin
		for i := dl downto pos do
		begin
			v[i+1]:= v[i];
			ok:=true;
			v[pos]:=a;
			dl:=dl+1;
		end;
	end;
end;			

var
dl,i:rango;
a:alumno;
v:vector;
begin
	dl:=1;
	leer(a);
	inciso_A(v[i].nro,v,dl);
	inciso_B(v,a,dl,3);
end.	
	



