program ej4;
const dimF=50;
type
    vector = array[1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL:integer);
var pos:integer;
begin
    dimL:=0;
    pos:=1;
    writeln('Ingrese un nro para la posicion ',pos);
    readln(v[pos]);
    while (dimL<dimF) and (v[pos]<>-1) do
    begin
        dimL:=dimL+1;
        pos:=pos+1;
        writeln('Ingrese un nro para la posicion ',pos);
        readln(v[pos]);
    end;
end;

function pertenece(v:vector; dimL:integer; n:integer):boolean;
var pos:integer;
begin
    pertenece:=true;
    pos:=1;
    while (pos<=dimL) and (n>v[pos]) do
        pos:=pos+1;
    if (pos > dimL) or (n < v[pos]) then pertenece:=false;
end;

var 
    v:vector;
    dimL,n:integer;
begin
    cargarVector(v,dimL);
    writeln('Ingrese que valor quiere buscar');
    readln(n);
    if pertenece(v,dimL,n) then writeln ('El valor esta en el vector')
    else writeln('El valor NO esta en el vector');
end.