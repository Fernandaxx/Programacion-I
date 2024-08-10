program ej2_b_a;
function factorial(n:integer):integer;
var
	i:integer;
begin
	factorial:=n;
	for i:=1 to n-1 do factorial:=factorial*(n-i);
end;
var num:integer;
begin
	read(num);
	writeln(factorial(num));
end.
