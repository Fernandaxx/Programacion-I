{Una empresa de la ciudad de La Plata, que realiza entregas de paquetes dentro del casco
urbano, está interesada en procesar la información de sus paquetes. De cada paquete se conoce la
fecha de envío, si pudo ser entregado al destinatario y la dirección que está compuesta por los
campos: calle (de 1 a 122), número, piso y departamento.
Se dispone de una lista con los envíos del pasado año. Se requiere procesar la lista recorriéndola
una sola vez para:
a. Informar la cantidad de envíos realizados para cada calle.
b. Informar el nombre del mes con mayor cantidad de paquetes enviados.
c. Eliminar de la lista de envíos, aquellos que no fueron entregados al destinatario.
d. Generar 10 nuevas listas con los envíos de las calles 11 a la 20. Cada lista debe estar ordenada
por el número de la dirección.}

program ej4;
type
    fechas = record
        dia:1..31;
        mes:1..12;
    end;
    direcciones = record 
        calle:1..122;
        numero:integer;
        piso:integer;
        departamento:integer;
    end;
    paquete = record
        fecha:fechas;
        entrega:boolean;
        direccion:direcciones;
    end;

    lista = ^nodo;
    nodo = record
        datos:paquete;
        sig:lista;
    end;

    vector1 = array[1..122] of integer;
    vector2 = array[1..12] of integer;
    vector3 = array[11..20] of lista;

procedure eliminar(var l:lista; datos:paquete);
var ant,act:lista;
begin
    act:=l;
    while (act<>nil) and (act^.datos<>datos) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if act<>nil then
    begin
        if act = l then then l:=act^.sig
        else ant^.sig:=act^.sig;
        dispose(act);
    end; 
end;

procedure agregarOrdenado(var l:lista; datos:paquete);
var ant,nue,act:lista;
begin
    new(nue);
    nue^.datos:=datos;
    act:=l;
    ant:=l;
    while (act<>nil) and (act^.datos.direccion.numero < datos.direccion.numero) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if ant=act then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
end;

var   
    l:lista;
    listas:vector3;
    envios:vector1;
    meses:vector2;
    maxMes,maxEnvios:integer;
    i:integer;
begin
    l:=nil; 
    cargarLista(l); //se dispone de enunciado
    act:=l;
    for i:=1 to 122 do envios[i]:=0;
    for i:=1 to 12 do meses[i]:=0;
    for i:=11 to 20 do listas[i]:=nil;
    while act<>nil do 
    begin
        envios[act^.datos.direccion.calle]:=envios[act^.datos.direccion.calle]+1;
        meses[act^.datos.fecha.mes]:=meses[act^.datos.fecha.mes]+1;
        if (act^.datos.entrega = false) then eliminar(l,act^.datos);
        if (act^.datos.direccion.calle>=11) and (act^.datos.direccion.calle<=20) then agregarOrdenado(listas[act^.datos.direccion.calle],act^.datos);
        act:=act^.sig;
    end;
    for i:=1 to 122 do writeln('Se realizaron ', envios[i], ' envios en la calle ', i);
    maxMes:=0; maxEnvios:=-1;
    for i:=1 to 12 do
    begin
        if meses[i]>maxEnvios then 
        begin
            maxEnvios:=meses[i];
            maxMes:=i;
        end;
    end;
    writeln('El mes en el que se realizaron mas envios fue: ', maxMes);
end.
