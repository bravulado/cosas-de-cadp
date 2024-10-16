program parcial;

type

mes = 1..12;

rango = 1..20;

		viaje = record
			codigo:integer;
			mes_viaje:mes;
			cant_pasajeros:integer;
			cod_ciudad_dest:rango;
		end;	
		
vector_ciudad = array [rango] of real;

vector_mes = array [mes] of real;


lista =^nodo;
nodo = record
	datos:viaje;
	sig:lista;
end;


		infotren = record;
			codigo:integer;
			cant:integer;
		end;

lista_tren =^nodo_2
nodo = record 
	datos:infotren
	sig:lista_tren;
end;
	

procedure leer (var v:viaje); // se dispone

procedure agregar (var l:lista; v:viaje); // se dispone

procedure cargar (l:Lista); // se dispone

procedure inicializar (var v:vector; var v2:vector_2);// se dispone

procedure agregar_2 (l:lsita; var cant:integer);
var
nue:Integer;
begin
	new(nue);
	nue^.datos:= cant;
	nue^.sig:=l;
	l:=nue;
end;

procedure maximo (v:vector_mes; var max:real; var mes_max:integer);
var
i:rango;
begin
	for i := 1 to 12 do
	begin
		if (v[i] > max) then
		begin
			max:= v[i];
			mes_max:=i
		end;
	end;				
end;
procedure incisisos (l:lista);
var
	aux:lista;
	max,mes_max:integer;
	cant,cant_pasajeros:integer;
begin
	cant_viajes:=0;
	cant_pasajeros:=0;
	aux:=lista;
	max:=-1;
	mes_max:=0;
	while(aux <> nil) do
	begin
		actual:=aux.datos.codigo;
		cant_viajes:=0;
		while(aux <> nil) and (actual = aux^.datos.codigo ) do
		begin
			
			cant_viajes:=cant_viajes+1;
			cant_pasajeros:= cant_pasajeros +aux^.datos.cant_pasajeros;
			
			v[aux^.datos.mes_viaje]:= v[aux^.datos.mes_viaje]+1;
			maximo (v,max,mes_max);
			
			promedio:=cant_pasajeros / cant_viajes;	
			
			
			aux:=aux^.sig;
			
		end;	
		write('el promedio de pasajeros del tren 'actual' es: ',promedio); 
		write('el mes con mayor recaudacion es : ',mes_max)	
end;
