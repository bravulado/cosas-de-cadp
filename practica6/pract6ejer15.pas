{La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con
todos los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota
obtenida. Escribir un programa que procese la información de alumnos disponible y los distribuya en
turnos utilizando los siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible}

program ejer15

type

    alumno = record
        dni:integer
        apellido:string;
        nombre:string;
        nota:real;
    end;    

vector

lista =^nodo
nodo = record
    dato:alumno;
    sig:lista;
end;
    
procedure leer(var a:alumno); // se dispone

procedure agregar (var l:lista; a:alumno);// se dispone

procedure cargar (l:lista);// se dipone

procedure incisos (l:lista);
var

begin
    while (l <> nil) do
    begin
        if (l^.dato.nota >= 8) then
        



