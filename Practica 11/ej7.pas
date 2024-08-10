{7. Una empresa de gas tiene que revisar los montos facturados a sus clientes durante el mes Junio. De
cada factura se conoce el código de cliente, categoría de consumo (1 a 10), metros cúbicos (m3)
consumidos, monto total de la factura y cada monto facturado durante los 12 meses del año anterior.
Se dispone de una lista con la información anterior y de una estructura que se accede por categoría
de consumo al nombre de esta. Procesar la lista de facturas recorriéndola una sola vez para:
• separar la lista por las 3 condiciones, ordenándolas por código de cliente:
o sin revisión: facturas cuyo monto es menor que el promedio del año anterior.
o revisión: facturas cuyo monto es mayor que el promedio del año anterior y tiene más
de 1000m3 consumidos.
o refacturación: facturas cuyo monto es mayor que el promedio del año anterior y tiene
menos de 1000m3 consumidos.
• calcular e informar el nombre y los m3 consumidos para todas las categorías de consumo.}

program ej7;
type
    vector1 = array[1..12] of real;
    factura = record 
        cod:integer;
        categoria:1..10;
        m3:real;
        monto:real;
        mtotal:vector1;
    end;

    lista = ^nodo;
    nodo = record
        datos:factura;
        sig:lista;
    end;

    vector2 = array[1..10] of string;
    vector3=array[1..10] of real;

procedure agregarOrdenado(var l:lista; datos:factura);
var ant,nue,act:lista;
begin
    new(nue);
    nue^.datos:=datos;
    ant:=l;
    act:=l;
    while (act<>nil) and (act^.datos.cod < datos.cod) do 
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if ant=act then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
end;

function promedio(v:vector1):real;
var i:integer;
begin
    promedio:=0;
    for i:=1 to 12 do promedio:=promedio + v[i];
    promedio := promedio/12;
end;

procedure liberarMemoria(var l:lista);
var aux:lista;
begin
    while l<>nil do
    begin
        aux:=l^.sig;
        dispose(l);
        l:=aux;
    end;
end;

var 
    l:lista;
    act:lista;
    l1,l2,l3:lista;
    nombresCat:vector2;
    m3total:vector3;
    i:integer;
begin
    l:=nil;
    cargarL(l); //se dispone de encunciado
    act:=l;
    cargarV(nombresCat); //se dispone de enunciado
    l1:=nil; l2:=nil; l3:=nil;
    for i:=1 to 10 do m3total[i]:=0;
    while act<>nil do 
    begin
        if (act^.datos.monto < promedio(act^.datos.mtotal)) then agregarOrdenado(l1,act^.datos)
        else if (act^.datos.m3>1000) then agregarOrdenado(l2,act^.datos)
        else agregarOrdenado(l3,act^.datos);
        m3total[act^.datos.categoria]:=m3total[act^.datos.categoria] + act^.datos.monto;
        act:=act^.sig;
    end;
    for i:=1 to 10 do
        writeln('Los m3 consumidos por la categoria ',nombresCat[i],' fueron: ', m3total[i]);
    liberarMemoria(l);
end.