program ej5_a;
function invertir(num,digitos:integer):integer;
var i,dig:integer;
begin
	invertir:=0;
	for i:=1 to digitos do
	begin
		dig:=num mod 10;
		invertir:=(invertir*10)+dig;
		num:=num div 10;
	end;
end;

var n,digitos:integer;
begin
	read(n);
	read(digitos);
	writeln(invertir(n,digitos));
end.
