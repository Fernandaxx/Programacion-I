program ej12;
type
    lista = ^nodo;
    nodo = record
        num:integer;
        sig:lista;
    end;

procedure agregarOrdenado(var pri:lista; num:integer);
var ant,nue,act:lista;
begin
    new(nue);
    nue^.num:=num;
    act:=pri;
    ant:=pri;
    while (act<>nil) and (act^.num<num) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if ant=act then pri:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure unionListas(A,B:lista; var C:lista);
begin
    while (A<>nil) do
    begin
        agregarOrdenado(C,A^.num);
        A:=A^.sig;
    end;
    while (B<>nil) do
    begin
        agregarOrdenado(C,B^.num);
        B:=B^.sig;
    end;
end;

procedure unionListas2(var A:lista; B:lista);
begin
    while (B<>nil) do
    begin
        agregarOrdenado(A,B^.num);
        B:=B^.sig;
    end;
end;

function existe(l:lista; num:integer):boolean;
begin
    existe:=false;
    while (l<>nil) and (l^.num<>num) do l:=l^.sig;
    if l^.num = num then existe:=true;
end;

procedure eliminar(var A:lista; num:integer;var exito:boolean);
var ant,act:lista;
begin
    exito:=false;
    while (existe(A,num)) do
    begin
        act:=A;
        while (act<>nil) and (act^.num<>num) do
        begin
            ant:=act;
            act:=act^.sig;
        end;
        if (act<>nil) then
        begin
            exito:=true;
            if (act=A) then A:=act^.sig
            else ant^.sig:=act^.sig;
            dispose(act);
        end;
    end;
end;

procedure imprime(l:lista);
begin
    while l<>nil do
    begin
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

var
    A,B,C:lista;
    num:integer;
    exito:boolean;
begin
    A:=nil;
    B:=nil;
    C:=nil;
    writeln('CARGA LISTA A');
    writeln('INGRESE UN NUMERO');
    readln(num);
    while num<>-1 do 
    begin
        agregarOrdenado(A,num);
        writeln('INGRESE UN NUMERO');
        readln(num);
    end;
    writeln('CARGA LISTA B');
    writeln('INGRESE UN NUMERO');
    readln(num);
    while num<>-1 do 
    begin
        agregarOrdenado(B,num);
        writeln('INGRESE UN NUMERO');
        readln(num);
    end;
    unionListas(A,B,C);
    writeln('LISTA C: ');
    imprime(C);
    unionListas2(A,B);
    writeln('NUEVA LISTA A: ');
    imprime(A);
    writeln('Ingrese le numero a eliminar de toda la lista A: ');
    readln(num);
    eliminar(A,num,exito);
    if exito then writeln('SE PUDO')
    else writeln ('NO SE PUDO');
    writeln('NUEVA LISTA A: ');
    imprime(A);
end.