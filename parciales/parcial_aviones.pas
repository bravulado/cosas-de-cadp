program parcial_aviones;

type

rango= 1000..2500;

type

		viaje = record
			codigo:rango;
			ano_viaje:integer;
			cant_pasajeros:integer;
			ciudad_dest:string;
		end;
		
vector = array [rango] of real ;

lista =^nodo;
nodo = record
	datos:viaje;
	sig:lista;
end;

procedure leer(var v:viaje); // se dispone

procedure agregar (var l:lista; v:viaje); // se dispone

procedure cargar (l:Lista); // se dispone

procedure inicializar (var v:vector ); 
var
i:rango;
begin
	for i:= 1000 to 2500 do
	v[i]:=0;
end;	


procedure inicializar_vectores(var v1,v2:vector);
var 
i:rango;
begin
	for i := 1000 to 2500 do
	begin
		v1[i]:=0;
		v2[i]:=0;
	end;
end;


function multi_10(ano:integer):boolean;
begin
	multi_10:=(ano MOD 10 = 0);
end;

procedure agregar_nue (l:lista;v:viaje);
var
nue:lista;
begin
	new(nue);
	nue^.datos:=v;
	nue^.sig:=l;
	l:=nue;
end;	



procedure max_2(v:vector; var codmax:integer; var max:real);
var
i:rango;
begin
	for i := 1000 to 2500 do
	begin
		if (v[i] > max) then
		begin
			max:=v[i];
			codmax:=i;
		end;	
	end;
end;	

procedure promedio (prom:real; var pasajeros:vector; var viajes:vector);
var
i:rango;
begin
	for i:= 1000 to 2500 do
	begin
		viajes[i]:=0;
		pasajeros[i]:=0;
		if(viajes[i] > 0) then
		prom := pasajeros[i] / viajes[i];
	end;
end;


procedure incisos (l:lista);
var
max:real;
codmax:integer;
aux,punta_cana:lista;
va:vector;
prom:real;
pasajeros,viajes:vector;
begin
	inicializar(va);
	max:=-1;
	codmax:=0;
	aux:=l;
	prom:=0;
	punta_cana:=nil;
	inicializar_vectores(pasajeros,viajes);
	while(l <> nil) do
	begin
		viajes[aux^.datos.codigo]:=viajes[aux^.datos.codigo]+1;
		
		pasajeros[aux^.datos.codigo]:=pasajeros[aux^.datos.codigo]+1;
		
		
		max_2(viajes,codmax,max);
		
		if(multi_10(aux^.datos.ano_viaje)) and (aux^.datos.ciudad_dest = 'punta cana') and(aux^.datos.cant_pasajeros < va[aux^.datos.codigo]) then
		agregar_nue(punta_cana, aux^.datos);
		
		promedio (prom,pasajeros,viajes);
		
		aux:=aux^.sig;
	end;	
	write('el codigo de avion  que hizo mas viajes es: ',codmax);	
	write ('el promedio de pasajeros por avion es: ',prom);
end;			

var
li:lista;
begin
	li:=nil;
	cargar(li);
	incisisos(li);
end.
