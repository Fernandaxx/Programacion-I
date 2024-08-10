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
function diferencia(t1,t2:tiempo):integer;
begin
	diferencia:=t2.h*60+t2.m-(t1.h*60+t1.m);
end;
var
	t1,t2:tiempo;
begin
	leerRegistro(t1);
	leerRegistro(t2);
	writeln('El tiempo transcurrido fue de ',diferencia(t1,t2)div 60,' hora/s con ',diferencia(t1,t2)mod 60,' minuto/s.');
end.
