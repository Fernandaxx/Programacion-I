program ej7;
var
	maxpaginas,minpaginas1,minpaginas2,i,paginas,codmin1,codmin2,codmax:integer;
begin
	maxpaginas:=0;
	minpaginas1:=9999;
	minpaginas2:=9999;
	codmin1:=0;
	for i:=1 to 5 do
	begin
		writeln('Ingrese el nro de paginas: ');
		read(paginas);
		if paginas<minpaginas1 then
			begin
				minpaginas2:=minpaginas1;
				minpaginas1:=paginas;
				codmin2:=codmin1;
				codmin1:=i;
			end
		else if paginas<minpaginas2 then
			begin
				minpaginas2:=paginas;
				codmin2:=i;
			end;
		if paginas>maxpaginas then
			begin
				maxpaginas:=paginas;
				codmax:=i;
			end;
	end;
	writeln('El primer libro con menor cantidad de paginas es: ', codmin1);
	writeln('El segundo libro con menor cantidad de paginas es: ', codmin2);
	writeln('El libro con mayor cantidad de paginas es ', codmax, 'con', maxpaginas, 'paginas');
end.
