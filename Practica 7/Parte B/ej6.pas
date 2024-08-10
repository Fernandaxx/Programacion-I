program ej6;
const
    dimF=250;
type
    vector = array[1..10] of string;

    estrella = record
        nombre:string;
        sup:real;
        gases:vector;
        dimL:integer;
        distancia:integer;
    end;

    estrellas = array[1..dimF] of estrella;

procedure cargarVector(var gases:vector; var dimL:integer);
var pos:integer;
begin
    dimL:=0;
    pos:=1;
    writeln('Ingrese el nombre del gas', pos);
    readln(gases[pos]);
    while (pos<10) and (gases[pos]<>'x') do
    begin
        dimL:=dimL+1;
        pos:=pos+1;
        writeln('Ingrese el nombre del gas', pos);
        readln(gases[pos]);
    end;
end;

procedure leerRegistro(var e:estrella);
begin
    writeln('Ingrese el nombre de la estrella ');
    readln(e.nombre);
    writeln('Ingrese la sup de la estella ');
    readln(e.sup);
    writeln('Ingrese los gases de la estrella');
    cargarVector(e.gases,e.dimL);
    writeln('Ingrese la distancia de la tierra: ');
    readln(e.distancia);
end;

procedure leerEstrellas(var e:estrellas);
var pos:integer;
begin
    for pos:=1 to dimF do 
    begin
        writeln('DATOS ESTRELLA ',pos);
        leerRegistro(e[pos]);
    end;
end;

procedure buscaMaximos(e:estrellas; var max1,max2:real; var nmax1,nmax2:string);
var pos:integer;
begin
    for pos:=1 to dimF do
    begin
        if e[pos].sup>max1 then
        begin
            max2:=max1;
            max1:=e[pos].sup;
            nmax2:=nmax1;
            nmax1:=e[pos].nombre;
        end
        else if e[pos].sup>max2 then
        begin
            max2:=e[pos].sup;
            nmax2:=e[pos].nombre;
        end;
    end;
end;

function cincoGases(e:estrellas):integer;
var pos:integer;
begin
    cincoGases:=0;
    for pos:=1 to dimF do
        if e[pos].dimL>=5 then cincoGases:=cincoGases+1;
end;

procedure informaDistancia(e:estrellas);
var pos,num,pares,impares:integer;
begin
    for pos:=1 to dimF do
    begin
        pares:=0;
        impares:=0;
        num:=e[pos].distancia;
        while num<>0 do
        begin
            if num mod 2 = 0 then pares:=pares + (num mod 10)
            else impares:=impares + (num mod 10);
            num:=num div 10;
        end;
        if (pares>impares) then writeln(e[pos].nombre,' cumple condicion');
    end;
end;

var
    e:estrellas;
    nmax1,nmax2:string;
    max1,max2:real;
begin
    nmax1:=' ';
    max1:=-1;
    max2:=-1;
    leerEstrellas(e);
    buscaMaximos(e,max1,max2,nmax1,nmax2);
    writeln('El nombre de la estrella con mayor superficie es: ', nmax1);
    writeln('El nombre de la segunda estrella con mayor superficie es: ', nmax2);
    writeln('La cantidad de estrellas con al menos cinco gases es: ', cincoGases(e));
    informaDistancia(e);
end.