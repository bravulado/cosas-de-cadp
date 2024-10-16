program parcial2015_2

type

rango_facultad = 1..17;
rango_docentes = 1..5;

    docente = record
        dni:integer;
        apellido:string;
        nombre:string;
        cod_facultad:rango_facultad;
        cod_docentes:rango_docentes;
        area_investigacion:string;
        cant_anos_investigacion:
    end;

vector = array[rango_docentes] of real;

lista =^nodo;
nodo = record
    dato:docente;
    sig:lista;
end;

procedure leer (var d:docente);
begin
    read(d.dni);
    if(d.dni <> 0) then 
    begin
        read(d.apellido);
        read(d.nombre);
        read(d.cod_facultad);
        read(d.cod_docentes);
        read(d.area_investigacion);
        read(d.cant_anos_investigacion);
    end;
end;

procedure agregar (var l:lista; d:docente);
var
nue:lista;
begin
    new(nue);
    nue^.dato:=d;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargar (l:lista);
var 
    d:docente;
begin
    leer(d);
    while (d.dni <> 0) do
    begin
        agregar(l,d);
        leer(d);
    end;    
end;

procedure inicialixar (var v:vector);
var
    i:rango_docentes
begin
    for i := 1 to 5 do
    v[i]:= 0;
end;


procedure incisos (l:lista);
var
    puntaje_total:real;
    v:vector;
begin

    puntaje_total:=0;
    while (l <> nil ) do
    begin   
        puntaje_total:=l^.dato.cant_anos_investigacion * v[l^.dato.cod_docentes];

        
         
