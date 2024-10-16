{Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de
transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año
2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia (1:
alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura no posee
orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que
las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar
ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales
el número de cuenta destino posea menos dígitos pares que impares.
}

program ejer8;

type

rango = 1..7;

			transferencia = record
				num_cuent_origen:integer;
				dni_titular_origen:integer;
				num_cuent_dest:integer;
				dni_titular_dest:integer;
				fecha:integer;
				hora:integer;
				monto:real;
				codigo:rango;
			end;

vector = array [rango] of integer;				
  
lista =^nodo;
nodo = record
	datos:transferencia;
	sig:lista;
end;

procedure incertar_ordenado (var terceros:lista; t:transferencia);
var
	ant,nue,act:lista;
begin
	new(nue);
	nue^.datos:=t;
	act:=terceros;
	ant:=terceros;
	while (act <> nil) and (act^.datos.num_cuent_origen < t.num_cuent_origen) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant = act)then	
	begin
		l:=nue;
	end
	else
	begin
		ant^.sig;=nue;
	end;
	nue^.sig:=act;
end;


procedure incisos (l:lista);
var
aux:lista;
begin
	aux:=l;
	while(l <> nil)do
	begin
		if(aux^.datos.num_cuent_origen <> aux^.datos.num_cuent_destino) then
		begin
			incertar_ordenado(aux,aux^.datos);
		
		
