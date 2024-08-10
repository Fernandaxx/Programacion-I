program ej8_aa;
function calculadora(op:char; a,b:integer):real;
begin
	case op of
	'+':calculadora:=a+b;
	'-':calculadora:=a-b;
	'*':calculadora:=a*b;
	'/':calculadora:=a/b;
	else calculadora:=-1;
	end;
end;

var
	op:char;
	num1,num2:integer;
	resultado:real;
begin
	read(op);
	read(num1);
	read(num2);
	resultado:=calculadora(op,num1,num2);
	writeln(resultado:2:2);
end.

