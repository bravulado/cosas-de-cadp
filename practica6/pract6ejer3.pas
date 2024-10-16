program ejer3


procedure armarNodo(var L,ult: lista; v: integer);
var
aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	if(l=nil)then
	begin
		L := aux;
		ult:=aux;		
	end
	else
	begin
		ult^.sig:=aux;
		ult:=aux;
	end;	
end;

