{. * Dada una lista de aviones (marca, modelo y cantidad de asientos), definir la estructura que permita
almacenarlos y escribir un programa que implemente:
a) Un módulo que reciba una lista de aviones y un avión y lo agregue a la lista. Se sabe que la lista
está ordenada por marca en forma descendente y se pide agregar el avión a la lista de forma que
se mantenga el orden.
b) Un módulo que reciba una lista de aviones y un avión, y elimine el elemento de la lista que
coincida totalmente con el avión recibido. Además, debe retornar si la eliminación se realizó o no.}

program ej4;
type
    lista = ^nodo;
    nodo = record
        marca:string;
        modelo:string;
        asientos:integer;
        sig:lista;
    end;

procedure agregarFinal(var pri:lista; marca,modelo:string; asientos:integer);
var act,nue:lista;
begin
    new(nue);
    nue^.marca:=marca;
    nue^.modelo:=modelo;
    nue^.asientos:=asientos;
    nue^.sig:=nil;
    if pri <> nil then
    begin
        act:=pri;
        while (act^.sig <> nil) do act:=act^.sig;
        act^.sig:=nue;
    end
    else pri:=nue;
end;

procedure agregarOrdenado(var l:lista; marca,modelo:string; asientos:integer);
var nue,ant,act:lista;
begin
    new(nue);
    nue^.marca:=marca;
    nue^.modelo:=modelo;
    nue^.asientos:=asientos;
    act:=l;
    ant:=l;
    while (act<>nil) and (act^.marca < marca) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if ant = act then l:=nue //el dato va al principio
    else ant^.sig:=nue; //va entre otros dos o al final
    nue^.sig:=act;
end;

procedure eliminar(var l:lista; marca,modelo:string; asientos:integer; var exito:boolean);
var ant,act:lista;
begin
    exito:=false;
    act:=l;
    while (act <> nil) and (act^.marca<>marca) and (act^.modelo<>modelo) and (act^.asientos<>asientos) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act<>nil) then begin
        exito:=true;
        if (act = l) then l:=act^.sig
        else ant^.sig:=act^.sig;
        dispose(act);
    end;
end;

procedure imprime(l:lista);
begin
    while l<>nil do
    begin
        writeln(l^.marca);
        writeln(l^.modelo);
        writeln(l^.asientos);
        l:=l^.sig;
    end;
end;

var
    l:lista;
    marca,modelo:string;
    asientos:integer;
    exito:boolean;
begin
    writeln('Ingrese marca: ');
    readln(marca);
    writeln('Ingrese modelo');
    readln(modelo);
    writeln('Ingrese asientos: ');
    readln(asientos);
    while (marca<>'.') do
    begin
        agregarFinal(l,marca,modelo,asientos);
        writeln('Ingrese marca: ');
        readln(marca);
        writeln('Ingrese modelo');
        readln(modelo);
        writeln('Ingrese asientos: ');
        readln(asientos);
    end;
    writeln('AVION A INGRESAR: ');
    readln(marca);
    readln(modelo);
    readln(asientos);
    agregarOrdenado(l,marca,modelo,asientos);
    imprime(l);
    writeln('AVION A ELIMINAR: ');
    readln(marca);
    readln(modelo);
    readln(asientos);
    eliminar(l,marca,modelo,asientos,exito);
    imprime(l);
end.