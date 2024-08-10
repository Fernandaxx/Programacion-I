program ej7;
const 
    dimFtwits=1000;
    dimFtexto=140;
    dimFdias=31;
type
    dias=1..31;
    txt = array [1..dimFtexto] of char;
    twit = record
        fecha:dias;
        texto:txt;
        dimL:integer;
    end;
    v1 = array[1..dimFtwits] of twit;
    v2 = array[1..dimFdias] of integer;

procedure inicializa(var cantDias:v2);
var pos:integer;
begin
    for pos:=1 to dimFdias do cantDias[pos]:=0;
end;

procedure cargarVector(var texto:txt; var dimL:integer);
var pos:integer;
begin
    pos:=1;
    writeln('Ingrese hasta 140 caracteres: ');
    readln(texto[pos]);
    while (pos<dimFtexto) and (texto[pos]<>'*') do
    begin
        pos:=pos+1;
        readln(texto[pos]);
    end;
    dimL:=pos;
end;
    
procedure cargarRegistro(var t:twit);
begin
    writeln('Ingrese la fecha en la que fue publicado');
    readln(t.fecha);
    writeln('Ingrese el texto: ');
    cargarVector(t.texto,t.dimL);
end;

procedure cargarTwits(var vectorTwits:v1);
var pos:integer;
begin
    for pos:=1 to dimFtwits do cargarRegistro(vectorTwits[pos]);
end;

procedure cantidades(t:v1; var cantidadPromedio:real);
var hashtags,usuarios,i,pos:integer;
begin
    cantidadPromedio:=0;
    hashtags:=0;
    usuarios:=0;
    for i:=1 to dimFtwits do
    begin
        pos:=1;
        while (pos<t[i].dimL) do
        begin
            while (pos<t[i].dimL) and (t[i].texto[pos] = ' ') do pos:=pos+1;
            cantidadPromedio:=cantidadPromedio+1;
            if t[i].texto[pos] = '#' then hashtags:=hashtags+1
            else if t[i].texto[pos] = '@' then usuarios:=usuarios+1;
            while (pos<t[i].dimL) and (t[i].texto[pos] <> ' ') do pos:=pos+1;
        end;
    end;
    cantidadPromedio:=cantidadPromedio/dimFtwits;
    writeln('La cantidad total de hashtags es de: ', hashtags);
    writeln('La cantidad total de usuarios es de: ', usuarios);
end;

procedure imprime(cantDias:v2);
var i:integer;
begin
    for i:=1 to dimFdias do writeln('En el dia ',i, ' se publicaron ',cantDias[i],' twits.');
end;

procedure twitsPordia(t:v1; var cantDias:v2);
var i:integer;
begin
    for i:=1 to dimFtwits do cantDias[t[i].fecha]:=cantDias[t[i].fecha]+1;
    imprime(cantDias);
end;

var
    t:v1;
    cantDias:v2;
    cantidadPromedio:real;
begin
    cargarTwits(t);
    cantidades(t,cantidadPromedio);
    twitsPordia(t,cantDias);
    writeln('La cantidad promedio de palabras en un twit es de ',cantidadPromedio:2:2);
end.