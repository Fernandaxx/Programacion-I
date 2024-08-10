program ej6;
var
	cod,ventas,precio,maxventas,maxrecaudacion,ventascod,recaudocod,recaudacion:integer;
begin
	maxventas:=0;
	maxrecaudacion:=0;
	write('Ingrese el codigo del producto: ');
	read(cod);
	while (cod<>0) do
	begin
		write('Ingrese la cantidad de ventas: ');
		read(ventas);
		write('Ingrese el precio del producto: ');
		read(precio);
		recaudacion:=ventas*precio;
		if recaudacion>maxrecaudacion then
			begin
				maxrecaudacion:=recaudacion;
				recaudocod:=cod;
			end;
		if ventas>maxventas then
			begin
				maxventas:=ventas;
				ventascod:=cod;
			end;
		write('Ingrese el codigo del producto: ');
		read(cod);
	end;
	write('El producto con mas ventas fue: ', ventascod);
	write('El producto con mas recaudacion fue: ', recaudocod);
end.
