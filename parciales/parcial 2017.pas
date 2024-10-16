program parcial2017;

type 

cuentas = 1..10,
rango = 1..2; 
 
    cliente = record;
        nro:integer;
        dni:integer;
        apeynom:string;
        nacimiento:integer;
        cuentas_que_posee:cuentas;
    end;

    cuenta = record,
        cbu:integer;
        tipo_de_cuenta:rango;
        saldo:real;
    end;    

vector_cuentas = array [cuentas] of cuenta;

lista =^nodo
nodo = record
    dato:cliente;
    sig:lista;
end;

procedure leer_clientes (var c:cliente);
begin
    read(c.nro);
    if(c.nro <> -1) then
    begin
        read(c.dni);
        read(c.apeynom);
        read(c.nacimiento);
        read(c.cuentas_que_posee);
    end;    
end;

procedure leer_cuentas (var cu:cuenta);
begin
    read(cu.cbu);
    if(cu.cbu <> 111) then
    begin
        read(cu.tipo_de_cuenta);
        read(cu.saldo);
    end;    
end;

procedure agregar_clientes (var l:lista; c:cliente);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=c;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargar_cientes (l:lista);
var
    c:clientes;
begin
    leer(c);
    while (c.nro <> -1) do
    begin   
        leer(c);
        agregar_clientes(l,c);
    end;        
end;        


procedure inicializar (var vc:vector_cuentas);
var
    i:cuentas;
begin
    for i:= 1 to 10 do
    vc[i]:=0;
end;

procedure dos_min (vc:vector_cuentas; var min1,min2:integer; var nro_min1,nro_min2:integer);
var
    i:rango;
begin;
    for i :=  1 to 10 do
    begin
        if (vc[i] < min1) then
        begin   
            min2:=min1;
            nro_min2:=nro_min1;
            min1:=vc[i];
            nro_min1:=i;    
        end
        else
        if(vc[i] < min2) then 
        begin   
            min2:=vc[i];
            nro_min2:=i;
        end;
    end;
end;            


function mas_pares (dni:integer):boolean;
var
    par,inpar,dig:integer;
begin
    par:=0;
    inpar:=0;
    while(dni <> 0) do
    begin
        dig:=dni MOD 10;
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

procedure inicisos (l:lista);
var
    vc:vector_cuentas;
    saldo_total:real;
    min1,min2,nro_min1,nro_min2:integer;
    nombre:string;
begin
    min1:=11;
    min2:=11;
    saldo_total:=0;
    while(l <> nil) do
    begin
        saldo_total:=vc[l^.dato.cuentas_que_posee].saldo+saldo_total;

        dos_min (vc,min1,min2,nro_min1,nro_min2);

        if (mas_pares(l^.dato.dni))then
        nombre:=l^.dato.apeynom;

        if(l^.dato.nro = 7777) and (vc[l^.dato.cuentas_que_posee].cbu = 112233445566) then
        vc[l^.dato.cuentas_que_posee].saldo :=1000;

        l:=l^.sig;
    end;
end;

var
    vc:vector_cuentas;
    l:lista;
    cu:cuenta;
begin
    l:=nil;
    cargar_clientes(l);
    leer_cuentas(cu);    
    inicializar(vc);
    inicisos(l);
end.    
