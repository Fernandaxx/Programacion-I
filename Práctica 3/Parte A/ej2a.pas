program ej2_aa;
function resto(dividendo,divisor:integer):integer;
var
	cociente:integer;
begin
	cociente:=dividendo div divisor;
	resto:=dividendo-(cociente*divisor);
end;
var
	a,b:integer;
begin
	writeln('Ingrese el nro a dividir: ');
	readln(a);
	writeln('Ingrese por cuanto desea dividirlo: ');
	readln(b);
	writeln('El resto de dividir ', a, ' por ', b, ' es ', resto(a,b));
end.
