program ej10v1;
const dimF=2000;
type
    vector = array[1..dimF] of string;

Procedure cargarVector(Var v: vector; Var dimL:integer);
var pos:integer;
Begin 
  pos:=1;
  dimL:=0;
  writeln('Introduzca un nombre: ');
  readln(v[pos]);
  While (dimL<=dimF) And (v[pos]<>' ') Do
    Begin
      dimL:=dimL+1;
      pos:=pos+1;
      Write('Intrduzca un nombre: ');
      readln(v[pos]);
    End;
End;

function buscarPosicion (v:vector; dimL:integer; nombre:string):integer;
var pos:integer;
begin
    pos:=1;
    while (pos<=dimL) and (nombre>v[pos])do 
        pos:=pos+1;
    if ( pos > dimL ) or (nombre < v [pos]) then pos:=0;
    buscarPosicion:= pos;
end;

function buscarPosicion2 (v:vector; dimL:integer; nombre:string):integer;
var pos:integer;
begin
    pos:=1;
    while (pos<=dimL) and (nombre>v[pos])do 
        pos:=pos+1;
    buscarPosicion2:= pos;
end;

procedure insertar (var v:vector; var dimL:integer; pos:integer; nombre:string);
var j:integer;
begin
    for j:=dimL downto pos do v[j+1]:=v[j];
    v[pos]:=nombre;
    dimL:=dimL+1;
end;

procedure insertarOrd (var v:vector; var dimL:integer; nombre:string);
var pos:integer;
begin
    if (dimL<dimF) then
    begin
        pos:= buscarPosicion2(v,dimL,nombre);
        insertar(v,dimL,pos,nombre);
    end;
end;

procedure borrarModif(var v:vector; var dimL:integer; pos:integer);
var i:integer;
begin
    for i:=pos+1 to dimL do v[i-1]:=v[i];
    dimL:=dimL-1;
end;

procedure borrarElemento(var v:vector; var dimL:integer; nombre:string);
var pos:integer;
begin
    pos:=buscarPosicion(v,dimL,nombre);
    if pos<>0 then borrarModif(v,dimL,pos);
end;

procedure imprime(v:vector; dimL:integer);
var pos:integer;
begin
    for pos:=1 to dimL do writeln(v[pos]);
end;

var
    v:vector;
    dimL:integer;
    nombre:string;
begin
    cargarVector(v,dimL);
    writeln('Introduzca el nombre a localizar');
    readln(nombre);
    writeln(nombre, ' se encuentra en la posicion: ', buscarPosicion(v,dimL,nombre));
    writeln('Introduzca el nombre a insertar');
    readln(nombre);
    insertarOrd(v,dimL,nombre);
    imprime(v,dimL);
    writeln('Introduzca el nombre a eliminar');
    readln(nombre);
    borrarElemento(v,dimL,nombre);
    imprime(v,dimL);
end.