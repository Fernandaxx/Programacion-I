program ej_1;
var
	numero,digito,procesados:integer;
begin
	procesados:=0;
	repeat
		readln(numero);
		while numero<>0 do
		begin
			digito:=numero mod 10;
			if digito mod 2 = 0 then 
				writeln(digito);
			numero:=numero div 10;
		end;
		procesados:=procesados+1;
	until(procesados>100);
end.
