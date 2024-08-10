program ej1_b_b;
function potencia(i,n:integer):integer;
var j:integer;
begin
	potencia:=i;
	for j:=2 to n do potencia:=potencia*i;
end;
var
	base,exponente:integer;
begin
	read(base);
	writeln(potencia(base,2));
	writeln(potencia(base,3));
	read(exponente);
	writeln(potencia(2,exponente));
end.

