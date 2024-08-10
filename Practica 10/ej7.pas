{7. * Un banco dispone de una lista con la información de pago de sus jubilados (Documento, apellido,
nombre y monto a pagar). Debido a que la cantidad de jubilados para cobrar es muy grande se
decidió pagarles en 10 días diferentes agrupándolos por el último dígito de su documento. Escribir un
programa que implemente la separación de la lista en 10 listas diferentes conservando el orden
original en cada lista}

program ej7;
type
    info = record
        dni:integer;
        nombre,apellido:string;
        monto:real;
    end;

    lista = ^nodo;
    nodo = record
        datos:info;
        sig:lista;
    end;

    vector = array[0..9] of lista;

function ultimoDigito(num:integer):integer;
begin
    ultimoDigito:=num div 10;
end;

procedure cargarRegistro(var datos:info);
begin
    writeln('Ingrese dni');
    readln(datos.dni);
    if (datos.dni<>-1) then
    begin
        writeln('Ingrese nombre');
        readln(datos.nombre);
        writeln('Ingrese apellido');
        readln(datos.apellido);
        writeln('Ingrese monto');
        readln(datos.monto);
    end;
end;
procedure cargarLista(var l:lista; datos:info);
var nue:lista;
begin
    new(nue);
    nue^.datos:=datos;
    nue^.sig:=l;
    l:=nue;
end;

var  
    listas:vector;
    l:lista;
    i:integer;
    datos:info;
    act:lista;


begin
    l:=nil;
    for i:=0 to 9 do listas[i]:=nil;
    act:=l;

    cargarRegistro(datos);
    while datos.dni<>-1 do
    begin
        cargarLista(l,datos);
        cargarRegistro(datos);
    end;

    while act<>nil do 
    begin
        case ultimoDigito(l^.datos.dni) of
            0:cargarLista(listas[0],l^.datos);
            1:cargarLista(listas[1],l^.datos);
            2:cargarLista(listas[2],l^.datos);
            3:cargarLista(listas[3],l^.datos);
            4:cargarLista(listas[4],l^.datos);
            5:cargarLista(listas[5],l^.datos);
            6:cargarLista(listas[6],l^.datos);
            7:cargarLista(listas[7],l^.datos);
            8:cargarLista(listas[8],l^.datos);
            9:cargarLista(listas[9],l^.datos);
        end;
        act:=act^.sig;
    end;
end.