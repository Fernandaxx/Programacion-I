{10. * Una casa de venta de comidas ofrece a la venta una variedad de platos. La misma cuenta con un
software que utiliza dos estructuras de datos: una en donde almacena la información de sus clientes:
código de cliente, apellido, nombre, domicilio y teléfono; y otra en donde almacena la información de
los 100 platos diferentes que dispone. Los platos se encuentran codificados del 1 al 100 y de cada
uno se sabe: nombre y stock disponible. Realizar un programa que:
a) Lea información de pedidos de platos de comida. De cada pedido se conoce el código de
cliente que desea hacer el pedido, el código del plato que solicita y la cantidad de ese plato.
Para que el pedido pueda llevarse a cabo se deben realizar las validaciones correspondientes
y en caso de no existir ningún inconveniente, realizar la venta del mismo, caso contrario,
informar porque la venta no pudo ser realizada. Tener en cuenta que el código de cliente debe
ser de un cliente almacenado por la empresa, y debe existir suficiente stock del plato pedido.
La recepción de pedidos finaliza cuando se lee un código de cliente igual a -1.}

program ej10;
type
    cliente = record
        cod,tel:integer;
        apellido,nombre,domicilio:string;
    end;

    lista = ^nodo;
    nodo = record
        datos:cliente;
        sig:lista;
    end;

    plato = record
        nombre:string;
        stock:integer;
    end;

    vector=array[1..100] of plato;

function existe(clientes:lista; codcliente:integer):boolean;
begin
    existe:=false;
    while(clientes<>nil) and (clientes^.datos.cod <> codcliente) do clientes:=clientes^.sig;
    if clientes^.datos.cod = codcliente then existe:=true;
end;

function hayStock(platos:vector; codplato:integer; cant:integer):boolean;
begin
    if platos[codplato].stock >= cant then hayStock:=true
    else hayStock:=false;
end;

procedure sinStock(platos:vector);
var i:integer;
begin
    for i:=1 to 100 do
        if(platos[i].stock=0) then writeln('No hay stock del plato', i,platos[i].nombre);
end;

var 
    clientes:lista;
    platos:vector;
    codcliente,codplato,cant:integer;
begin
    writeln('Ingrese el codigo de cliente, el codigo y la cantidad del plato solicitado; ');
    readln(codcliente);
    readln(codplato);
    readln(cant);
    while (codcliente<>-1) do
    begin
        if (existe(clientes,codcliente)) and (hayStock(platos,codplato,cant)) then
        begin
            platos[codplato].stock:=platos[codplato].stock-cant;
            writeln('La venta se concreta exitosamente');
        end
        else 
        begin
            if not(existe(clientes,codcliente)) then writeln('El cliente no existe en la base de datos')
            else writeln('No hay dicha cantidad del plato');
        end;
        writeln('Ingrese el codigo de cliente, el codigo y la cantidad del plato solicitado; ');
        readln(codcliente);
        readln(codplato);
        readln(cant);
    end;
    sinStock(platos);
end.