program ej_3;
var
	i,numero,digito,suma,suma2,suma3,ultimovalor:integer;
begin
	for i:=1 to 10 do
	begin
		suma:=0;
		read(numero);
		while(numero<>0) do
		begin
			digito:=numero mod 10;
			suma:=suma+digito;
			numero:=numero div 10;
		end;
		ultimovalor:=suma;
		writeln(suma);
		suma2:=0;
		if (suma>=10) then
			begin
				while(suma<>0) do
				begin
					digito:=suma mod 10;
					suma2:=suma2+digito;
					suma:=suma div 10;
				end;
				ultimovalor:=suma2;
				writeln(suma2);
			end;
		suma3:=0;	
		if (suma2>=10) then
		begin
			while(suma2<>0)do
			begin
				digito:=suma2 mod 10;
				suma3:=suma3+digito;
				suma2:=suma2 div 10;
			end;
			ultimovalor:=suma3;
			writeln(suma3);
		end;
		case ultimovalor of
			0:write('Cero');
			1:write('Uno');
			2:write('Dos');
			3:write('Tres');
			4:write('Cuatro');
			5:write('Cinco');
			6:write('Seis');
			7:write('Siete');
			8:write('Ocho');
			9:write('Nueve');
		end;
	end;
end.
