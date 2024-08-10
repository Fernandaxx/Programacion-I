program ej_4;
var
	numero,digito:integer;
begin
	read(numero);
	while(numero<>0)do
	begin
		digito:=numero mod 10;
		write(digito);
		numero:=numero div 10;
	end;
end.
