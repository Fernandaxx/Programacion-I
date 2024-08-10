{1. * Escribir un programa que lea una secuencia de números enteros terminada en 999 y los almacene
en una lista simple. Utilizando la lista creada implementar:
a) un módulo que reciba la lista y devuelva como resultado la cantidad de números con 3 dígitos.
b) un módulo que reciba la lista y un número y determine si dicho número está o no en la lista. La
búsqueda debe terminar al encontrar la primera ocurrencia del número buscado.
c) Un módulo que reciba la lista y libere la memoria reservada.}

program ej1;
type
  lista = ^nodo;
  nodo = record
    datos:integer;
    sig:lista;
  end;

procedure agregarAdelante(var l:lista; num:integer);
var nue:lista;
begin
  new(nue);
  nue^.datos:=num;
  nue^.sig:=l;
  l:=nue;
end;

function cuentaDig(num:integer):integer;
begin
    cuentaDig:=0;
    while num<>0 do
    begin
        num:=num div 10;
        cuentaDig:=cuentaDig+1;
    end;
end;

function cant3dig(l:lista):integer;
begin
  cant3dig:=0;
  while l<>nil do
  begin
    if (cuentaDig(l^.datos) = 3) then cant3dig:=cant3dig+1;
    l:=l^.sig;
  end;
end;

function pertenece(l:lista; num:integer):boolean;
begin
    pertenece:=false;
    while (l<>nil) and (not pertenece) do
        if num = l^.datos then
            pertenece:=true
        else 
            l:=l^.sig;
end;

procedure liberaMemoria(var l:lista);
var sig:lista;
begin
    while l<>nil do
    begin
        sig:=l^.sig;
        dispose(l);
        l:=sig;
    end;
end;

var
  l:lista;
  num:integer;
begin
  l:=nil;
  read(num);
  while (num<>999) do 
  begin
    agregarAdelante(l,num);
    read(num);
  end;
  writeln('La cantidad de numeros con 3 digitos es: ', cant3dig(l));
  readln(num);
  if pertenece(l,num) then writeln ('El numero pertenece a la lista')
  else writeln('El numero no pertenece a la lista');
  liberaMemoria(l);
end.