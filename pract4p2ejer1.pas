program ejer1;

type

rango = 1..500;

vector = array [rango] of integer;

procedure cargar (var v:vector);
var
	i:integer;
begin
	for i:= 1 to 500 do
	read(v[i])
end;

function buscar (v:vector;dl:integer; n:integer ):boolean;
var
i:integer;
ok:boolean;
begin
	ok:=false;
	i:=0;
	while((i <= dl) and (not ok) )do
	begin
		if(v[i] = n) then
		begin
			ok:=true;
			write('el valor: ',n,'en la posicion',i);	
		end
		else
		write('el valor no esta en esa posicion');
	end;
	buscar:=ok
end;



		
