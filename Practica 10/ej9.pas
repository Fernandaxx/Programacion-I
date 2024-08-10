{9. * Se cuenta con una lista que contiene información de las ventas realizadas por una empresa de
venta de pasajes aéreos. Cada venta está compuesta por un nombre de persona, código de vuelo,
categoría de pasaje y número de asiento. La lista puede contener 0, 1 o más registros por cada
código de vuelo, y está ordenada por este campo.
El costo de un pasaje depende del vuelo y de su categoría. Se dispone de una estructura eficiente
que por cada combinación de vuelo (son 30) y categoría (4 por vuelo) se almacena su precio.
a) Generar una lista de registros que contenga por cada código de vuelo, el total de pasajes
vendidos y el monto total recaudado.
b) Calcular e informar los códigos de los 5 vuelos más vendidos.
c) Generar una lista de los códigos de vuelos cuya cantidad de pasajes vendidos sea mayor que
46. La lista debe ir generándose ordenada por monto total a medida que se realiza el proceso a).}

program ej9;
type
    datos = record
        nombre:string;
        cod,cat,asientos:integer;
    end;
    lista = ^nodo;
    nodo = record
        venta:datos;
        sig:lista;
    end;

    matriz = array[1..30,1..4] of real; {precios pasajes}

    listaRegistros = ^nodoRegistros;
    nodoRegistros = record
        cod:integer;
        total:integer;
        monto:real;
        sig:listaRegistros;
    end;

    codVentas=record
        cod:integer;
        ventas:integer;
    end;

    vector = array[1..5] of codVentas;

    listaCodigos = ^nodoCodigos;
    nodoCodigos = record
        cod:integer;
        sig:listaCodigos;
    end;

procedure cargarListaRegistros(var l:listaRegistros; total:integer; monto:real; cod:integer);
var act,nue:listaRegistros;
begin
    new(nue);
    nue^.cod:=cod;
    nue^.total:=total;
    nue^.monto:=monto;
    nue^.sig:=nil;
    if l<>nil then
    begin
        act:=l;
        while (act^.sig <> nil) do act:=act^.sig;
        act^.sig:=nue;
    end
    else l:=nue;
end;

procedure cargarListaCodigos(var l:listaCodigos; cod:integer);
var ant,nue,act:listaCodigos;
begin
    new(nue);
    nue^.cod:=cod;
    act:=l;
    ant:=l;
    while (act<>nil) and (act^.cod < cod) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if ant=act then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure listaA(l:lista; var l2:listaRegistros; var l3:listaCodigos; costos:matriz);
var vueloActual:integer; total:integer; monto:real;
begin
    vueloActual:=l^.venta.cod;
    while l<>nil do 
    begin
        total:=0; monto:=0;
        while (l<>nil) and (l^.venta.cod = vueloActual) do 
        begin
            total:=total+1;
            monto:=monto + costos[l^.venta.cod,l^.venta.cat];
            l:=l^.sig;
        end;
        cargarListaRegistros(l2,total,monto,vueloActual);
        if total>46 then cargarListaCodigos(l3,vueloActual);
        vueloActual:=l^.venta.cod;
    end;
end;

procedure masVendidos(l:listaRegistros);
var i:integer; v:vector;
begin
    for i:=1 to 5 do v[1].ventas:=-9999;

    while l<>nil do
    begin
        while (i<>5) and (l^.total<v[i].ventas) do i:=i+1;
        if l^.total>v[i].ventas then v[i].ventas:=l^.total;
        l:=l^.sig;
    end;

    for i:=1 to 5 do writeln('Posicion ',i,' de ventas: ', v[i].cod);
end;

var 
    l:lista;
    l2:listaRegistros;
    l3:listaCodigos;
    costos:matriz;
begin
    l2:=nil; l3:=nil;
    listaA(l,l2,l3,costos);
    masVendidos(l2);
end.