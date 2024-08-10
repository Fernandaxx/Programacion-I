program ej7;
const dimF=27;
type
    abc = array[1..dimF] of char;

function buscarPosicion(car:char; conj:abc; dimL:integer):integer;
var pos:integer;
begin
    pos:=1;
    while (pos<=dimL) and (car > conj[pos] ) do
        pos:=pos+1;
    buscarPosicion:=pos;
end;

procedure insertar (var conj:abc; var dimL:integer; pos:integer; car:char);
var j:integer;
begin
    for j:=dimL downto pos do
        conj[j+1]:=conj[j];
    conj[pos]:=car;
    dimL:=dimL+1;
end;

procedure insertarOrd(car:char; var conj:abc; var dimL:integer);
var pos:integer;
begin
    if dimL<dimF then
    begin
        pos:=buscarPosicion(car,conj,dimL);
        insertar(conj,dimL,pos,car);
    end;
end;

procedure definirConjunto(var v:abc; var dimL:integer);
var i:char; pos:integer; desde,hasta:char;
begin
    writeln('El conjunto comienza en: ');
    readln(desde);
    writeln('El conjunto finaliza en: ');
    readln(hasta);
    pos:=1;
    for i:=desde to hasta do 
    begin
        v[pos]:=i;
        pos:=pos+1;
    end;
    dimL:=pos;
end;

function pertenece(car:char; conj:abc; dimL:integer):boolean;
var pos:integer;
begin
    pos:=1;
    while (pos<=dimL) and (car > conj[pos]) do 
        pos:=pos+1;
    if (pos>dimL) or (car<conj[pos]) then pertenece:=false
    else if car=conj[pos] then pertenece:=true;
end;

procedure unionConjuntos(conj1,conj2:abc; var conj3:abc; dimL1,dimL2:integer; var dimL3:integer);
var pos:integer;
begin
    for pos:=1 to dimL1 do conj3[pos]:=conj1[pos];
    dimL3:=dimL1;
    for pos:=1 to dimL2 do
    begin
        if not pertenece(conj2[pos],conj3,dimL3) then 
        begin
            insertarOrd(conj2[pos],conj3,dimL3);
        end;
    end;
end;

procedure difConjuntos(conj1,conj2:abc; var conj3:abc; dimL1,dimL2:integer; var dimL3:integer);
var pos:integer;
begin
    dimL3:=0;
    for pos:=1 to dimL1 do
    begin
        if not pertenece(conj1[pos], conj2, dimL2) then
        begin
            conj3[pos]:=conj1[pos];
            dimL3:=dimL3+1;
        end;
    end;
end;

procedure imprimir(conj:abc; dimL:integer);
var pos:integer;
begin
    for pos:=1 to dimL do write(conj[pos]);
end;

var 
    conj1,conj2,conjUnion,conjDif:abc;
    dimL1,dimL2,dimLunion,dimLdif:integer;
begin
    definirConjunto(conj1,dimL1);
    definirConjunto(conj2,dimL2);
    unionConjuntos(conj1,conj2,conjUnion,dimL1,dimL2,dimLunion);
    writeln('La union de ambos conjuntos resulta en: ');
    imprimir(conjUnion,dimLunion);
    difConjuntos(conj1,conj2,conjDif,dimL1,dimL2,dimLdif);
    writeln('La diferencia de ambos conjuntos resulta en: ');
    imprimir(conjDif,dimLdif);
end.