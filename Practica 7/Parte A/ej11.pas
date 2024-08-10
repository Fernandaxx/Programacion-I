program ej11;
const dimF=7;
type
    vector = array[1..dimF] of real;

procedure iniciaVector(var v:vector; dimL:integer);
var pos:integer;
begin
    for pos:=1 to dimL do v[pos]:=-9999;
end;

procedure insertarOrd (var v:vector; var dimL:integer; num:real; pos:integer);
var j:integer;
begin
    for j:=dimL downTo pos do
        v[j+1] := v[j];
    v[pos]:=num;
end;

procedure mayores(num:real; var v:vector; var dimL:integer);
var pos:integer;
begin
    pos:=1;
    while  (pos<dimL) and (num<v[pos]) do pos:=pos+1;
    if num>v[pos] then insertarOrd(v,dimL,num,pos);
end;

procedure imprime(v:vector; dimL:integer);
var i:integer;
begin
    for i:=1 to dimL do writeln(v[i]:2:2);
end;

var 
    v:vector;
    dimL:integer;
    num:real;
begin
    dimL:=7;
    iniciaVector(v,dimL);
    writeln('Ingrese un numero real: ');
    readln(num);
    while num<>50 do 
    begin 
        mayores(num,v,dimL);
        writeln('Ingrese un numero real: ');
        readln(num);
    end;
    imprime(v,dimL);
end.