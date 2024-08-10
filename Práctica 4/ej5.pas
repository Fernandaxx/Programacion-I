program ej5;
type
	nombre=string[30];
	meses=1..12;
	dias=1..31;
	horas=0..23;
	minutos=0..59;
	fechas=record
		anio:integer;
		mes:meses;
		dia:dias;
	end;
	tiempo=record
		hora:horas;
		minuto:minutos;
	end;
	guardia=record
		paciente:nombre;
		medico:nombre;
		fecha:fechas;
		entrada:tiempo;
		salida:tiempo;
	end;
	
procedure leerEntrada(var e:tiempo);
begin
	readln(e.hora);
	readln(e.minuto);
end;

procedure leerSalida(var s:tiempo);
begin
	readln(s.hora);
	readln(s.minuto);
end;

procedure leerFecha(var f:fechas);
begin
	readln(f.anio);
	if f.anio<>0 then
	begin
		readln(f.mes);
		readln(f.dia);
	end;
end;

procedure leerGuardia(var g:guardia);
begin
	writeln('Ingrese la fecha de atencion (aaaa,mm,dd)');
	leerFecha(g.fecha);
	if g.fecha.anio<>0 then
	begin
	writeln('Ingrese el nombre del paciente');
	readln(g.paciente);
	writeln('Ingrese el nombre del medico');
	readln(g.medico);
	writeln('Ingrese la hora de entrada (hh/mm)');
	leerEntrada(g.entrada);
	writeln('Ingrese la hora de salida (hh/mm)');
	leerSalida(g.salida);
	end;
end;

function tiempoAtencion(e,s:tiempo):integer;
begin
	tiempoAtencion:=s.hora*60+s.minuto-(e.hora*60+e.minuto);
end;

procedure mayorTiempo(tiempo:integer; var tiempoMax:integer; var nombreMax:nombre; nPaciente:nombre);
begin
	if tiempo>tiempoMax then
	begin
		tiempoMax:=tiempo;
		nombreMax:=nPaciente;
	end;
end;

var
	g:guardia;
	nombreMax:nombre;
	tiempoMax,agosto:integer;
begin
	agosto:=0;
	tiempoMax:=-1;
	leerGuardia(g);
	while (g.fecha.anio<>0)do
	begin
		mayorTiempo(tiempoAtencion(g.entrada,g.salida),tiempoMax,nombreMax,g.paciente);
		if g.fecha.mes=8 then agosto:=agosto+1;
		leerGuardia(g);
	end;
	writeln('El paciente que mas tardo en ser atendido fue: ', nombreMax);
	writeln('En agosto asistieron ',agosto,' pacientes');
end.

		
