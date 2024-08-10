program ej5;
const 
    maxFila=100;
    maxCol=100;
type
    matriz = array[1..maxFila, 1..maxCol] of integer;

function validar(dimFila,dimCol:integer):boolean;
begin
    if (dimFila<=maxFila) and (dimCol<=maxCol) then validar:=true
    else validar:=false;
end;

procedure cargarMatriz(var m:matriz; var dimFila,dimCol:integer);
var f,c:integer;
begin
    readln(dimFila);
    readln(dimCol);
    if validar(dimFila, dimCol) then
        for f:=1 to dimFila do 
            for c:=1 to dimCol do
                readln(m[f,c]);
end;

procedure imprimeFilaPar(m:matriz; dimFila,dimCol:integer);
var f,c:integer;
begin
    for f:=1 to dimFila do
        for c:=1 to dimCol do
            if ((f mod 2)=0) then writeln(m[f,c]);
end;

procedure imprimeColImpar(m:matriz; dimFila,dimCol:integer);
var f,c:integer;
begin
    for c:=1 to dimCol do
        for f:=1 to dimFila do
            if ((c mod 2)<>0) then writeln(m[f,c]);
end;

procedure imprimeDiagonal(m:matriz; dimFila,dimCol:integer);
var i:integer;
begin
    for i:=1 to 5 do writeln(m[i,i]);
end;

var
    dimFila,dimCol:integer;
    m:matriz;
begin
    cargarMatriz(m,dimFila,dimCol);
    imprimeFilaPar(m,dimFila,dimCol);
    imprimeColImpar(m,dimFila,dimCol);
    imprimeDiagonal(m,dimFila,dimCol);
end.