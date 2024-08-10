program ej11;
const dimF=3;
type
    lista = ^nodo;

    nodo = record
        min,seg:integer;
        sig:lista;
    end;

    registro = record 
        nombre:string;
        apellido:string;
        genero:string;
        tiempo:lista;
    end;

    vector = array[1..dimF] of registro;

procedure inicializarListas(var c:vector);
var i:integer;
begin
    for i:=1 to dimF do c[i].tiempo:=nil;
end;

procedure cargarTiempos(var l:lista; min,seg:integer);
var act,nue:lista;
begin
    new(nue);
    nue^.min:=min;
    nue^.seg:=seg;
    nue^.sig:=nil;
    act:=l;
    if act<>nil then 
    begin
        while (act^.sig<>nil) do act:=act^.sig;
        act^.sig:=nue;
    end
    else l:=nue;

end;

function mejorTiempo(corredor:registro):integer;
begin
    mejorTiempo:=9999;
    while corredor.tiempo <> nil do
    begin
        if ((corredor.tiempo^.min*60 + corredor.tiempo^.seg)<mejorTiempo) then
            mejorTiempo:=corredor.tiempo^.min*60 + corredor.tiempo^.seg;
        corredor.tiempo:=corredor.tiempo^.sig;
    end;
end;

function promedioTiempo(corredor:registro):real;
var sumatiempos,total:integer;
begin
    sumatiempos:=0;
    total:=0;
    while corredor.tiempo<>nil do
    begin
        sumatiempos:=sumatiempos+corredor.tiempo^.min*60 + corredor.tiempo^.seg;
        total:=total+1;
        corredor.tiempo:=corredor.tiempo^.sig;
    end;
    if total<>0 then
        promedioTiempo:=sumatiempos/total
    else promedioTiempo:=0;
end;

var
    corredor:vector;
    i,min,seg:integer;
begin
    inicializarListas(corredor);
    for i:=1 to dimF do
    begin
        writeln('Ingrese nombre');
        readln(corredor[i].nombre);
        writeln('Ingrese apellido');
        readln(corredor[i].apellido);
        writeln('Ingrese genero');
        readln(corredor[i].genero);
        writeln('Ingrese minutos: ');
        readln(min);
        writeln('Ingrese segundos: ');
        readln(seg);
        while min<>-1 do
        begin
            cargarTiempos(corredor[i].tiempo,min,seg);
            writeln('Ingrese minutos: ');
            readln(min);
            writeln('Ingrese segundos: ');
            readln(seg);
        end;
    end;
    for i:=1 to dimF do 
    begin
        writeln('La maraton con mejor tiempo de ', corredor[i].nombre,' es ', mejorTiempo(corredor[i]), ' segundos');
        writeln('El promedio de tiempos del corredor ', corredor[i].nombre, ' es ', promedioTiempo(corredor[i]):2:2,' segundos');
    end;
end.
