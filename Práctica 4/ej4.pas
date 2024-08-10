program ej4;
type
	pal=string[10];
	producto=record
				tipo:pal;
				codigo:integer;
				cantidad:integer;
				precio:integer;
			end;
procedure mayores(var maxcant1,maxcant2,maxcod1,maxcod2:integer; p:producto);
begin
	if p.cantidad>maxcant1 then 
		begin
			maxcant2:=maxcant1;
			maxcant1:=p.cantidad;
			maxcod2:=maxcod1;
			maxcod1:=p.codigo;
		end
		else
		if p.cantidad>maxcant2 then
		begin
			maxcant2:=p.cantidad;
			maxcod2:=p.codigo;
		end;
end;
procedure leerProducto(var p:producto);
begin
	writeln('Ingrese el codigo de producto: ');
	readln(p.codigo);
	if p.codigo<>9999 then
	begin
	writeln('Ingrese el tipo de producto (alfajor/mermelada): ');
	readln(p.tipo);
	writeln('Ingrese la cantidad del producto: ');
	readln(p.cantidad);
	writeln('Ingrese el precio del producto: ');
	readln(p.precio);
	end;
end;
var
	p:producto;
	cantAlf,sumaunidades,maxcant1,maxcant2,maxcod1,maxcod2:integer;
	sumaprecios:real;
begin
	maxcant1:=-1;
	maxcant2:=-1;
	maxcod1:=-1;
	maxcod2:=-1;
	sumaunidades:=0;
	sumaprecios:=0;
	cantAlf:=0;
	leerProducto(p);
	while p.codigo<>9999 do
	begin
		if p.tipo='alfajor' then cantAlf:=cantAlf+p.cantidad
		else 
			if p.tipo='mermelada' then
			begin
				sumaunidades:=sumaunidades+p.cantidad;
				sumaprecios:=sumaprecios+p.precio;
			end;
		mayores(maxcant1,maxcant2,maxcod1,maxcod2,p);
		leerProducto(p);
	end;
	writeln('La cantidad de alfajores es: ',cantAlf);
	writeln('El promedio de precio de las mermeladas es $', (sumaprecios/sumaunidades):2:2);
	writeln('El primer producto con mayor produccion fue: ',maxcod1);
	writeln('El segundo producto con mayor produccion fue: ',maxcod2);
end.
