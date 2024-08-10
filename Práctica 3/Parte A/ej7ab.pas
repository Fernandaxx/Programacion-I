program ej7_ab;
function promedio(cant:integer):real;
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
const
	PERSONAS=25;
begin
	writeln(promedio(PERSONAS):2:2);
end.
