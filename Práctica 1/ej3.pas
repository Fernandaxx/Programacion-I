program ej_3;
var
	i,j,total,alumnos,codigo,anos,codigomenor:integer;
	promedio,promediomenor:real;
begin
	promediomenor:=9999;
	for i:=1 to 10 do
	begin
		total:=0;
		write('Ingrese el codigo de la carrera: ');
		read(codigo);
		write('Ingrese los años de duracion: ');
		read(anos);
		for j:=1 to anos do
		begin
			write('Ingrese la cantidad de alumnos en el, ',j, 'ano');
			read(alumnos);
			total:=total+alumnos;
		end;
		promedio:=total/anos;
		if promedio<promediomenor then
		begin
			promediomenor:=promedio;
			codigomenor:=codigo;
		end;
	end;
	write('La carrera con menor promedio de alumnos es: ', codigomenor);
end.
