program ej3;
const
    dimF=50;
type
    vector = array[1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL:integer);
var pos:integer;
begin 
    dimL:=0;
    pos:=1;
    readln(v[pos]);
    while (dimL<dimF) and (v[pos]<>-1) do 
    begin
        dimL:=dimL+1;
        pos:=pos+1;
        readln(v[pos]);
    end;
end;


procedure insertar(var a:vector; b:vector; var dimLa:integer; dimLb:integer; i:integer);
var j,k:integer;
begin
    if (dimLa+dimLb < dimF) and (i>=1) and (i <=dimLa) then 
    begin
        for k:=1 to dimLb do 
        begin
            for j:=dimLa downto (i+1) do a[j+1] := a[j];
            a[i+1]:=b[k];
            dimLa:=dimLa+1;
            i:=i+1;
        end;
    end;
end;

procedure imprimir(v:vector; dimL:integer);
var pos:integer;
begin
    for pos:=1 to dimL do write(v[pos]);
end;

var 
    a,b:vector;
    i,dimLa,dimLb:integer;
begin
    cargarVector(a,dimLa);
    cargarVector(b,dimLb);
    readln(i);
    insertar(a,b,dimLa,dimLb,i);
    imprimir(a,dimLa);
end.