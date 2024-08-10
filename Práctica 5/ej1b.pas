program ej5_b;
type
	nombres=string[25];
	patentes=string[7];
	transporte=record
		empresa:nombres;
		linea:integer;
		patente:patentes;
		monto:real;
	end;

procedure leerTransporte(var t:transporte);
begin
	writeln('Ingrese el nombre de la empresa: ');
	readln(t.empresa);
	if t.empresa <> 'FIN' then
	begin
	writeln('Ingrese el numero de linea: ');
	readln(t.linea);
	writeln('Ingrese la patente del vehiculo: ');
	readln(t.patente);
	writeln('Ingrese el monto total recaudado: ');
	readln(t.monto);
	end;
end;
var
	lineaActual:integer;
	empresaActual:nombres;
	t:transporte;
	totalLinea,totalEmpresa:real;
begin
	leerTransporte(t);
	while t.empresa<>'FIN' do
	begin
		totalEmpresa:=0;
		empresaActual:=t.empresa;
		while t.empresa=empresaActual do
		begin
			totalLinea:=0;
			lineaActual:=t.linea;
			while (t.linea=lineaActual)and(t.empresa=empresaActual) do
			begin
				totalLinea:=totalLinea+t.monto;
				totalEmpresa:=totalEmpresa+totalLinea;
				leerTransporte(t);
			end;
			writeln('La linea ',lineaActual,' recaudo $',totalLinea:2:2);
		end;
		writeln('La empresa ',empresaActual,' recuado $',totalEmpresa:2:2);
	end;
end.
