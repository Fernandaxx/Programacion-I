program ej6;
const
	sucursales=7;
	meses=12;
type
	mes=record
		vendidas:integer;
		facturado:real;
		defectuosas:integer;
		devuelto:real;
		end;
procedure leerMes(var m:mes; i,j:integer);
begin
	writeln('Ingrese las vendidas en el mes ',i,' sucursal ',j);
	readln(m.vendidas);
	writeln('Ingrese lo facurado en el mes ',i,' sucursal ',j);
	readln(m.facturado);
	writeln('Ingrese las defectuosas en el mes ',i,' sucursal ',j);
	readln(m.defectuosas);
	writeln('Ingrese lo devuelto en el mes ',i,' sucursal ',j);
	readln(m.devuelto);	
end;
procedure menorGanancia(var min:real; j:integer; ganancia:real; var smin:integer);
begin
	if ganancia<min then
	begin
		min:=ganancia;
		smin:=j;
	end;
end;
procedure mayorMes(m:mes; i:integer; var maxganancia:real; var maxmes:integer);
var gananciames:real;
begin
	gananciames:=m.facturado-m.devuelto;
	if gananciames>maxganancia then
	begin
		maxganancia:=gananciames;
		maxmes:=i;
	end;
end;
var
	m:mes;
	i,j,smin,maxmes:integer;
	ganancia,min,maxganancia,marzo:real;
begin
	marzo:=0;
	maxganancia:=-1;
	min:=9999;
	for j:=1 to sucursales do
	begin
		ganancia:=0;
		for i:=1 to meses do
		begin
			leerMes(m,i,j);
			ganancia:=ganancia+m.facturado-m.devuelto;
			mayorMes(m,i,maxganancia,maxmes);
			if i=3 then marzo:=marzo+m.facturado-m.devuelto;
		end;
		writeln('El mes con mas ganancias de la sucursal ',j,' fue ',maxmes);
		menorGanancia(min,j,ganancia,smin);
	end;
	writeln('La sucursal con la menor ganancia es: ', smin);
	writeln('La recaudacion promedio en el mes de marzo de todas las sucursales fue de $', (marzo/sucursales):2:2);
end.

		
