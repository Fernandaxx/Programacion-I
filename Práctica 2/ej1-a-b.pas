program ej_1;
var
	numero,digito,max:integer;
begin
	max:=0;
	read(numero);
	while(numero<>0) do
	begin
		digito:=numero mod 10;
		if (digito mod 3 = 0) then
			begin
			if digito>max then 
				max:=digito;
			writeln(digito);
			end;
		numero:=numero div 10;
	end;
	writeln('El digito mas grande es: ', max);
end.
