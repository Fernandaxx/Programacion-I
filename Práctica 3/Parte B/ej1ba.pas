program ej1_b_a;
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
	read(exponente);
	writeln(potencia(base,exponente));
end.
