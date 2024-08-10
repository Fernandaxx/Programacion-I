{. Se desea modelar un nuevo juego que consiste en un tablero de 15 filas por 15 columnas y que se
juega de a 2 jugadores. Cada casillero del tablero contiene un número del 0 al 10 y un valor que
indica si la celda fue utilizada a lo largo de la partida.
La partida consiste de 10 rondas donde en cada una de las rondas los 2 jugadores eligen una
celda del tablero. Las celdas elegidas en cada ronda se analizan y obtiene un punto el jugador que
eligió la celda que contiene el mayor número. En caso de que ambos jugadores hayan, en una
ronda, elegido una celda que contiene el mismo número ninguno suma puntos. En caso de que
algún jugador seleccione una celda que ya haya sido utilizada a lo largo de la partida, dicho jugador
pierde la ronda y se le suma un punto a su oponente. En caso de que en una ronda ambos
jugadores seleccionen celdas que ya hayan sido utilizadas a lo largo de la partida, ninguno suma
puntos. Se pide:
a. Implemente un módulo que inicialice el tablero de juego. El modulo recibe el tablero y una lista
con los valores que va a tener cada celda del tablero. Cada elemento de la lista almacena: fila,
columna y número para la celda (0 a 10). Además, cada celda se debe marcar como no
utilizada. En caso de que el valor para una celda no venga en la lista, dicha celda se
inicializara con el valor 0 (cero).
b. Implemente un módulo que reciba el tablero y simule el juego. Los valores que cada jugador va
eligiendo son leídos de teclado. Al finalizar el juego, informar los puntos obtenidos por cada
jugador y cuál es el ganador.}

program ej5;
const
    dimF=15;
type 
    rMatriz = record 
        num:0..10;
        use:boolean;
    end;
    matriz = array[1..dimF,1..dimF] of rMatriz;

    elemento = record
        fila,columna: 1..dimF;
        num:-1..10;
    end;
    lista = ^nodo;
    nodo = record
        datos:elemento;
        sig:lista;
    end;

procedure inicializarTablero(var tablero:matriz; l:lista);
var f,c:integer;
begin
    for f:=1 to dimF do
        for c:=1 to dimF do
            begin
                tablero[f,c].num:=0;
                tablero[f,c].use:=false;
            end;
    while l<>nil do
    begin
        tablero[l^.datos.fila,l^.datos.columna].num:=l^.datos.num;
        tablero[l^.datos.fila,l^.datos.columna].use:=false;
        l:=l^.sig;
    end;
end;

procedure cargarElemento(var datos:elemento);
begin
    writeln('Ingrese numero: ');
    readln(datos.num);
    if datos.num <> -1 then begin
        writeln('Ingrese fila');
        readln(datos.fila);
        writeln('Ingrese columna');
        readln(datos.columna);
    end;
end;

procedure cargarLista (var l:lista; datos:elemento);
var nue:lista;
begin
    new(nue);
    nue^.datos:=datos;
    nue^.sig:=l;
    l:=nue;
end;

procedure Juego(var tablero:matriz);
var 
    i:integer;
    player1,player2:integer;
    f1,c1,f2,c2:integer;
begin
    player1:=0; player2:=0;
    for i:=1 to 10 do
    begin
        writeln('Jugador 1, elija un casillero: ');
        writeln('Ingrese fila: ');
        readln(f1);
        writeln('Ingrese columna: ');
        readln(c1);
        writeln('Jugador 2, elija un casillero: ');
        writeln('Ingrese fila: ');
        readln(f2);
        writeln('Ingrese columna: ');
        readln(c2);

        if (tablero[f1,c1].use = false) and (tablero[f2,c2].use = false) then 
        begin
            tablero[f1,c1].use := true;
            tablero[f2,c2].use := true;
            if tablero[f1,c1].num <> tablero[f2,c2].num then 
            begin
                if tablero[f1,c1].num>tablero[f2,c2].num then player1:=player1+1
                else player2:=player2+1;
            end;
        end;
        if not ((tablero[f1,c1].use = true) and (tablero[f2,c2].use = true)) then
            if tablero[f1,c1].use = true then player2:=player2+1
            else player1:=player1+1;
    end;
    writeln('El jugador 1 obtuvo ', player1,' puntos.');
    writeln('El jugador 2 obtuvo ', player2,' puntos.');
    if player1>player2 then writeln ('El jugado 1 gano el juego')
    else writeln('El jugador 2 gano el juego');
end;

var
    l:lista;
    datos:elemento;
    tablero:matriz;
begin
    l:=nil;
    cargarElemento(datos);
    while datos.num <> -1 do
    begin
        cargarLista(l,datos);
        cargarElemento(datos);
    end;
    inicializarTablero(tablero,l);
    Juego(tablero);
end.