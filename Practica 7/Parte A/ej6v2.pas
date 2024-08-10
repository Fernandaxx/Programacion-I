program ej6v2;
const dimF=64;
type
    rango=1..dimF;
    vector = array[rango] of boolean;

procedure leerVector(var v:vector);
var i:rango; c:char;
begin
    writeln('Ingrese el nro de', dimF,'valores binarios');
    for i:=1 to dimF do 
    begin
        read(c);
        v[i]:=(c='1');
    end;
end;

procedure imprime(var v:vector);
var i:rango; 
begin
    writeln('El nro es: ');
    for i:=1 to dimF do 
    begin
        if(v[i]) then writeln('1')
        else writeln('0');
    end;
end;

procedure funcionAND(v1,v2:vector; var v3:vector);
var i:rango;
begin
    for i:=1 to dimF do
        v3[i]:=v1[i] and v2[i];
end;

procedure funcionOR(v1,v2:vector; var v3:vector);
var i:rango;
begin
    for i:=1 to dimF do
        v3[i]:=v1[i] or v2[i];
end;

procedure funcionNOT(v:vector; var v3:vector);
var i:integer;
begin
    for i:=1 to dimF do v3 := not(v[i]);
end;

var 
    v:vector;
begin
   leerVector(v);
   imprime(v);
end.