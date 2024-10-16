program parcial2015;

type

rango = 1..5;

    proyecto = record
        numero:integer;
        descripcion:string;
        ano_inicio:integer;
        ano_fin:integer;
        tipo_de_lenguaje:rango;
        cant_participantes:integer;
        cant_horas_programacion:integer;
    end;    

vector_lenguaje = array [rango] of real;

lista =^nodo
nodo = record
    dato:proyecto;
    sig:lista;
end;

procedure leer (var p:proyecto);
begin
    read(p.numero);
    if(p.numero <> 0) then
    begin   
        read(p.descripcion);
        read(p.ano_inicio);
        read(p.ano_fin);
        read(p.tipo_de_lenguaje);
        read(p.cant_participantes);
        read(p.cant_horas_programacion);
    end;    
end;

procedure agregar (var l:lista; p:proyecto);
var 
    nue:lista;
begin   
    new(nue);
    nue^.dato:=p;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargar (l:lista);
var
    p:proyecto;
begin
    leer(p);
    while(p.numer <> 0) do
    begin
        agregar(l,p);
        leer(p);
    end;
end;    

procedure inicializar (var vl:vector_lenguaje);
var
    i.rango;
begin
    for i:= 1 to 5 do
    vl:=0;
end;



procedure dos_max (var vl:vector_lenguaje, var max1,max2:integer; var lenguajemax1,lenguajemax2:rango);
var
    i:rango;
begin
    for i := 1 to 5 do
    begin
        if (vl[i] > max1) then
        begin
            max2:=max1;
            lenguajemax2:=lenguajemax1;
            max1:=vl[i];
            lenguajemax1:=i;
        end
        else
        if (vl[i] > max2) then
        begin   
            max2:=vl[i];
            lenguajemax2:=i;
        end;       
    end;    
end;

{-calcular e informar los dos lenguajes de programacion mas usados
 -calcular e informar para cada año entre 2000 y 2014 el costo total de horas de programacion de los
 proyectos cuyo 'año de inicio' se encuentra dentro de dico rango(sin importar el año de fin)  
 - calcular e informar la cantidad de personas que participaron en proyectos en lo que se utiliso
 el lenguaje 'phyton' y durancion menor a un año
}


procedure incisos (l:lista);
var
    lenguajemax1,lenguajemax2:rango;
    max1,max2,cant:integer;
    vl:vector_lenguaje;
    cost_total:real;
begin
    cant:=0;
    cost_total:=0;
    max1:=-1;
    max2:=-1;
    while (l <> nil ) do
    begin
        vl[l^.dato.tipo_de_lenguaje]:=vl[l^.dato.tipo_de_lenguaje]+1;
        dos_max(vl,max1,max2,lenguajemax1,lenguajemax2);

        if(l^.dato.ano_inicio > 2004) and (l^.dato.ano_inicio < 2014) then
        cost_total:= vl[l^.dato.tipo_de_lenguaje]*l^.dato.cant_horas_programacion;

        if(l^.dato.tipo_de_lenguaje = 'phyton') and (l^.dato.cant_horas_programacion < 8760) then
        cant:=cant+1;

        l:=l^.sig;
    end;    
end;

var
l:lista;
vl:vector_lenguaje;
begin
    l:=nil;
    cargar(l);
    inicializar(vl);
    incisos(l);
end.




