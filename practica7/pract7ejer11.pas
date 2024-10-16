program ejer11;

type

rango = 1..5;
cant_eventos = 1...100;
rango_num_evento

		evento = record
			nombre_evento:string;
			tipo:rango;
			lugar:string;
			cant_max_personas:integer;
			costo_entrada:real;
		end;
		
		venta = record 
			codigo:integer;
			num_evento:rango_num_evento;
			dni:integer;
			cant_entradas_adquiridas:integer;
		end;
		

vector_tipo= array [rango] of venta;

lista =^nodo
nodo = record
	dato:evento;
	sig:lista;
end;	

procedure leer (var e:evento ); // se dispone;

procedure agregar (var l:lista; e:evento);// se dispone;

procedure cargar (l:lista);// se dispone;

procedure leer_venta (var v:venta);
begin
	read(v.codigo);
	if(v.codigo <> -1)then
	begin
		read(v.num_evento);
		read(v.dni);
		read(v.cant_entradas_adquiridas);	
	end;
end;

procedure agregar (var l2:lista; v:venta);
var
nue:lista;
begin
	new(nue);
	nue^.dato:=v;
	nue^.sig:=l2;
	l:=nue;	
end;

procedure cargar_ventas (l2:lista);
var
v:venta;
begin
	leer_venta(v);
	while (v.codigo <> -1) do
	begin
		agregar (l2,v);
		leer(v);		
	end;
end;

procedure inicializar (var vt:vector_tipo);
var
i:rango;
begin
	for i := 1 to 100 do
	vt:=0;
end;	

{2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares
y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas}

function mas_pares (dni:integer):boolean
var
	par,inpar,dig:integer;
begin
	par:=0;
	inpar:=0;
	while(dni <> 0) do
	begin
		dig:= dni MOD 10;
		if(dni MOD 2 =0 ) then
		begin
			par:= par+1;
			else
			inpar:=inpar+1;
			dni:=dni DIV 10;
		end;
	end;
	if(par > inpar) then
	mas_pares:=true;
	else
	mas_pares:=false;
end;


procedure menos_recaudacion(vt:vector_tipo; var min1,min2:integer; var nomin1,nomin2:string; var lugarmin1,lugarmin2:string);
var
i:rango
l:lista;
begin
	for i := 1 to 5 do
	begin	
		if(vt[i].cant_entradas_adquiridas < min1) then
		begin
			min2:=min1;
			nomin2:=nomin1;
			lugarmin2:=lugarmin1;
			min1:=vt[i].cant_entradas_adquiridas;
			nomin1:=l^.dato.nombre_evento;
			lugarmin1:=l^.dato.lugar;
		end
		else
		if(vt[i].cant_entradas_adquiridas < min2) then
		begin
			min2:=vt[i].cant_entradas_adquiridas;
			nomin2:=l^.dato.nombre_evento;
			lugarmin2:=l^.dato.lugar;
		end;
	end;
end;


procedure incisos (l:lista);
var
	min1,min2: integer;
	lugarmin1,lugarmin2:string;
	nomin1,nomin2:string;
	cant:integer;
	vt:vector_tipo;
begin
	cant:=0;
	min1:=999;
	min2:=999;
	while (l <> nil) do
	begin	
	
		menos_recaudacion(vt,min1,min2,nomin1,nomin2,lugarmin1,lugarmin2);
		
		if(mas_pares(l^.dato.dni)) and (vt[l^.dato.tipo] = 'obra de teatro') then
		cant := cant+1;
		
		l:=l^.sig;	
	end;	
	write('el nombre del evento con menos recaudacion fue',nomin1,'y',nomin2,'que se encuentran en',lugarmin1,'y',lugarmin2);
	write('cantidad de entrdas de obra de teatro que tengan mas dni pares son: ',cant);
end;		

var
l,L2:lista
vt:vector_tipo;
begin
	L:=NIL;
	L2:=NIL;
	inicializar(vt)
	cargar_ventas(l2);
	incisos (l);
end;
		
