{El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte
de los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De
cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que
participa y cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios
de la revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último
acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

program ejer13;

type

rango_roles:1..4;
 rango_usuarios:1..3600;


		usuario = record
			email:string;
			rol:rango;
			revista_participa:string;
			cant_dias_ult_acceso:integer;
		end;	
			
vector_usuarios = array [rango_usuarios] of usuario;

vector_roles = array [rango_roles] of integer,
 
lista =^nodo
nodo = record
	dato:usuario;
	sig:lista;
end;

procedure leer(var u:usuario):// se dispone

procedure agregar (var l:lista; u:usuario);// se dispone

procedure cargar (l:lista);// se dispone	

procedure inicialixar (var vr:vector_roles);
var
	i :rango_roles;
begin
		for i := 1 to 4 do
		vr[i]:= 0;
end;			

Procedure Insertar_ordenado ( var pri: lista; u:usuario);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos :=u;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.dato.cant_dias_ult_acceso < u.cant_dias_ult_acceso) do //De menor a mayor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

{b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}}


procedure inciso_B (vr:vector_roles);
var
i:rango_roles;
begin
	for i:= 1 to 4 do
	begin
		write('en el rol',v[i],'aparecen ',i,'usuarios');
	end;
end;

procedure dos_maximos (vu:vector_usuarios; var max1,max2: integer; var emailmax1,emailmax2:string;)
var
	i:rango;
begin
	for i := 1 to 3600 do
	begin
		if(vu[i].cant_dias_ult_acceso > max1) then
		begin
			max2:=max1;
			emailmax2:=emailmax1;
			max1:=vu[i].cant_dias_ult_acceso
			eamailmax2:=vu[i].email;
		end
		if(vu[i].cant_dias_ult_acceso > max2) then
		begin
			max2:=vu[i].cant_dias_ult_acceso;
			emailmax2:=vu[i].email
		end;
	end;
end;
procedure incisos  (l:lista);
var
	vr: vector_roles;
	nom_usuario:srting;
	cant_dias:integer;
    i:rango;
    i2:rango_roles;
    vu:vector_usuarios;
begin
	max1:=-1;
	max2:=-1;
	for i := 1 to 3600 do
	begin
		while(l  <> nil) do
		begin
			if (v[i].revista_participa = 'economica') then
			incertar_ordenado(l,vu[i]);
			
			inciso_B(vr);
			
			vr[i2]:= vr[i2]+1
			dos_maximos (vr,max1,max2,emailmax1,emailmax2);
				
			l:=l^.sig;
		end;
	end;	
	write(emailmax1,emailmax2);		
end;

var
l:lista;
begin
	l:=nil;
	cargar (l);
	
