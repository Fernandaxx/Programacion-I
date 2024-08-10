{3. * Dada una lista de lugares turísticos identificados por nombre y país, definir una estructura de datos
para almacenarlos y escribir un programa que implemente los siguientes módulos:
a) Calcular la longitud de la lista.
b) Calcular la cantidad de veces que aparece un país dado (un país puede aparecer más de una
vez, ya que puede haber diferentes lugares turísticos).
c) Dado un país, si existe, generar una nueva lista con los nombres de sus lugares turísticos.
d) Agregar al final de la lista creada en c) un nuevo lugar turístico.}

program ej3;
type
    lista = ^nodo;
    nodo = record 
        nombre:string;
        pais:string;
        sig:lista;
    end;

function longitud(l:lista):integer;
begin
    longitud:=0;
    while l<>nil do
    begin
        longitud:=longitud+1;
        l:=l^.sig;
    end;
end;

function repeticionPais(l:lista; pais:string):integer;
begin
    repeticionPais:=0;
    while l<>nil do
    begin
        if l^.pais = pais then repeticionPais:=repeticionPais+1;
        l:=l^.sig;
    end;
end;

procedure agregarFinal(var pri:lista; nombre,pais:string);
var act,nue:lista;
begin
    new(nue);
    nue^.nombre:=nombre;
    nue^.pais:=pais;
    nue^.sig:=nil;
    if pri <> nil then
    begin
        act:=pri;
        while (act^.sig <> nil) do act:=act^.sig;
        act^.sig:=nue;
    end
    else pri:=nue;
end;

function pertenece(l:lista; pais:string):boolean;
begin
    pertenece:=false;
    while (l<>nil) and not pertenece do
    begin
        if l^.pais = pais then pertenece:=true
        else l:=l^.sig;
    end;
end;

procedure nuevaLista(l:lista; var l2:lista; pais:string);
begin
    if pertenece(l,pais) then 
    begin
        l2:=nil;
        while l<>nil do 
        begin
            if l^.pais = pais then agregarFinal(l2,l^.nombre,pais);
            l:=l^.sig;
        end;
    end;
end;

procedure imprime(l:lista);
begin
    while l<>nil do
    begin
        writeln(l^.nombre);
        writeln(l^.pais);
        l:=l^.sig;
    end;
end;

var
    l,l2:lista;
    nombre,pais:string;
begin
    writeln('Ingrese el nombre del lugar a añadir: ');
    readln(nombre);
    writeln('Ingrese a que pais pertenece; ');
    readln(pais);
    while nombre<>'.' do
    begin
        agregarFinal(l,nombre,pais);
        writeln('Ingrese el nombre del lugar a añadir: ');
        readln(nombre);
        writeln('Ingrese a que pais pertenece; ');
        readln(pais);
    end;
    writeln('La longitud de la lista es: ', longitud(l));
    writeln('Ingrese el pais del cual desea saber cuantas veces aparece: ');
    readln(pais);
    writeln('La cantidad de veces que aparece ',pais,' es ',repeticionPais(l,pais));
    writeln('Elija el pais del cual desea obtener una lista de sus lugares turisticos: ');
    readln(pais);
    nuevaLista(l,l2,pais);
    imprime(l2);
    writeln('Ingrese el lugar que quiere agregar a la nueva lista: ');
    readln(nombre);
    agregarFinal(l2,nombre,pais);
    imprime(l2);
end.