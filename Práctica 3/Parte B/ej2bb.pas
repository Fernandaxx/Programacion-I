program ej2_b_b;
function factorial(n:integer):integer;
var
	i:integer;
begin
	factorial:=n;
	for i:=1 to n-1 do factorial:=factorial*(n-i);
end;
function combinatorio(m,n:integer):real;
begin
	combinatorio:=(factorial(m))/(factorial(m-n)*factorial(n));
end;
var num1,num2:integer;
begin
	read(num1);
	read(num2);
	writeln(combinatorio(num1,num2):2:2);
end.

