program ej2c;
type
	horas=0..23;
	minutos=0..59;
	tiempo=record
              h:horas;
			  m:minutos;
		   end;
procedure leerRegistro(var t:tiempo);
begin
	readln(t.h);
	readln(t.m);
end;
function menor(t1,t2:tiempo):integer;
var
	tm1,tm2:integer;
begin
	tm1:=t1.h*60+t1.m;
	tm2:=t2.h*60+t2.m;
	if tm1<tm2 then menor:=tm1
	else menor:=tm2;
end;
var
	t1,t2:tiempo;
begin
	leerRegistro(t1);
	leerRegistro(t2);
	writeln('El menor tiempo es ',menor(t1,t2) div 60, ' hora/s con ', menor(t1,t2)mod 60, ' minuto(s.');
end.
