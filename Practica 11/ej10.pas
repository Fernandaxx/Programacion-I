{10. Se dispone de cierta cantidad de mensajes de texto de una conocida red social. Cada mensaje
cuenta con un texto, la cantidad de "me gusta" y la cantidad de veces que fué compartido con otros
usuarios. Se dispone de un arreglo con capacidad máxima para 1000 mensajes ordenado por
cantidad de "me gusta". Se pide:
a. implemente un módulo que reciba el arreglo de mensajes anterior y un mensaje de texto y lo
agregue de manera que mantenga el orden.
b. implemente un módulo que reciba un arreglo de mensajes y lo reordene por la cantidad de veces
que fue compartido.
Nota: recuerde que el arreglo no necesariamente está completo y que no debe agregar mensajes si
se alcanzó la capacidad máxima.}

program ej10;
const dimF=1000;
type
    mensaje = record 
        texto:string;
        mg:integer;
        shared:integer;
    end;

    vector = array[1..dimF] of mensaje;

function BuscarPosicionMG(datos:mensaje; v:vector; dimL:integer):integer;
var pos:integer;
begin
    pos:=1;
    while (pos <= dimL) and (datos.mg>v[pos].mg) do 
        pos:=pos+1;
    if (pos>dimL) or (datos.mg < v[pos].mg) then pos:=0;
    BuscarPosicionMG:=pos;
end;

function BuscarPosicionSHARED(datos:mensaje; v:vector; dimL:integer):integer;
var pos:integer;
begin
    pos:=1;
    while (pos <= dimL) and (datos.shared>v[pos].shared) do 
        pos:=pos+1;
    if (pos>dimL) or (datos.shared < v[pos].shared) then pos:=0;
    BuscarPosicionSHARED:=pos;
end;

procedure Insertar(var v:vector; var dimL:integer; pos:integer; datos:mensaje);
var j:integer;
begin
    for j:=dimL downto pos do 
        v[j+1] := v[j];
    v[pos]:=datos;
    dimL:=dimL+1;
end;

procedure agregarOrdenado1(var v:vector; datos:mensaje; var dimL:integer);
var pos:integer;
begin
    if dimL<dimF then 
    begin
        pos:=BuscarPosicionMG(datos,v,dimL);
        Insertar(v,dimL,pos,datos);
    end;
end;

procedure agregarOrdenado2(var v:vector; datos:mensaje; var dimL:integer);
var pos:integer;
begin
    if dimL<dimF then 
    begin
        pos:=BuscarPosicionSHARED(datos,v,dimL);
        Insertar(v,dimL,pos,datos);
    end;
end;

procedure ordenarCompartido(var v:vector; dimL:integer);
var copia:vector;
    i:integer;
begin
    for i:=1 to dimL do copia[i].shared:=-1;  //inicializo vector donde se ordenara por compartidos
    for i:=1 to dimL do agregarOrdenado2(copia,v[i],dimL); //cargo los elementos del vector original ordenados por compartido en la copia
    for i:=1 to dimL do v[i]:=copia[i]; //copio los elementos de la copia en el vector original, ya ordenados por nro de compartidos
end;

var 
    mensajes:vector;
    Nmensaje:mensaje;
    dimL:integer;
begin
    cargarMensajes(mensajes,dimL); //se dispone de enunciado
    writeln('Ingrese el texto: ');
    readln(Nmensaje.texto);
    writeln('Ingrese la cantidad de me gusta: ');
    readln(Nmensaje.mg);
    writeln('Ingrese la cantidad de veces que fue compartido: ');
    readln(Nmensaje.shared);
    agregarOrdenado1(mensajes,Nmensaje,dimL);
    ordenarCompartido(mensajes,dimL);
end.