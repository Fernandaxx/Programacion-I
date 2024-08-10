program ej2v2;
const dimF=6;
type
    subrango = 0..dimF;
    cajaR = record
        monto:real;
        cant:integer;
    end;
    cajas = array[1..dimF] of cajaR;

procedure inicializa(var c:cajas);
var i:integer;
begin
	for i:=1 to dimF do
	begin
		c[i].monto:=0;
        c[i].cant:=0;
	end;
end;

procedure max(c:cajas; var maxCaja:integer; var maxDinero:real);
var i:integer;
begin
	for i:=1 to dimF do
	begin
		if c[i].monto>maxDinero then 
		begin
			maxDinero:=c[i].monto;
			maxCaja:=i;
		end;
	end;
end;

procedure promedios(c:cajas);
var i:integer;
begin
	for i:=1 to dimF do
	begin
		writeln('El promedio de la caja ',i,' es ',(c[i].monto/c[i].cant):2:2);
	end;
end;

var 
	caja:subrango;
	ingreso:real;
	c:cajas;
	maxDinero:real;
	maxCaja:integer;
begin
	maxDinero:=-1;
	inicializa(c);
	writeln('Ingrese el nro de caja: ');
	readln(caja);
	while caja<>0 do 
	begin
	    writeln('Ingrese el dinero a depositar: ');
		readln(ingreso);
		c[caja].monto:=c[caja].monto+ingreso;
        c[caja].cant:=c[caja].cant+1;
		writeln('Ingrese el nro de caja: ');
		readln(caja);
	end;
	max(c,maxCaja,maxDinero);
	writeln('la caja con mas dinero es: ', maxCaja);
	promedios(c);
end.

