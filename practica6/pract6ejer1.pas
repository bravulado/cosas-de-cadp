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

procedure imprimir (pri:lista);
begin
   while(pri <> nil)do
   begin
      writeln('dsfsdf',pri^.num);
       pri:=pri^.sig;
    end;
end;


var
  pri : lista;
  valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
   read(valor);
   while (valor <> 0) do 
   begin
     armarNodo(pri, valor);
     writeln('ingrese un numero');
     read(valor);
   end;
   imprimir(pri);
end.
