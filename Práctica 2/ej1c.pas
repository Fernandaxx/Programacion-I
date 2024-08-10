program ej_1;
var
	numero,digito,i:integer;
begin
	for i:=1 to 80 do
	begin
		read(numero);
		while(numero<>0) do
		begin
			digito:=numero mod 10;
			if (digito mod 2 = 0) then
				begin
				writeln(digito);
				end;
			numero:=numero div 10;
		end;
	end;
end.

