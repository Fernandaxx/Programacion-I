program ej7;
const
	paises=20;
	participantes=7;
type
	palabra=string[30];
	edades=15..99;
	platos=record
			nombre:palabra;
			temp:palabra;
			ingrediente:palabra;
	end;
	representante=record
					nombre:palabra;
					pais:palabra;
					plato:platos;
					sexo:palabra;
					edad:edades;
	end;
procedure leerPlato(var p:platos);
begin
	writeln('Ingrese el nombre del plato');
	readln(p.nombre);
	writeln('Ingrese la temperatura del plato');
	readln(p.temp);
	writeln('Ingrese el ingrediente principal del plato');
	readln(p.ingrediente);
end;		
procedure leerRepresentante(var r:representante);
begin
	writeln('Ingrese el nombre del representante ');
	readln(r.nombre);
	writeln('Ingrese el pais del representante ');
	readln(r.pais);
	leerPlato(r.plato);
end;
procedure parteA(r:representante; condA:integer; var paisA:palabra; var a:integer);
begin
	if condA>a then 
	begin
		a:=condA;
		paisA:=r.pais;
	end;
end;
var
	r:representante;
	i,j,condA,a,totaledades:integer;
	paisA:palabra;
begin
	totaledades:=0;
	a:=0;
	for i:=1 to paises do
	begin
		condA:=0;
		for j:=1 to participantes do
		begin
			leerRepresentante(r);
			totaledades:=totaledades+r.edad;
			if (r.sexo='femenino')and(r.plato.temp='frio') then condA:=condA+1;
			if (r.plato.temp='caliente')and(r.plato.ingrediente='pollo')then 
			begin
				writeln(r.nombre, 'de ', r.pais, ' presenta plato caliente con pollo como ingrediente principal');
			end;
		end;
		parteA(r,condA,paisA,a)
	end;
	writeln('El pais con mayor cantidad de representantes femeninos que presentan platos frios fue: ', paisA);
	writeln('La edad promedio de todos los participantes es: ', (totaledades/(paises*participantes)):2:2)
end.
