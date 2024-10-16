{Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

program ejer5;

type

		producto = record
			codigo:integer;
			descripcion:string;
			stock_actual:integer;
			stock_minimo:integer;
			precio:real;
		end;
		
lista =^nodo;
nodo=record
	datos:producto;			
	sig:lista;
end;

procedure leer(var p:producto);
begin
	read(P.codigo);
	if(p.codigo <> -1)then
	begin
		read(P.descripcion);
		read(P.stock_actual);
		read(P.stock_minimo);
		read(P.precio);
	end;
end;

procedure agragar (var l:lista, p:producto )
nue:lista
begin
	new (nue)
	aux^.datos:=p
	aux^.sig:=l
	l:=nue
end

procedure cargar (l:Lista)
var
p:producto
begin
	leer (p)
	while (p.codigo <> -1) do
	begin
		agregar (l)
		leer (p)
	end
end

{Porcentaje de productos con stock actual por debajo de su stock mínimo.}

procedure inciso_A (l:lista);	
var
	porcentaje:real;	
	aux:lista;	
	cant,can2:integer;	
begin
	porcentaje:=0;	
	cant:=0;	
	cant2:=0;	
	aux:=l;	
	while (l <> nil) do
	begin	
		if (aux^.datos.stock_actual < aux^.datos.stock_min) then
		begin
			cant:=cant+1;	
		end;	
		cant2:=cant2+1;	
		aux:=aux^.sig;	
	end;	
	porcentaje:= (cant*100)/cant2;	
end;	

{b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.}
 
function par (codigo:integer):boolean
begin
	par:= (codigo MOD 2 = 0);	
end;	

procedure desconponer (codigo:integer;	 var pares:integer)
var
dig:integer;	
begin
	pares:=0;	
	dig:=codigo MOD 10;	
	codigo:= codigo DIV 10;	
	if(par(dig)) then
	pares:=pares+1;	
end

procedure inciso_B(l:lista);
var
pares:integer;	
aux:lista;	
begin	
	aux:=L;	
	while(l <> nil) then
	begin
		desconponer(aux^.datos.codigo, pares)
		if(pares >=3) then 
		aux:=aux^.sig
	end
	write('la descripcion de los productos es :'aux^.datos.descripcion)
end

{Código de los dos productos más económicos.}

procedure inciso_C(l:lista );
var
min1,min2,codmin1,codmin2:integer;
aux:Lista;
begin
	min1:=9999;
	min2:=9999;
	codmin1:=9999;
	codmin2:=9999;
	aux:=l
	while(l <> nil) do
	begin
		if (aux^.datos.precio< min1) then
		begin
			min2:=min1;
			codmin2:=codmin1;
			min1:=aux^.datos.precio;
			codmin2:=	aux^.datos.codigo;
		end
		else
		if(aux^.datos.precio < min2) then
		begin
			min2:=aux^.datos.precio;
			codmin:=aux^.datos.codigo;
		end;	
	end;
end;

var
l:lista;
begin
	l:=nil;
	while( l<>nil )do
	begin
		cargar(l);
		inciso_A(l);
		inciso_B(l);
		inciso_C(l);
		l:=l^.sig;
	end;
end.
