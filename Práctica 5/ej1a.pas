program ej5_a;
type
	palabra=string[7];
	transporte=record
		linea:integer;
		patente:palabra;
		monto:real;
	end;

procedure leerTransporte(var t:transporte);
begin
	writeln('Ingrese el numero de linea: ');
	readln(t.linea);
	if t.linea<>0 then
	begin
	writeln('Ingrese la patente del vehiculo: ');
	readln(t.patente);
	writeln('Ingrese el monto total recaudado: ');
	readln(t.monto);
	end;
end;
var
	lineaActual:integer;
	t:transporte;
	total:real;
begin
	leerTransporte(t);
	while (t.linea<>0) do
	begin
		total:=0;
		lineaActual:=t.linea;
		while (t.linea=lineaActual) do
		begin
			total:=total+t.monto;
			leerTransporte(t);
		end;
		writeln('El monto total recaudado por la linea ',lineaActual,' fue de $', total:2:2);
	end;
end.
