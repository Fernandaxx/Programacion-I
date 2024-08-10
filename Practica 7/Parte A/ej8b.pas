program ej8b;
const dimF=150;
type
    vector = array[1..150] of char;

Procedure cargarVector(Var v: vector; Var dimL:integer);
var pos:integer;
Begin 
  pos:=1;
  dimL:=0;
  readln(v[pos]);
  While (dimL<=dimF) And (v[pos]<>'.') Do
    Begin
      dimL:=dimL+1;
      pos:=pos+1;
      Write('Intrduzca un caracter: ');
      readln(v[pos]);
    End;
End;

function contarPalabras(v:vector; dimL:integer):integer;
var pos:integer;
begin
    pos:=1;
    contarPalabras:=0;
    while (pos<dimL) do  
    Begin
        while (pos<dimL) and (v[pos]=' ') do pos:=pos+1;
        contarPalabras:=contarPalabras+1;
        while (pos<dimL) and (v[pos]<>' ') do pos:=pos+1;
    end;
end;

var
    v:vector;
    dimL:integer;
begin
    cargarVector(v,dimL);
    writeln(contarPalabras(v,dimL));
end.