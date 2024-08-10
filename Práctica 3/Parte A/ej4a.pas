program ej4_a;
function invertir(num:integer):integer;
var dig:integer;
begin
	invertir:=0;
	while (num<>0)do
	begin
		dig:=num mod 10;
		invertir:=(invertir*10)+dig;
		num:=num div 10;
	end;
end;
var
	n:integer;
begin
	read(n);
	if n=invertir(n) then writeln('El nro es capicua')
	else writeln('El nro no es capicua');
end.
