program ej_2;
var
	numero,digito,suma,max1,max2:integer;
begin
	read(numero);
	while(numero<>9999)do
	begin
		max1:=0;
		max2:=0;
		suma:=0;
		while (numero<>0)do
		begin
			digito:=numero mod 10;
			suma:=suma+digito;
			if digito>max1 then
			begin
				max2:=max1;
				max1:=digito;
			end
			else if digito>max2 then
				max2:=digito;
			numero:=numero div 10;
		end;
		writeln('La suma de todos los digitos da: ', suma);
		writeln('El digito mayor es: ', max1);
		writeln('El segundo digito mayor es: ', max2);
		read(numero);
	end;
end.
