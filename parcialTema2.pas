//resolucion del programa del primer parcial de la primer fecha de programacion I -- TEMA 2

program parcialTema2;
type 
    fechas = record
        dia:1..31;
        mes:1..12;
        anio:integer;
    end;

    diaVac = record 
        fecha:fechas;
        partido:1..136;
        zona:1..6;
        cant:integer;
    end;

    lista = ^nodo;
    nodo = record 
        datos:diaVac;
        sig:lista;
    end;

    vector1 = array[1..136] of string;
    vector2 = array[1..136] of integer;
    vector3 = array[1..6] of lista;

    rMax = record 
        partido:1..136;
        cant:integer;
    end;


procedure agregarOrdenado(var l:lista; datos:diaVac);
var act,ant,nue:lista;
begin
    new(nue);
    nue^.datos:=datos;
    ant:=l; act:=l;
    while (act<>nil) and (act^.datos.partido < datos.partido) do 
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if ant=act then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure calcularMaximos(v:vector2; var max1,max2:rMax);
var i:integer;
begin
    max1.cant:=-1;
    max2.cant:=-1;
    for i:=1 to 136 do 
    begin
        if v[i] > max1.cant then 
        begin
            max2.partido:=max1.partido;
            max2.cant:=max1.cant;
            max1.partido:=i;
            max1.cant:=v[i];
        end
        else if v[i] > max2.cant then 
        begin
            max2.partido:=i;
            max2.cant:=v[i];
        end;
    end;
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
    l,act,ant,prox:lista;
    vNombres:vector1;
    vCant:vector2;
    vListas:vector3;
    max1,max2:rMax;
    i:integer;
begin 
    l:=nil;
    cargarLista(l);//se dispone de enunciado
    cargarVector(vNombres); //se dispone de enunciado

    for i:=1 to 136 do vCant[i]:=0;
    for i:=1 to 6 do vListas[i]:=nil;

    act:=l;
    ant:=l;
    while (act<>nil) do 
    begin
        if (act^.datos.fecha.anio <> 2021) then 
        begin
            prox:=act^.sig;
            if ant = act then l:=act^.sig
            else ant^.sig := act^.sig;
            dispose(act);
            act:=prox;
        end

        else begin 
            vCant[act^.datos.partido] := vCant[act^.datos.partido] + act^.datos.cant;
            agregarOrdenado(vListas[act^.datos.zona],act^.datos);
            ant:=act;
            act:=act^.sig;
        end;
    end;
    calcularMaximos(vCant,max1,max2);
    writeln('El nombre del partido con mas personas vacunadas en 2021 es: ', vNombres[max1.partido], 'con ', max1.cant, 'vacunados');
    writeln('El nombre del segundo partido con mas personas vacunadas en 2021 es: ', vNombres[max2.partido], 'con ', max2.cant, 'vacunados');


    liberarMemoria(l);
    for i:=1 to 6 do liberarMemoria(vListas[i]);
end.