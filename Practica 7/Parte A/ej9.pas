program ej9;
const dimF=80;
type
    vector = array[1..dimF] of integer;

Procedure cargarVector(Var v: vector; Var dimL:integer);
var pos:integer;
Begin 
  pos:=1;
  dimL:=0;
  writeln('Introduzca un nro: ');
  readln(v[pos]);
  While (dimL<=dimF) And (v[pos]<>9999) Do
    Begin
      dimL:=dimL+1;
      pos:=pos+1;
      Write('Intrduzca un nro: ');
      readln(v[pos]);
    End;
End;


procedure informaImpares(v:vector; dimL:integer);
var i:integer;
begin
    for i:=1 to dimL do 
    begin
        if i mod 2 <> 0 then
            writeln(v[i],' esta en una posicion impars.');
    end;
end;

function primerPar(v:vector; dimL:integer):integer;
var pos:integer;
begin
    pos:=1;
    while (pos<=dimL) and ((v[pos] mod 2) <> 0) do pos:=pos+1;
    if (v[pos] mod 2) = 0 then primerPar:=pos
    else primerPar:=0;
end;

var 
    v:vector;
    dimL:integer;
begin
    cargarVector(v,dimL);
    informaImpares(v,dimL);
    writeln('El primer nro par se encuentra en la posicion ', primerPar(v,dimL));
end.