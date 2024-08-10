program ej7_aa;
procedure promediopesos(cant:integer;var promedio:real);
var
	peso,total:real;
	i:integer;
begin
	total:=0;
	for i:=1 to cant do begin
		writeln('Introduzca el peso de la persona ', i);
		peso:=0;
		read(peso);
		total:=total+peso;
	end;
	promedio:=total/cant;
end;
var
	personas:integer;
	promedio:real;
begin
	writeln('Introduzca la cantidad de personas a promediar: ');
	read(personas);
	promediopesos(personas,promedio);
	writeln('El promedio es: ', promedio:2:2);S
end.
