program ej_8;
var
	i,alumno,aprobadas,nota,maxnotaobtenida,alumnomaxpromedio,sumanotas:integer;
	maxpromedio,promedio:real;
begin
	maxpromedio:=0;
	repeat
		writeln('Ingrese el nro de alumno: ');
		read(alumno);
		writeln('Ingrese el nro de materias aprobadas');
		read(aprobadas);
		sumanotas:=0;
		maxnotaobtenida:=0;
		for i:=1 to aprobadas do
		begin
			writeln('Ingrese la nota obtenida en la materia ', i);
			read(nota);
			sumanotas:=sumanotas+nota;
			if (nota>maxnotaobtenida) then
				maxnotaobtenida:=nota;	
		end;
		write('La nota mas alta del alumno fue: ', maxnotaobtenida);
		promedio:=sumanotas/aprobadas;
		if promedio>maxpromedio then
			begin
				maxpromedio:=promedio;
				alumnomaxpromedio:=alumno;
			end;
	until(alumno=756);
	write('El maximo promedio en la carrera lo obtuvo el alumno nro: ', alumnomaxpromedio);
end.
