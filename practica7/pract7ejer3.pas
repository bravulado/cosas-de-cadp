{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. De
cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y para
un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de
viaje}

program ejer3;

type

		viaje = record
			num_viaje:integer;
			codigo_auto:integer;
			direccion_origen:string;
			direccion_destino:string;
			km_recorridos:real;
		end;
		
lista=^nodo;
nodo = record
	datos:viaje;
	sig:lista;
end;

procedure leer(var v:viaje );// se dispone;

procedure agregar (var l:lIsta; v:viaje);// se dispone;

procedure cargar (l:Lista);// se dipone;

procedure incertar ordenado (var lista_nueva:lista; v:viaje);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.datos:=v;
	act:=lista_nue;
	ant:=lista_nue;
	while(act <> nil) and (act^.datos.num_viaje <> v.num_viaje) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant = act)then
	begin
		lista_nue:=nue;
	end
	else
	begin
		ant^.sig:=nue;
	end;
end;
a. Informar los dos códigos de auto que más kilómetros recorrieron.
procedure incisos (l:Lista);
var
aux:lista;
max1,max2:integer;
codmax1,codmax2:integer;
begin
	aux:=l;
	while(aux <> nil)do
	begin
		max1:=-1;
		max2:=-1;
		codmax1:='';
		codmax2:='';
		actual:=aux^.datos.codigo_auto;
		while(aux <> nil) and (actual = aux^.datos.codigo_auto) do
		begin
			if(aux^.datos.km_recorridos > max1) then
			begin	
				max2:=max1;
				codmax2:=codmax1;
				max1:=aux^.datos.km_recorridos;
				codmax1:=aux^.datos.codigo_auto;
			end
			else
			if(aux^.datos.km_recorridos > max2) then
			begin
				max2:=aux^.datos.km_recorridos;
				codmax2:=aux^.datos.codigo_auto;
			end;
			
			if(km_recorridos > 5) then
			incertar_ordenado(aux,aux^.datos);
		end;
		aux:=aux^.sig;
		write('los dos codigos con mas kilometros recorridos son: ',codmax1,' y ',codmax2);	
	end;
end;				
					
var
	l:lista;
begin
	l:=nil;
	cargar(l);// se dispone;
	incisos(l);
end;	
