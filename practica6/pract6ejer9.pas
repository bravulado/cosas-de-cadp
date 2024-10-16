{EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o
false en caso contrario}

{{{{{{{{{{{{{{{{{{{{A}}}}}}}}}}}}}}}}}

function esta_ordenada (pri:lista):boolean;
var
orden:boolean;
mayor:integer;
begin
	orden:=true;
	mayor:=-1;
	while(pri <> nil) and (orden = true) then
	begin
		mayor:=pri^.datos;
		write('bien')
	end
	else 
	begin
		orden:=false;
		write('no esta ordenada');
	end;
		pri:=pri^.sig;
		esta_ordenada:=orden;
end;
	
	
	
{b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si
existe). Nota: la lista podría no estar ordenada.}	

{{{{{{{{{{{{{{{{{B}}}}}}}}}}}}}}}}}}}}}	

procedure eliminar (pi:lista);
var
act,ant:lista;
begin
	act:=pi;
	while(act <> nil ) and (act^.datos <> valor) then
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act <> nil)then
	if(ant <> nil)then	
	pi:=pi^.sig
	else
		ant^.sig:=act^.sig;
		dispose(act);
end;


{Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista
con todos los elementos de la lista L mayores que A y menores que B.}

{{{{{{{{{{{{{{{{{{{{{{{{{{{C}}}}}}}}}}}}}}}}}}}}}}}}}}}}		

procedure sublista(l:lista;a,b:integer);
var
nue:lista;
begin
	nue:=nil;
	while(l <> nil) then
	begin
		if(l^.datos > a) and (l^.datos) then
		begin
			armarNodo(nue,l^.datos)//ejercicio 1
			write('cumple',l^.num);
		end;	
		l:=l^.sig;
	end;
	write('cosa');
end;
			
			
	
