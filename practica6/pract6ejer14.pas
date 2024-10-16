{La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes
realizados por una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el
código de alumno (entre 1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1.
colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en
cuenta que un alumno puede utilizar más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una
estructura de datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe
procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día.
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

program ejer14;

type

rango_alumnos: 1..1300;
rango_transporte:1..5;  
dias:1..30
    
    viaje = record
        codigo:rango_alumnos;
        dia_mes:dias;
        Facultad:string;
        medio_de_transporte:rango_transporte;
    end;

vector = array [rango_alumnos] of integer;// ????

vector_transportes = array [rango_transporte] of real; 


lista =^nodo
nodo = record
    dato:vaje;
    sig:lista;
end;

procedure leer (var vi:viaje);
begin
    read(vi.codigo);
    if(vi.codigo <> -1) then
    begin
        read(vi.dia_mes);
        read(vi.Facultad);
        read(vi.medio_de_transporte);
    end,
end;

procedure agregar (var l:lista; vi:viaje);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=vi;
    nue^.sig:=l;
end;

procedure cargar (l:lista);
var
vi:viaje;
begin
    leer(vi),
    while(vi.codigo <> -1)do
    begin
        agregar(l,vi);
        leer(vi);
    end;
end;

procedure inicializar (var vt:vector_transportes);
var 
    i:rango_transporte;
begin
    for i := 1 to 5 do
    vt:=0;
end;

{a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día.
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}
}

procedure dos_max (vt,max1,max2);
var
    i:rango_transporte;
begin
    for i := 1 to 5 do
    begin
        if(vt[i] > max1) then
        begin
            max2:=max1;
            max1:=v[i];
        end
        else
        if(vt[i] > max2) then
        begin
            max2:=vt[i];
        end;
    end;
end;            


procedure inicisos (l:lista; vt:vector_transportes);
var 
    cant_gastos,suma:real;
    actual:lista;
    cant,cant_viajes,max1,max2:integer;
begin
    while(l <> nil) do
    begin   
        suma:=0;
        cant:=0;
        cant_viajes:=0;
        actual:=l^.codigo;
        cant_gastos:=0;
        max1:=-1;
        max2:=-1;

        while (l <> nil) and (l^.dato.codigo = actual) do
        begin   
            cant_viajes:= cant_viajes+1;
            if(cant_viajes > 6) then
            cant:=cant+1;

            suma:=suma+vt[l^.dato.medio_de_transporte]
            if(suma > 80 ) then
            cant_gastos:= cant_gastos+1;

            vt[l^.dato.medio_de_transporte]:=vt[l^.dato.medio_de_transporte]+1;
            dos_max(vt,max1,max2);
        end;
        l:=l^.sig;
        write();
        write();
        write();
    end;        
end;


end;