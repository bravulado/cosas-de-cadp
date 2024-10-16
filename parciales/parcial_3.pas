program parcial;

type 

rango_equipo:1..28;
rango_calificacion:1..10;
fechas:1..27;

		jugador = record
			codigo:integer;
			apeynom:string;
			cod_equipo:rango_esquipo;
			ano_nacimiento:integer;
			calificacion:rango_calificacion;
		end;
		
vector = array [fechas] of rango_calificacion;

lista =^nodo 
nodo = record			
	dato:jugador;
	sig:lista;
end;	

procedure leer(var j:jugador);// se dispone

procedure agregar(var l:lista; j:jugador);// se dispone 

procedure cargar (l:lista);// se dispone

function 3dig_inpares (codigo : integer):boolean;
var
dig,inpar:integer;

begin
	while(codigo <> 0) then
	begin
		dig:codigo MOD 10 ;
		if(codigo MOD 3 = 0) then
		inpar:= inpar + 1;
		codigo:=codigo DIV 10;
	end;		
		if (inpar = 3) then
		3dig_inpares:= true;
		else
		3dig_inpares:= false;
end;		

procedure dosmax(v:vector; l:lista);
var
max1,max2:integer;
codmax1,codmax2:integer;
begin
	max1:=-1;
	max2:=-1;
	for i := 1 to 27 do 
	begin
		if(v[i] > max1) then
		begin
			codmax2:=codmax1;
			max2:=max1;
			codmax1:=i
			max1:=v[i];
		end
		else
		if(v[i] > max2) then
		begin
			max2:=
			codmax2:=
		end;
	end;	
end;


procedure incisos (l:Lista);
var
v:vector;
cant:integer;
begin
	while (l <> nil ) do
	begin
		if(l^.dato.ano_nacimiento < 1989) then
		cant:= cant+1;
		
		if(v[l^.dato.calificaion] > 14) then
		dosmax(v,l)
