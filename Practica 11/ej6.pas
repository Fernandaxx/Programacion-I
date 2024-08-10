{6. La facultad de informática decide abrir 10 cursos de actualización (cuyos códigos se numeran del 1
al 10) para sus graduados. A cada inscripto se le solicita la siguiente información: DNI, apellido,
nombre, edad y el código del curso al que se desea inscribir (una persona se puede inscribir solo a
un curso). La facultad dispone de una estructura en la que se almacena para cada código de curso
el cupo máximo de personas que pueden inscribirse a ese curso. Se pide:
a. Simular el proceso de inscripción de los graduados a los cursos. El proceso de inscripción
finaliza cuando llega un graduado con apellido “zzz”. Para cada inscripción se debe controlar
que la cantidad de graduados ya inscriptos no supere el cupo máximo que cada curso tiene.
En caso de que el curso solicitado se encuentre completo se debe informar que no hay lugar
disponible en dicho curso.
b. Una vez finalizada la inscripción:
• Informar el código de aquellos cursos cuyo cupo máximo no se completó.
• Calcular e informar la cantidad de inscriptos al curso con código 2 que tienen entre 30 y
35 años.}

program ej6;
type
    inscripto = record
        dni,edad:integer;
        apellido,nombre:string;
        curso:1..10;
    end;
    lista = ^nodo;
    nodo = record
        datos:inscripto;
        sig:lista;
    end;

    vector = array[1..10] of integer;

procedure cargarCupos(var cupos:vector);
var i:integer;
begin
    for i:=1 to 10 do 
    begin
        writeln('Ingrese el cupo disponible para el curso ',i);
        readln(cupos[i]);
    end;
end;

procedure cargarDatos(var datos:inscripto);
begin
    writeln('Ingrese el apellido del inscripo');
    readln(datos.apellido);
    if datos.apellido <> 'zzz' then 
    begin
        writeln('Ingrese el nombre del inscripto');
        readln(datos.nombre);
        writeln('Ingrese el dni del inscripto');
        readln(datos.dni);
        writeln('Ingrese la edad del inscripto');
        readln(datos.edad);
        writeln('Ingrese el curso al que desea anotarse');
        readln(datos.curso);
    end;
end;

procedure cargarLista(var l:lista; datos:inscripto);
var nue:lista;
begin
    new(nue);
    nue^.datos:=datos;
    nue^.sig:=l;
    l:=nue;
end;

procedure liberarMemoria(var l:lista);
var aux:lista;
begin
    while l<>nil do
    begin
        aux:=l^.sig;
        dispose(l);
        l:=aux;
    end;
end;

var 
    l:lista;
    act:lista;
    datos:inscripto;
    cupos:vector;
    i,cant:integer;
begin
    l:=nil;
    cant:=0;
    cargarCupos(cupos);
    cargarDatos(datos);
    while datos.apellido<>'zzz' do 
    begin
        if cupos[datos.curso] <> 0 then begin 
            cargarLista(l,datos);
            cupos[datos.curso]:=cupos[datos.curso]-1;
        end
        else writeln('No hay cupo disponible en ese curso');
        cargarDatos(datos);
    end;
    for i:=1 to 10 do if cupos[i]<>0 then writeln('El cupo en el curso ', i, ' no se completo.');
    act:=l;
    while act<>nil do
    begin
        if (act^.datos.curso = 2) and (act^.datos.edad>=30) and (act^.datos.edad<=35) then cant:=cant+1;
        act:=act^.sig;
    end;
    writeln('La cantidad de inscriptos al curso 2 que tienen entre 30 y 35 años es: ', cant);
    liberarMemoria(l);
end.