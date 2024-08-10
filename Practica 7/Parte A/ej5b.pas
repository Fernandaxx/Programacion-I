program ej5a;
const
    dimF=15;
    fin=' ';
type
    flores = array[1..dimF] of string;

procedure cargarFlores(var f:flores; var dimL:integer);
begin
    dimL:=1;
    writeln('Ingrese el nombre de la flor: ');
    readln(f[dimL]);
    while (dimL<dimF) and (f[dimL]<>fin) do
    begin
        dimL:=dimL+1;
        writeln('Ingrese el nombre de la flor: ');
        readln(f[dimL]);
    end;
end;

function buscarFlor(f:flores; nombre:string; dimL:integer):integer;
var
    posActual:integer;
begin
    posActual:=1;
    while (posActual<=dimL) and (nombre>f[posActual]) do posActual:=posActual+1;
    if (posActual>dimL) or (nombre < f[posActual]) then posActual:=0;
    buscarFlor:=posActual;
end;

var
    f:flores;
    dimL,pos:integer;
    nombre:string;
begin
    cargarFlores(f,dimL);
    writeln('Ingrese el nombre de la flor a localizar: ');
    readln(nombre);
    writeln('La flor se encuentra en la posicion ', buscarFlor(f,nombre,dimL));
end.
