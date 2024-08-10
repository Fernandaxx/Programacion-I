program ej3;

type
	oficinas=1..15;
	oficina=record
		numero:oficinas;
		metros:real;
		habitaciones:integer;
		horas:integer;
		precio:real;
	end;
	
procedure leerOficina(var o:oficina);
begin
	writeln('Ingrese el nro de oficina: ');
	readln(o.numero);
	writeln('Ingrese los metros cuadrados de la oficina: ');
	readln(o.metros);
	writeln('Ingrese las habitaciones de la oficina: ');
	readln(o.habitaciones);
	writeln('Ingrese las horas que fue alquilada la oficina: ');
	readln(o.horas);
	writeln('Ingrese el precio por hora de la oficina: ');
	readln(o.precio);	
end;

procedure menorHora(horas:integer; numero:oficinas; var min:integer; var offmin:oficinas);
begin
	if horas<min then
	begin
		min:=horas;
		offmin:=numero;
	end;
end;

function totalRecaudado(precio:real; horas:integer):real;
begin
	totalRecaudado:=precio*horas;
end;
procedure retornaMenor(var offmin:oficinas; var total:real);
var i:integer;
	min:integer;
	o:oficina;
begin
	total:=0;
	min:=9999;
	for i:=1 to 3 do
	begin
		leerOficina(o);
		menorHora(o.horas,o.numero,min,offmin);
		total:=total+totalRecaudado(o.precio,o.horas);
	end;
end;
var
	menosalquilada:oficinas;
	total:real;
begin
	retornaMenor(menosAlquilada,total);
	writeln('La oficina que menos horas se alquilo fue: ',menosAlquilada);
	writeln('El total recaudado fue de $',total:2:2);
end.

