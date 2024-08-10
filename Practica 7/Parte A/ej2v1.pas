program ej2v1;
const dimF=6;
type
	subrango=1..6;
	cajas = array[1..dimF] of real;
	cant = array[1..dimF] of integer;

procedure inicializa(var cantDepos:cant; var c:cajas);
var i:integer;
begin
	for i:=1 to dimF do
	begin
		cantDepos[i]:=0;
		c[i]:=0;
	end;
end;

procedure max(c:cajas; var maxCaja:integer; var maxDinero:real);
var i:integer;
begin
	for i:=1 to dimF do
	begin
		if c[i]>maxDinero then 
		begin
			maxDinero:=c[i];
			maxCaja:=i;
		end;
	end;
end;

procedure promedios(c:cajas; cantDepos:cant);
var i:integer;
begin
	for i:=1 to dimF do
	begin
		writeln('El promedio de la caja ',i,' es ',(c[i]/cantDepos[i]):2:2);
	end;
end;

var 
	caja:integer;
	ingreso:real;
	c:cajas;
	cantDepos:cant;
	maxDinero:real;
	maxCaja:integer;
begin
	maxDinero:=-1;
	inicializa(cantDepos,c);
	writeln('Ingrese el nro de caja: ');
	readln(caja);
	if caja<>0 then
	begin
		writeln('Ingrese el dinero a depositar: ');
		readln(ingreso);
		c[caja]:=c[caja]+ingreso;
		cantDepos[caja]:=cantDepos[caja]+1;
		writeln('Ingrese el nro de caja: ');
		readln(caja);
		while caja<>0 do 
		begin
			writeln('Ingrese el dinero a depositar: ');
			readln(ingreso);
			c[caja]:=c[caja]+ingreso;
			cantDepos[caja]:=cantDepos[caja]+1;
			writeln('Ingrese el nro de caja: ');
			readln(caja);
		end;
	end;
	max(c,maxCaja,maxDinero);
	writeln('la caja con mas dinero es: ', maxCaja);
	promedios(c,cantDepos);
end.