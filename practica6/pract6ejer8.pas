


procedure incertar_ordenado (var pi:lista; valor:integer);
var
act,nue,ant:lista;
begin
	new(nue);
	nue^.datos:=valor;
	nue^.sig:=nil;
	if(pi = nil)then
	pi:=nue;
	else
	begin
		act:=pi;
		ant:=pi;
		while(act <> nil)and (act^.datos > nue^.datos)do
		begin
			ant:=act;
			act:=act^.sig;
		end;
	end;
	if(act = nil) then
	begin
		nue^.sig:=pi;
		pi:=nue;
	end
	else
	ant^.sig:=nue;
	nue^.sig:=act;
end;		
