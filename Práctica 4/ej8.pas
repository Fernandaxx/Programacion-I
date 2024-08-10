program ej8;
type
	palabra=string[30];
	puntos=0..100;
	examen=record
			nombre:palabra;
			continente:palabra;
			puntaje:puntos;
		end;
procedure leerExamen(var e:examen);
begin
	writeln('Ingrese el nombre del participante: ');
	readln(e.nombre);
	if (e.nombre <> 'zzz')then
	begin
	writeln('Ingrese el continente del participante (asia/america/europa): ');
	readln(e.continente);
	writeln('Ingrese el puntaje del participante: ');
	readln(e.puntaje);
	end;
end;
procedure mayorCalif(e:examen; var max:integer; var nombremax:palabra);
begin
	if e.puntaje>max then
	begin
		max:=e.puntaje;
		nombremax:=e.nombre;
	end;
end;
procedure cantidades (e:examen; var asia70,asia90,eur70,eur90,am70,am90:integer);
begin
	case e.continente of
	'asia':if e.puntaje>=90 then asia90:=asia90+1
			else if e.puntaje>=70 then asia70:=asia70+1;
	'europa':if e.puntaje>=90 then eur90:=eur90+1
			else if e.puntaje>=70 then eur70:=eur70+1;
	'america':if e.puntaje>=90 then am90:=am90+1
			else if e.puntaje>=70 then am70:=am70+1;
	end;
end;
var
	e:examen;
	max,asia70,asia90,eur70,eur90,am70,am90,sumaeuropa,notaseuropa:integer;
	nombremax:palabra;
begin
	sumaeuropa:=0;
	notaseuropa:=0;
	asia70:=0;
	asia90:=0;
	eur70:=0;
	eur90:=0;
	am70:=0;
	am90:=0;
	max:=-1;
	leerExamen(e);
	while (e.nombre<>'zzz')do
	begin
		mayorCalif(e,max,nombremax);
		cantidades(e,asia70,asia90,eur70,eur90,am70,am90);
		if e.continente='europa' then
		begin
		notaseuropa:=notaseuropa+e.puntaje;
		sumaeuropa:=sumaeuropa+1;
		end;
		leerExamen(e);
	end;
	writeln('El participante que obtuvo la mayor calificacion fue: ', nombremax);
	writeln('En asia ',asia70,' aprobaron con 70 puntos y ', asia90,' aprobaron con 90 puntos o mas');
	writeln('En europa ',eur70,' aprobaron con 70 puntos y ', eur90,' aprobaron con 90 puntos o mas');
	writeln('En america ',am70,' aprobaron con 70 puntos y ', am90,' aprobaron con 90 puntos o mas');
	writeln('El puntaje promedio de los europeos fue de: ', (notaseuropa/sumaeuropa):2:2);
end.
					
