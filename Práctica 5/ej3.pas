program ej3;
type
	palabra=string[30];
	pais=record
		nombre:palabra;
		provincia:palabra;
		ciudad:palabra;
		habitantes:integer;
		dinero:real;
	end;
procedure leerPais(var p:pais);
begin
	writeln('Ingrese el nombre del pais');
	readln(p.nombre);
	if (p.nombre<>'zzz')then
	begin
	writeln('Ingrese la provincia');
	readln(p.provincia);
	writeln('Ingrese la ciudad');
	readln(p.ciudad);
	writeln('Ingrese la cantidad de habitantes');
	readln(p.habitantes);
	writeln('Ingrese el dinero recaudado en dicha ciudad');
	readln(p.dinero);
	end;
end;
function pbi(dinero:real; habitantes:integer):real;
begin
	if habitantes>0 then pbi:=dinero/habitantes;
end;
var
	p:pais;
	paisActual,provinciaActual:palabra;
	hProvincia,hPais:integer;
	dineroProvincia,dineroPais:real;
begin
	leerPais(p);
	while (p.nombre<>'zzz')do
	begin
		paisActual:=p.nombre;
		hPais:=0;
		dineroPais:=0;	
		while(p.nombre=paisActual)do
		begin
			provinciaActual:=p.provincia;
			hProvincia:=0;
			dineroProvincia:=0;
			while(p.provincia=provinciaActual)and(p.nombre=paisActual)do
			begin
				hProvincia:=hProvincia+p.habitantes;
				dineroProvincia:=dineroProvincia+p.dinero;
				writeln('El pbi de la ciudad ',p.ciudad,' es $', pbi(p.dinero,p.habitantes):2:2);
				leerPais(p);
			end;
			writeln('El pbi de la provincia ',provinciaActual,' es $',pbi(dineroProvincia,hProvincia):2:2);
			hPais:=hPais+hProvincia;
			dineroPais:=dineroPais+dineroProvincia;
		end;
		writeln('El pbi del pais ',paisActual,' es $',pbi(dineroPais,hPais):2:2);
	end;
end.
