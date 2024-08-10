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

var n:integer;
begin
	read(n);
	writeln(invertir(n,3));
	writeln(invertir(n,5));
end.

