{5. Un congreso de Informática dispone de una lista con la información de sus participantes. De cada
participante, se conoce: Apellido y Nombre, Sexo, Área de Investigación a la que se dedica y País de
procedencia.
Se desea procesar la información para:
a) Informar los nombres de las participantes “Mujeres”, con país de procedencia “Argentina” y cuya
Área de Investigación es “Accesibilidad Web”. Además, la cantidad total de participantes que
cumplen con tal condición.
b) Calcular e informar el porcentaje de participantes que provienen de países que no son
“Argentina”.
c) Generar una nueva lista ordenada por Área de Investigación.}

program ej5;
type
    participante = record
        apellido,nombre,sexo,area,pais:string;
    end;
    lista = ^nodo;
    nodo = record
        datos:participante;
        sig:lista;
    end;

procedure imprimir(l:lista);
begin
    while (l<>nil) do
    begin
        writeln('--------------------');
        writeln('LISTA:');
        writeln(l^.datos.apellido);
        writeln(l^.datos.nombre);
        writeln(l^.datos.sexo);
        writeln(l^.datos.area);
        writeln(l^.datos.pais);
        writeln('--------------------');
        l:=l^.sig;
    end;
end;

procedure cargarRegistro(var datos:participante);
begin
    writeln('Ingrese apellido: ');
    readln(datos.apellido);
    if (datos.apellido<>'.') then
    begin
        writeln('Ingrese nombre: ');
        readln(datos.nombre);
        writeln('Ingrese sexo: ');
        readln(datos.sexo);
        writeln('Ingrese area: ');
        readln(datos.area);
        writeln('Ingrese pais: ');
        readln(datos.pais);
    end;
end;

procedure cargarLista(var l:lista; datos:participante);
var act,nue:lista;
begin
    new(nue);
    nue^.datos:=datos;
    nue^.sig:=nil;
    if l<>nil then
    begin
        act:=l;
        while act^.sig<>nil do act:=act^.sig;
        act^.sig:=nue;
    end
    else l:=nue;
end;

procedure procesoA(l:lista);
var cant:integer;
begin
    cant:=0;
    while (l<>nil) do
    begin
        if (l^.datos.sexo = 'f') and (l^.datos.pais = 'argentina') and (l^.datos.area = 'web') then
        begin
            writeln(l^.datos.nombre);
            writeln(l^.datos.apellido);
            cant:=cant+1;
        end;
        l:=l^.sig;
    end;
    writeln('La cantidad de personas que cumplen con la condicion es: ', cant);
end;

function porcentajeB(l:lista):real;
var total,cant:integer;
begin
    cant:=0; total:=0;
    while l<>nil do
    begin
        if (l^.datos.pais <> 'argentina') then cant:=cant+1;
        total:=total+1;
        l:=l^.sig;
    end;
    porcentajeB:=(cant/total)*100;
end;

procedure agregarOrdenado(var pri:lista; datos:participante);
var ant,act,nue:lista;
begin
    new(nue);
    nue^.datos:=datos;
    act:=pri;
    ant:=pri;
    while (act<>nil) and (act^.datos.area<datos.area) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant = act) then pri:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure procesoC(var l,l2:lista);
begin
    while (l<>nil) do
    begin
        agregarOrdenado(l2,l^.datos);
        l:=l^.sig;
    end;
end;

var 
    datos:participante;
    l,l2:lista;
begin
    l:=nil;
    cargarRegistro(datos);
    while(datos.apellido<>'.') do  
    begin
        cargarLista(l,datos);
        cargarRegistro(datos);
    end;
    procesoA(l);
    writeln('El porcentaje de participantes que no son de argentina es de: ', porcentajeB(l):2:2);
    procesoC(l,l2);
    imprimir(l2);
end.