program ej1;
const dimF=20;
type
    vector = array[1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL:integer);
var i:integer;
begin
    dimL:=0;
    for i:=1 to 10 do
    begin
        readln(v[i]);
        dimL:=dimL+1;
    end;
end;

procedure recibeInserta(var v:vector; var dimL:integer; n,i:integer);
var j:integer;
begin
    if (dimL<dimF) and (i>=1) and (i<=dimL) then
    begin
        for j:=dimL downto i do 
            v[j+1]:=v[j];
        v[i]:=n;
        dimL:=dimL+1;
    end;
end;

procedure imprime(v:vector; dimL:integer);
var i:integer;
begin
    for i:=1 to dimL do writeln(v[i]);
end;

var 
    v:vector;
    i,n,dimL:integer;
begin
    cargarVector(v,dimL);
    imprime(v,dimL);
    writeln('Ingrese el valor a insertar: ');
    readln(n);
    writeln('Ingrese en que posicion lo quiere insertar: ');
    readln(i);
    recibeInserta(v,dimL,n,i);
    imprime(v,dimL);
end.
