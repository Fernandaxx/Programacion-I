program ej8a;
const dimF=150;
type
    vector = array[1..dimF] of char;

procedure cargarVector(var c:vector; dimL:integer);
var pos:integer;
begin
    for pos:=1 to dimL do readln(c[pos]);
end;

function contarPalabras(c:vector; dimL:integer):integer;
var pos:integer;
begin
    contarPalabras:=0;
    pos:=1;
    while (pos<dimL) do 
    begin
        while (c[pos]=' ') and (pos<dimL) do pos:=pos+1;
        contarPalabras:=contarPalabras+1;
        while (pos<dimL) and (c[pos]<>' ') do pos:=pos+1;
    end;
end;

var
    c:vector;
    dimL:integer;
begin
    writeln('Introduzca la dimension logica: ');
    readln(dimL);
    cargarVector(c,dimL);
    writeln('En el vector hay ',contarPalabras(c,dimL),' palabras.');
end.