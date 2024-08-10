program ej11;
const dimFfil=10; dimFcol=10;
type
    matriz = array[1..dimFfil , 1..dimFcol] of integer;
    vector = array[1..10] of integer;

procedure cargarMatriz(var m:matriz; var dimFila,dimCol:integer);
var f,c:integer;
begin
    for f:=1 to 3 do 
        for c:=1 to 3 do
            begin
            writeln('Ingrese un valor para la posicion ',f,',',c);
            readln(m[f,c]);
            end;
    dimFila:=3;
    dimCol:=3;
end;

procedure cargarVector(var v:vector; var dimLv:integer);
var pos:integer;
begin
    dimLv:=0;
    pos:=1;
    writeln('Ingrese un numero para la posicion ', pos);
    readln(v[pos]);
    while (dimLv<10) and (v[pos]<>-1) do 
    begin
        dimLv:=dimLv+1;
        pos:=pos+1;
        writeln('Ingrese un numero para la posicion ', pos);
        readln(v[pos]);
    end;
end;

procedure eliminaFila(var m:matriz; n:integer; var dimFila:integer; dimCol:integer);
var f,c:integer;
begin
    if (n>0) and (n<dimFila) then
    begin
        for f:=n to dimFila-1 do
            for c:=1 to dimCol do
                m[f,c]:=m[f+1,c];
            dimFila:=dimFila-1;
    end
    else if n=dimFila then dimFila:=dimFila-1;
end;

procedure insertaColumna(var m:matriz; v:vector; n:integer; dimFila:integer; var dimCol:integer; dimLv:integer);
var f,c:integer;
begin
    if (dimCol<dimFcol) and ((n>=1) and (n<=dimCol)) and (dimLv=dimFila) then 
    begin
        for c:=dimCol downto n do
            for f:=1 to dimFila do
                m[f,c+1]:=m[f,c];
        dimCol:=dimCol+1;
        for f:=1 to dimFila do
            m[f,n]:=v[f];
    end
    else writeln('El vector supera la dimension de filas de la matriz, ingrese una valida');
end;

procedure imprime(m:matriz; dimFila,dimCol:integer);
var f,c:integer;
begin
    for f:=1 to dimFila do
        for c:=1 to dimCol do 
            writeln(m[f,c]);
end;

var
    m:matriz;
    v:vector;
    dimFila,dimCol,dimLv,n:integer;
begin
    cargarMatriz(m,dimFila,dimCol);
    writeln('Ingrese la fila a eliminar: ');
    readln(n);
    eliminaFila(m,n,dimFila,dimCol);
    imprime(m,dimFila,dimCol);
    cargarVector(v,dimLv);
    writeln('Ingrese en columna desea ingresar el vector: ');
    readln(n);
    insertaColumna(m,v,n,dimFila,dimCol,dimLv);
    imprime(m,dimFila,dimCol);
end.