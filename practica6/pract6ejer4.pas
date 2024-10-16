program JugamosConListas;

type

lista = ^nodo;
nodo = record
	num : integer;
	sig : lista;
end;


procedure armarNodo(var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;

procedure maximo (l:lista; max:lista);
begin
	max:=l;
	while(l <> nil)do
	begin
		if( l^.num > max^.num ) then
		begin
			max:=l^.num;
			l:=l^.sig;
		end;
	end;
	write(max);	
end;

procedure minimo (l:lista; min:lista);
begin
	min:=l;
	while( l<>ni l)do
	begin
		if(l^.num < min^.num)then
		begin
			min:=l^.num;
			l:=l^.num;
		end;    
	end;
	write(min);
end;

function multiplo (l:lista; a:integer):integer;
begin
	cant:=0;
	while(l <> nil) do
	begin
		if(l^.num MOD a = 0) then
		begin		
			cant:=cant+1;
			l:=l^.sig;
		end;
	end;
	multiplo:=cant;
	writeln('los multiplos de ',a,'son: ',cant);
end;


var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	writeln(‘Ingrese un numero’);
	read(valor);
	while (valor <> 0) then begin
		armarNodo(pri, valor);
		writeln(‘Ingrese un numero’);
		read(valor);
end;
. . . { imprimir lista }
end.
