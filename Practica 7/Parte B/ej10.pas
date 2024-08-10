program ej10;
const 
    dimFcol=10; dimFfila=10;
type
    matriz = array[1..dimFfila , 1..dimFcol] of boolean;
    jugador = record
        nombre:string;
        tablero:matriz;
    end;

procedure inicializarTablero(var player:jugador);
var f,c:integer;
begin
    for f:=1 to dimFfila do 
        for c:=1 to dimFcol do
            player.tablero[f,c]:=false;
end;

procedure cargarTablero(var player:jugador; f,c:integer; var exito:boolean);
begin
    if player.tablero[f,c]=true then
        exito:=false
    else begin 
        exito:=true;
        player.tablero[f,c]:=true
    end;
end;

procedure cargarJugador(var player:jugador);
var 
    i,f,c:integer;
    exito:boolean;
begin
    inicializarTablero(player);
    writeln('Ingrese su nombre de jugador: ');
    readln(player.nombre);
    for i:=1 to 5 do 
    begin
        writeln('Coloque el barco ',i,' en un casillero disponible');
        writeln('Fila: ');
        readln(f);
        writeln('Columna: ');
        readln(c);
        cargarTablero(player,f,c,exito);
        while not exito do
        begin
            writeln('Ingrese un casillero desocupado');
            writeln('Fila: ');
            readln(f);
            writeln('Columna: ');
            readln(c);
            cargarTablero(player,f,c,exito);
        end;
    end;
    writeln('La carga finalizo correctamente.');
end;

procedure hundeBarco(var player:jugador; f,c:integer);
begin
    if player.tablero[f,c] then 
    begin
         player.tablero[f,c]:=false;
         writeln('¡Hundido!');
    end
    else writeln('Agua :(');
end;

function finJuego(player:jugador):boolean;
var f,c:integer;
begin
    finJuego:=true;
    f:=1;
    c:=1;
    while not(player.tablero[f,c]) and not((c=10) and (f=10)) do
    begin
        c:=1;
        while not(player.tablero[f,c]) and (c<10) do
            c:=c+1;
        if not(player.tablero[f,c]) and (f<10) then f:=f+1;
    end;
    if (player.tablero[f,c]) then finJuego:=false;
end;

procedure juego(var player1,player2:jugador);
var
    f,c:integer;
begin
    while not(finJuego(player1)) and not(finJuego(player2)) do
    begin
        writeln(player1.nombre,' intenta adivinar la posicion de un barco de  ',player2.nombre);
        writeln('Fila: ');
        readln(f);
        writeln('Columna: ');
        readln(c);
        hundeBarco(player2,f,c);
        if not(finJuego(player2)) then
        begin
            writeln(player2.nombre,' intenta adivinar la posicion de un barco de  ',player1.nombre);
            writeln('Fila: ');
            readln(f);
            writeln('Columna: ');
            readln(c);
            hundeBarco(player1,f,c);
        end; 
    end;
    if finJuego(player1) then writeln('¡Felicitaciones ', player2.nombre,' ganaste el juego!')
    else writeln('¡Felicitaciones ', player1.nombre,' ganaste el juego!');
end;

var
    player1,player2:jugador;
begin
    writeln('-------------');
    writeln('JUGADOR 1');
    cargarJugador(player1);
    writeln('-------------');
    writeln('JUGADOR 2');
    cargarJugador(player2);
    writeln('-------------');
    writeln('COMIENZA EL JUEGO');
    juego(player1,player2)
end.