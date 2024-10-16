program parcial_jugueteria;

type

rango = 1..4;

	producto = record
		codigo:integer;
		descripcion:string;
		categoria:rango;
		marca:string;
		precio:real;
	end;
	

vector = array [rango] of integer;

lista =^nodo
nodo = record
	datos:producto;
	sig:lista;
end;

	info_marca = record;
		marca:string;
		cant_productos:integer;
	end;		
	
lista_marca =^nodo_2;
nodo_2 = record,
	datos:
	sig:lista_marca;
end;	


procedure inicializar (var v:vector);
var
	i:rango;
begin
	for i := 1 to  do
	v[i]:=0;
end;

procedure leer(var p:roducto);
begin
	read(p.codigo);
	if(p.codigo <> -1)then
		begin
		read(p.descripcion);
		read(p.categoria);
		read(p.marca);
		read(p.precio);
	end;	
end;	

procedure agregar (var l:Lista; p:producto);
var
nue:lista;
begin
	new(nue);
	nue^.datos:=p;
	nue.sig:=l;
	l:=nue;
end;

procedure cargar (l:lista);
var
	p:producto;
begin
	leer(p);
	while(p.codigo <> -1 ) do
	begin
		agregar(l,p);
		leer(p);
	end;
end;

procedure dos_min (v:vector; var min1,min2:integer; var catmin1,catmin2:rango);
var
i:rango;
begin
	for i := 1 to 4 do
	begin
		if(v[i] < min1) then
		begin
			min2:=min1;
			catmin2:=catmin1;
			min1:=v[i];
			catmin1:=i;
		end
		else
		if(v[i] < min2) then
		begin
			min2:=v[i];
			catmin2:=i;
		end;
	end;		
end;


procedure incisos (l:lista);
var
listamarca:lista;
v:vector;
min1,min2:integer;
catmin1,catmin2:integer;
m:info_marca;
begin
	min1:=9999;
	min2:=9999;
	catmin1:=0;
	catmin2:=0;
	listamarca:=nil;
	while(l <> nil) do
	begin
		precio_total:=precio_total+l^.datos.precio;
		cant:=cant+1;
		
		v[l^.datos.categoria]:=v[l.datos.cateogria]+1;
		dos_min(v,min1,min2,catmin1,catmin2)
			
		if (l^.datos.codigo MOD 3= 0) then
		promedio:=precio_total/cant;
		
		l:=l^sig;
	end;
	m.marca:=l^.datos.marca;
	m.cant_productos:=cant;
	agregar_2(listamaca,m
	write('las categorias con menosres productos comercializados son: ',catmin1,' y ',catmin2);
	write('el precio promedio de los productos multiplos de 3 es : ', promedio);
end;


var
l:lista;
begin
	l:=nil;
	inicializar(v);
	incisos (l);
end.



