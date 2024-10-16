{Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de
Android instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee
(medida en GB). La información disponible se encuentra ordenada por versión de Android. Realizar un
programa que procese la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

program ejer12;

type
	
		dispositivo = record
			version:real;
			tam_pantalla:integer;
			cant_ram:integer;
		end;	
	
lista =^nodo;
nodo = record
	datos:dispositivo;
	sig:lista;
end;	

procedure leer(var d:dispositivo);// se dispone;

procedure agregar(var l:Lista; d:dispositivo);// se dispone;

procedure cargar(l:lista);// se dispone;

function tam_promedio (tamaño:integer):integer;
var
tam_tota:integer;
begin
	tam_total:=0;
	tam_total:=tam_total+tamaño;
	tam_promedio:=tam_total/100;
end;	


procedure incisos (l:lista);
var
cant,disp_version:integer;
aux:lista;
begin
	aux:=l;
	cant:=0;
	while(aux <> nil) do
	begin
		actual:=aux^.datos.version;
		while(aux <> nil) and (actual = aux^.datos.version) do
		begin
			disp_version:=disp_version+1;
			if(aux^.datos.cant_ram > 3)and(aux^.datos.tam_pantalla <= 5)then
			cant:=cant+1;
			write('la cantidad de dispositivos para esta version son: 'disp_version);
			aux:=aux^.sig;
		end;
			write('el tamaño promedio es: ',tam_promedio(aux^.datos.cant_ram));
			write(cant);
	end;				
end;

var
l:lista;
begin
	l:=nil;
	cargar(l);// se dispone;
	incisos(l);
end.
