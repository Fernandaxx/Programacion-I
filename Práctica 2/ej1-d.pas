program ej_1;
var
	numero,digito:integer;
begin
	readln(numero);
	while numero<>-1 do
	begin
		while numero<>0 do
		begin
			digito:=numero mod 10;
			if digito mod 2 = 0 then
				writeln(digito);
			numero:=numero div 10;
		end;
		readln(numero);
	end;
end.
