program ej1_a;
function mayordigito(n:integer):integer;
var
	digito,max:integer;
begin
		max:=0;
		while n<>0 do begin
			digito:=n mod 10;
			if digito>max then 
			max:=digito;
			n:=n div 10;
		end;
		mayordigito:=max;
end;
var
	numero:integer;
begin
	read(numero);
	write(mayordigito(numero));
end.
