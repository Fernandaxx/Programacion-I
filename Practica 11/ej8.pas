{8. Una empresa de comidas rápidas ofrece 12 combos (comida, bebida y postre) y está interesada en
realizar un análisis semanal de los pedidos que hacen sus clientes. De cada pedido se conoce el
código del combo (de 1 a 12), día de la semana que se pidió (1=lunes, 2=martes, ..., 7=domingo) y
precio (sin descuento). Además, la empresa aplica, a manera de promoción, distintos descuentos
sobre los combos según el día de la semana.
Se dispone de una lista de los pedidos realizados en la semana pasada. También se dispone de
una estructura que se accede por código de combo a la descripción del mismo y otra estructura que
se accede por el día para obtener el descuento (en $) a aplicar ese día. Se requiere procesar la lista
de ventas recorriéndola una sola vez para:
a) Calcular e informar el monto facturado cada día, incluyendo el descuento.
b) Calcular e informar la descripción y monto facturado de los 2 combos más pedidos.
c) Generar 4 nuevas listas conservando su orden original e incluyendo los pedidos:
1.Cuyo precio sea menor a $100.
2.Cuyo precio sea mayor o igual a $100.
3.Cuyo código de combo esté entre 1 y 3.
4.Cuyo código de combo sea mayor o igual a 4.}

program ej8;
type
    pedido = record 
        combo:1..12;
        dia:1..7;
        precio:real;
    end;

    lista=^nodo;
    nodo = record 
        datos:pedido;
        sig:lista;
    end;

    vector1 = array[1..12] of string;
    vector2 = array[1..7] of real;
    vector3 = array[1..12] of real;
    vector4 = array[1..4] of lista;

procedure agregarFinal(var l:lista; datos:pedido);
var act,nue:lista;
begin
    new(nue);
    nue^.datos:=datos;
    nue^.sig:=nil;
    if l<>nil then 
    begin
        act:=l;
        while (act^.sig <> nil) do act:=act^.sig;
        act^.sig:=nue;
    end
    else l:=nue;
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
    combos:vector1;
    descuentos:vector2;
    facturado:vector2;
    maspedidos:vector3;
    nListas:vector4;
    act:lista;
    i:integer;
    max1,max2:1..12;
    maxM1,maxM2:real;
begin
    l:=nil;
    cargarL(l); //se dispone de enunciado
    cargarCombos(combos); //se dispone de enunciado
    cargarDes(descuentos); //se dispone de enunciado
    act:=l;
    for i:=1 to 7 do facturado[i]:=0;
    for i:=1 to 12 do maspedidos[i]:=0;
    for i:=1 to 4 do nListas[i]:=nil;
    while act<>l do 
    begin
        facturado[act^.datos.dia]:=facturado[act^.datos.dia] + act^.datos.precio - descuentos[act^.datos.dia];
        maspedidos[act^.datos.combo]:=maspedidos[act^.datos.combo]+act^.datos.precio - descuentos[act^.datos.dia];
        if act^.datos.precio < 100 then agregarFinal(nListas[1],act^.datos)
        else agregarFinal(nListas[2],act^.datos);
        if (act^.datos.combo>=1) and (act^.datos.combo<=3) then agregarFinal(nListas[3],act^.datos)
        else agregarFinal(nListas[4],act^.datos);
        act:=act^.sig;
    end;
    for i:=1 to 7 do writeln('El monto facturado el dia ',i,' fue $', facturado[i]);
    maxM1:=-1; maxM2:=-1;
    for i:=1 to 12 do 
    begin
        if maspedidos[i]>maxM1 then 
        begin
            maxM2:=maxM1;
            max2:=max1;
            maxM1:=maspedidos[i];
            max1:=i;
        end
        else if maspedidos[i]>maxM2 then
        begin
            maxM2:=maspedidos[i];
            max2:=i;
        end;
    end;

    writeln('Descripcion del combo mas pedido: ', combos[max1], 'monto recaudado por el mismo: $',maxM1 );
    writeln('Descripcion del segundo combo mas pedido: ', combos[max2], 'monto recaudado por el mismo: $',maxM2 );
    liberarMemoria(l);
end.