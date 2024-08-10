program ej1;
type
    cliente = record
        nombre,apellido:string;
        monto:real;
        cod:1..9;
    end;
    
    lista = ^nodo;
    nodo = record
        datos:cliente;
        sig:lista;
    end;

    vector = array[1..9] of integer;

procedure inicializarVector(var v:vector);
var i:1..9;
begin
    for i:=1 to 9 do v[i]:=0;
end;

function informarMax(v:vector):integer;
var i:1..9; max:integer;
begin
    max:=-1;
    for i:=1 to 9 do 
    begin
        if v[i]>max then max:=v[i];
        informarMax:=i;
    end;
end;

function sinAtender(l:lista):integer;
begin
    sinAtender:=0;
    while l<>nil do
    begin
        sinAtender:=sinAtender+1;
        l:=l^.sig;
    end;
end;

procedure liberarMemoria(var l:lista);
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
    act:lista;
    total:real;
    max:vector;
    cant:integer;
begin
    l:=nil;
    cargarLista(l); //se dispone de enunciado
    act:=l;
    total:=0;
    inicializarVector(max);
    cant:=0;
    if l<>nil then 
    begin
        while (act<>nil) and (total<=100000) do
        begin
            total:=total+act^.datos.monto;
            max[act^.datos.cod]:= max[act^.datos.cod] + 1;
            act:=act^.sig;
        end;
        writeln('El impuesto mas vendido fue: ', informarMax(max));
        writeln('La cantidad de clientes sin atender fue: ', sinAtender(act));
        liberarMemoria(l);
        liberarMemoria(act);
    end;    
end. 