program ej3;
function max4(a,b,c,d:integer):integer;
	function max(a,b:integer):integer;
	begin
		max:=-9999;
		if a>max then max:=a;
		if b>max then max:=b;
	end;
begin
	max4:=-9999;
	max4:=max(a,b);
	if max(c,d)>max4 then max4:=max(c,d);
end;
var
	num1,num2,num3,num4:integer;
begin
	readln(num1);
	readln(num2);
	readln(num3);
	readln(num4);
	writeln('El numero mayor es: ', max4(num1,num2,num3,num4));
end.
