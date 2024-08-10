{Escribir un programa que lea una secuencia de números enteros y genere una lista. La lectura finaliza
cuando se lee el número 0. Una vez generada la lista, informar:
a) El mayor número leído.
b) La cantidad de números cuya cantidad de dígitos es impar.
c) Los 2 últimos números pares de la lista.}

program ej2;
type
    lista = ^nodo;
    nodo = record
        datos:integer;
        sig:lista;
    end;

procedure agregarFinal(var pri:lista; num:integer);
var act,nue:lista;
begin
    new(nue);
    nue^.datos:=num;
    nue^.sig:=nil;
    if pri <> nil then
    begin
        act:=pri;
        while (act^.sig <> nil) do act:=act^.sig;
        act^.sig:=nue;
    end
    else pri:=nue;
end;

function mayorLeido(l:lista):integer;
begin
    mayorLeido:=-9999;
    while (l<>nil) do
    begin
        if l^.datos>mayorLeido then mayorLeido:= l^.datos;
        l:=l^.sig
    end;
end;

function cantidadImpar(l:lista):integer;
var cant:integer;
begin
    cantidadImpar:=0;
    while l<>nil do
    begin
        cant:=0;
        while l^.datos<>0 do
        begin
            l^.datos:=l^.datos div 10;
            cant:=cant+1;
        end;
        if cant mod 2 <> 0 then cantidadImpar:=cantidadImpar+1;
        l:=l^.sig;
    end;
end;

var 
    l:lista;
    num:integer;
begin
    l:=nil;
    writeln('Ingrese un numero entero: ');
    read(num);
    while num <> 0 do
    begin
        agregarFinal(l,num);
        writeln('Ingrese un numero entero: ');
        readln(num);
    end;
    writeln('El mayor numero de la lista es: ', mayorLeido(l));
    writeln('La cantidad de numeros cuya cantidad de digitos es impar es: ', cantidadImpar(l));
end.