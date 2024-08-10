program ej2;
const dimF=50;
type   
    vector = array[1..dimF] of integer;

procedure cargarVector(var a:vector; var dimL:integer);
var pos:integer;
begin
    dimL:=0;
    pos:=1;
    writeln('Ingrese el valor para la posicion, ',pos);
    readln(a[pos]);
    while (dimL<dimF) and (a[pos]<>-1) do
    begin
        dimL:=dimL+1;
        pos:=pos+1;
        writeln('Ingrese el valor para la posicion, ',pos);
        readln(a[pos]);
    end;
end;

procedure recibeSuprime(var a:vector; var dimL:integer; i,j:integer);
var n,pos:integer;
begin
    pos:=j-i+1;
    if (i>=1) and (i<=dimL) and (j>=1) and (j<=dimL) and (i<j) then
    begin
        for n:=j+1 to dimL do
        begin
            a[n-pos]:=a[n];
        end;
        dimL:=dimL-pos;
    end;
end;

procedure imprime(a:vector; dimL:integer);
var i:integer;
begin
   for i:=1 to dimL do writeln(a[i]);
end;

var
    a:vector;
    i,j,dimL:integer;
begin
   cargarVector(a,dimL);
   writeln('Ingrese desde que posicion desea eliminar (incluyendola)' );
   readln(i);
   writeln('Ingrese hasta que posicion desea eliminar (incluyendola)' );
   readln(j);
   recibeSuprime(a,dimL,i,j);
   writeln('El vector resulta en: ');
   imprime(a,dimL); 
end.