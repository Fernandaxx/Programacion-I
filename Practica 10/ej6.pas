{6. * Un cine dispone de una lista con la información de los tickets del día (Nro. Caja, nro ticket, monto)
correspondientes a sus 6 cajas. Escribir un programa que procese dicha lista y permita:
a) Genere una nueva lista con los tickets con montos menores a $1000.
b) Calcular e informar el monto promedio recaudado por caja.
c) Calcular que cajas que recaudaron más de $12000 con menos de 100 tickets. Luego vuelva a
recorrer la lista para generar una nueva con los tickets pertenecientes a las cajas que cumplan
dicha condición. Recuerde usar un conjunto para mejorar la eficiencia.}

program ej6;
type
    datos = record
        caja,nro:integer;
        monto:real;
    end;

    lista = ^nodo;
    nodo = record
        ticket:datos;
        sig:lista;
    end;
    
    cajas = record
        cant:integer;
        total:real;
    end;

    vector = array[1..6] of cajas;

    conj=set of 1..6;

procedure cargarRegistro(var ticket:datos);
begin
    writeln('Ingrese el nro de caja: ');
    readln(ticket.caja);
    if ticket.caja<>-1 then 
    begin
        writeln('Ingrese el nro de ticket: ');
        readln(ticket.nro);
        writeln('Ingrese el precio: ');
        readln(ticket.monto);
    end;
end;

procedure cargarLista(var l:lista; ticket:datos);
var nue,act:lista;
begin
    act:=l;
    new(nue);
    nue^.ticket:=ticket;
    if (l<>nil) then 
    begin
        while act<>nil do act:=act^.sig;
        act^.sig:=nue;
    end
    else l:=nue;
end;

procedure lista1000(var l2:lista; l:lista);
begin
    while l<>nil do
    begin
        if l^.ticket.monto<1000 then cargarLista(l2,l^.ticket);
        l:=l^.sig;
    end;
end;

procedure promedioCajas(l:lista; var v:vector);
var i:integer;
begin
    for i:=1 to 6 do
    begin
        v[i].cant:=0;
        v[i].total:=0;
    end;

    while l<>nil do
    begin
        v[l^.ticket.caja].cant := v[l^.ticket.caja].cant + 1;
        v[l^.ticket.caja].total := v[l^.ticket.caja].total + l^.ticket.monto;
        l:=l^.sig;
    end;

    for i:=1 to 6 do
        writeln('El promedio recaudado por la caja ',i,' fue de $', (v[i].total/v[i].cant):2:2);
end;

procedure listaC(l:lista; var l3:lista; conjunto:conj);
begin
    while (l<>nil) do
    begin
        if l^.ticket.caja in conjunto then cargarLista(l3,l^.ticket);
        l:=l^.sig;
    end;
end;

var
    l,l2,l3:lista;
    ticket:datos;
    v:vector;
    conjunto:conj;
    i:integer;
begin
    conjunto:=[];
    l:=nil; l2:=nil; l3:=nil;
    cargarRegistro(ticket);
    while(ticket.caja<>-1) do
    begin
        cargarLista(l,ticket);
        cargarRegistro(ticket);
    end;

    lista1000(l2,l);
    promedioCajas(l,v);
    for i:=1 to 6 do
        if (v[i].total > 12000) and (v[i].cant<100) then conjunto:=conjunto+[i];
    listaC(l,l3,conjunto);
end.