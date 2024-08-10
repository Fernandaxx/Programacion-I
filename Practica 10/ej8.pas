{8. Una empresa mantiene una lista de empleados. De un empleado se conoce su código de empleado,
apellido y nombre, profesión, código de departamento al que pertenece, sueldo básico y antigüedad.
Dicha lista está ordenada por código de empleado. Suponiendo que la lista ya existe se pide:
a) Realizar un módulo que reciba un nuevo empleado y lo incorpore a la lista de empleados de la
empresa (manteniendo el orden).
b) Implementar un módulo que elimine de la lista todos los empleados que pertenezcan al
departamento 4 o al departamento 10 (estos departamentos pueden no existir).}

program ej8;
type
    emp = record
        codigo,depto,antiguedad:integer;
        apellido,nombre,profesion:string;
        sueldo:real;
    end;

    lista = ^nodo;
    nodo = record
        datos:emp;
        sig:lista;
    end;

procedure cargarRegistro(var datos:emp);
begin
    writeln('Ingrese apellido');
    readln(datos.apellido);
    writeln('Ingrese nombre');
    readln(datos.nombre);
    writeln('Ingrese codigo');
    readln(datos.codigo);
    writeln('Ingrese depto');
    readln(datos.depto);
    writeln('Ingrese antiguedad');
    readln(datos.antiguedad);
    writeln('Ingrese profesion');
    readln(datos.profesion);
    writeln('Ingrese sueldo');
    readln(datos.sueldo);
end;

procedure agregarOrdenado(var l:lista; datos:emp);
var nue,ant,act:lista;
begin
    new(nue);
    nue^.datos:=datos;
    ant:=l;
    act:=l;
    while (act<>nil) and (act^.datos.codigo<datos.codigo) do 
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if ant=act then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
end;

function existe (l:lista; depto:integer):boolean;
begin
    existe:=false;
    while (l<>nil) and (not existe) do
    begin
        if l^.datos.depto=depto then existe:=true
        else l:=l^.sig;
    end;
end;

procedure eliminar4o10(var l:lista);
var ant,act:lista;
begin
    while existe(l,4) or existe(l,10) do
    begin
        act:=l;
        while (act<>nil) and ((act^.datos.depto<>4)and(act^.datos.depto<>10)) do
        begin
            ant:=act;
            act:=act^.sig;
        end;
        if act<>nil then
        begin
            if act = l then l:=act^.sig
            else ant^.sig:=act^.sig;
            dispose(act);
        end;
    end;
end;

var 
    l:lista; datos:emp;
begin
    writeln('Ingrese los datos del empleado a agregar: ');
    cargarRegistro(datos);
    agregarOrdenado(l,datos);
    eliminar4o10(l);
end.