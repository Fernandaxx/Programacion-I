program ej6;
const dimF=64;
type
    rango=0..1;
    vector = array[1..dimF] of rango;

procedure cargarVector(var v:vector; dimF:integer);
var i:integer;
begin
    for i:=1 to dimF do  
    begin
        writeln('Ingrese un numero (0/1)');
        readln(v[i]);
    end;
end;

procedure f_and(v1,v2:vector; var v3: vector);
var i:integer;
begin
    for i:=1 to dimF do
    begin
        if (v1[i]=1) and (v2[i]=1) then v3[i]:=1
        else v3[i]:=0;
    end;
end;

procedure f_or(v1,v2:vector; var v3: vector);
var i:integer;
begin
    for i:=1 to dimF do
    begin
        if (v1[i]=1) or (v2[i]=1) then v3[i]:=1
        else v3[i]:=0;
    end;
end;

procedure f_not(v:vector; var v3:vector);
var i:integer;
begin
    for i:=1 to dimF do
    begin
        if v[i]=0 then v3[i]:=1
        else v3[i]:=0;
    end;
end;

procedure imprimir(v1,v2,v3:vector; dimF:integer; op:string);
var i:integer;
begin
    writeln('-------------------------------');
    for i:=1 to dimF do
    begin
        writeln(v1[i], op , v2[i], ' = ', v3[i]);
    end;
    writeln('-------------------------------');
end;

procedure imprimirNOT(v,v3:vector; dimF:integer; op:string);
var i:integer;
begin
    for i:=1 to dimF do
    begin
        writeln(v[i],op,' = ',v3[i]);
    end;
end;

var
    v1,v2,v3:vector;
    op:string;
begin
    cargarVector(v1,dimF);
    cargarVector(v2,dimF);
    op:='AND';
    f_and(v1,v2,v3);
    imprimir(v1,v2,v3,dimF,op);
    op:='OR';
    f_or(v1,v2,v3);
    imprimir(v1,v2,v3,dimF,op);
    op:='NOT';
    f_not(v1,v3);
    imprimirNOT(v1,v3,dimF,op);
    f_not(v2,v3);
    imprimirNOT(v2,v3,dimF,op);
end.
