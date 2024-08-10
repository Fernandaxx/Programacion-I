program ej1;
type
	prisma=record
			h,w,l:real;
			end;
procedure leerRegistro(var p:prisma);
begin
	with p do
	begin
		writeln('Ingrese la altura del prisma: ');
		read(h);
		writeln('Ingrese la anchura del prisma: ');
		read(w);
		writeln('Ingrese la profundidad del prisma: ');
		read(l);
	end;
end;
function volumen(p:prisma):real;
begin
	volumen:=p.h*p.w*p.l;
end;
function area(p:prisma):real;
begin
	area:=2*p.w*p.h+2*p.w*p.l+2*p.h*p.l;
end;
var
	p:prisma;
begin
	leerRegistro(p);
	writeln('El volumen es; ',volumen(p):2:2);
	writeln('El area es: ',area(p):2:2);
end.
