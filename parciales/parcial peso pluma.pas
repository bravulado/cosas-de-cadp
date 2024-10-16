program ejer_parcial;

type

rango = 1..5;

	sesion = record
		titulo:string;
		nom_art:string;
		genero:rango;
		ano_estreno:integer;
		cant_reproducciones:integer;	
	end;
	
lista=^nodo
nodo = record;
	datos=sesion;
	sig=lista;
end;

vector = array [rango] of integer;

procedure leer(var s:sesion);
begin
	read(s.titulo);
	read(s.nom_art);
	read(s.genero);
	read(s.ano_estreno);
	read(s.cant_reproducciones);
end;

procedure agregar (var l:lista; s:sesion);
var
nue:lista;
begin
	new(nue);
	nue^.datos:=s;
	nue^.sig:=l;
	l:=nue;
end;

procedure cargar(l:Lista);
var
s:sesion;
begin
	repeat
		leer(s);
		agregar(l,s);
	until(s.nom_art = peso_pluma);
end;

procedure incetar_ordenado (pi:lista; s:sesion);	
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := s;
    act := pri;
    ant := pri;
    while (act<>NIL) and (act^.datos.titulo > s.titulo) do 
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   
    else  
        ant^.sig  := nue; 
    nue^.sig := act ;
end;


procedure dos_max (v:vector; var max1,max2:integer; var codmax1,codmax2:integer);
var
i:rango;
begin
	for i := 1 to 5 do
	begin
		if( v[i] > max1 ) do 
		begin
			max2:=max1;
			codmax2:=codmax1;
			max1:=v[i];
			codmax1:=i;
		end
		else
		if(v[i] > max2) then
		begin
			max2:=v[i];
			codmax2:=i;
		end;
	end;
end;
