program ej2ab;
type
	horas=0..23;
	minutos=0..59;
	tiempo=record
		h:horas;
		m:minutos;
	end;
procedure leerRegistro(var t:tiempo);
begin
	with t do
	begin
		writeln('Ingrese la hora');
		read(h);
		writeln('Ingrese los minutos');
		read(m);
	end;
end;
procedure diferencia(t1,t2:tiempo; var dh:horas;var dm:minutos);
begin
	dh:=t2.h-t1.h;
	dm:=t2.m-t1.m;
end;
var
	t1,t2:tiempo;
	dh:horas;
	dm:minutos;
begin
	leerRegistro(t1);
	leerRegistro(t2);
	diferencia(t1,t2,dh,dm);
	writeln('El tiempo transcurrido fue de ',dh,'horas ','y ',dm,'minutos.');
end.
