program ej8;
const 
    dimFemp=800;
    dimFofi=20;
type
    dias=1..31;
    meses=1..12;
    oficinas=1..dimFofi;
    fechas = record
        dia:dias;
        mes:meses;
        anio:integer;
    end;

    empleado = record
        dni:integer;
        apellido:string;
        nombre:string;
        fecha:fechas;
        ofi:oficinas;
    end;

    vectorPrincipal = array[1..dimFemp] of empleado;
    vectorSecundario = array [1..dimFofi] of integer;

procedure inicializa(var v:vectorSecundario);
var i:integer;
begin
    for i:=1 to dimFofi do v[i]:=0;
end;

procedure leerEmpleados(var e:vectorPrincipal; var dimLemp:integer);
var pos:integer;
begin
    pos:=1;
    dimLemp:=0;
    writeln('DATOS EMPLEADO ',pos);
    writeln('Ingrese el dni: ');
    readln(e[pos].dni);
    while (dimLemp<dimFemp) and (e[pos].dni<>0) do 
    begin
        writeln('Ingrese el nombre');
        readln(e[pos].nombre);
        writeln('Ingrese el apellido');
        readln(e[pos].apellido);
        writeln('Ingrese la fecha de nacimiento (dd/mm/aaaa)');
        readln(e[pos].fecha.dia);
        readln(e[pos].fecha.mes);
        readln(e[pos].fecha.anio);
        writeln('Ingrese la oficina en la que trabaja: ');
        readln(e[pos].ofi);
        dimLemp:=dimLemp+1;
        pos:=pos+1;
        writeln('Ingrese el dni: ');
        readln(e[pos].dni);
    end;
end;

procedure empleados1 (e:vectorPrincipal; dimLemp:integer);
var pos:integer;
begin
    for pos:=1 to dimLemp do
        if (e[pos].ofi = 1) then writeln(e[pos].nombre,e[pos].apellido);
end;

procedure totalpOficina(e:vectorPrincipal; dimLemp:integer; var v:vectorSecundario);
var pos:integer;
begin
    inicializa(v);
    for pos:=1 to dimLemp do
        v[e[pos].ofi]:=v[e[pos].ofi]+1;
    for pos:=1 to dimFofi do writeln('Hay ', v[pos], ' empleados en la oficina ', pos);
end;

function cumpleMes(e:vectorPrincipal; dimLemp:integer; x:meses):integer;
var pos:integer;
begin
    cumpleMes:=0;
    for pos:=1 to dimLemp do
        if (e[pos].fecha.mes=x) then cumpleMes:=cumpleMes+1;
end;

var
    e:vectorPrincipal;
    v:vectorSecundario;
    dimLemp,x:integer;
begin
    leerEmpleados(e,dimLemp);
    empleados1(e,dimLemp);
    totalpOficina(e,dimLemp,v);
    writeln('Ingrese un mes y se mostraran la cantidad de empleados que cumplen años en el mismo: ');
    readln(x);
    writeln('Cumplen años en ese mes ',cumpleMes(e,dimLemp,x),' empleado/s.');
end.