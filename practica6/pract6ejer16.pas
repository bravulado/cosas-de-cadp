{La empresa distribuidora de una app móvil para corredores ha organizado una competencia mundial,
en la que corredores de todos los países participantes salen a correr en el mismo momento en distintos
puntos del planeta. La app registra, para cada corredor, el nombre y apellido, la distancia recorrida (en
kilómetros), el tiempo (en minutos) durante el que corrió, el país y la ciudad desde donde partió, y la
ciudad donde finalizó su recorrido. Realizar un programa que permita leer y almacenar toda la
información registrada durante la competencia. La lectura finaliza al ingresar la distancia -1. Una vez
que se han almacenado todos los datos, informar:
● La cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos
los corredores.
● El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de
kilómetros recorridos por los corredores de esa ciudad.
● La distancia promedio recorrida por corredores de Brasil.
● La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad.
● El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston.
}

program ejer16;

type

    corredor = record 
        nombre:string;
        dist_recorrida:integer;
        tiempo:integer;
        pais_donde_partio:string;
        pais_donde_finalizo:string;
    end;    

lista =^nodo;
nodo = record
    dato:corredor;
    sig:lista;
end;

procedure leer (var c:corredor);
begin
    read(c.dist_recorrida);
    if(c.dist_recorrida <> -1) then
    begin
        read(c.nombre);
        read(c.tiempo);
        read(c.pais_donde_partio);
        read(c.pais_donde_finalizo);
    end;    
end;

procedure agregar(var l:lista; c:corredor);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=c;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargar (l:lista);
var
    c:corredor;
begin    
    leer(c);
    while(c.dist_recorrida <> -1) do
    begin
        agregar(l,c);
        leer(c);
    end;
end;


{● La cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos
los corredores.
● El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de
kilómetros recorridos por los corredores de esa ciudad.
● La distancia promedio recorrida por corredores de Brasil.
● La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad.
● El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston.}

procedure incisos (l:lista);
var
    cant,dist_total,tiempo_total:integer;
begin
    cant:=0;
    dist_total:=0;
    tiempo_total:=0;
    while(l <> nil) do
    begin
        cant:=cant+1;
        dist_total:=dist_total+l^.dato.dist_recorrida;
        tiempo_total:=tiempo_total+l^.dato.tiempo;

        if (l^.dato.pais_donde_partio = 'brasil') then
        begin
            corredores_br:=corredores_br+1;
            suma:=suma+l^.pais_donde_partio;
            promedio:=suma/corredores_br;

        end;


        