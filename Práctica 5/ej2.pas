program ej2;
type	
	cadena8=string[8];
	empleado=record
		dni:cadena8;
		sueldo:real;
		depto:integer;
		sucursal:integer;
	end;
procedure leerEmpleado(var e:empleado);
begin
	writeln('Ingrese la sucursal del empleado');
	readln(e.sucursal);
	if e.sucursal<>-1 then
	begin
	writeln('Ingrese el depto del empleado');
	readln(e.depto);
	writeln('Ingrese el sueldo del empleado');
	readln(e.sueldo);
	writeln('Ingrese el dni del empleado');
	readln(e.dni);
	end;
end;
procedure mayores(e:empleado; var maxDepto1,maxDepto2,maxSucursal1,maxSucursal2:integer; var maxSueldo1,maxSueldo2:real);
begin
	if e.sueldo>maxSueldo1 then
	begin
		maxSueldo2:=maxSueldo1;
		maxSueldo1:=e.sueldo;
		maxDepto2:=maxDepto1;
		maxDepto1:=e.depto;
		maxSucursal2:=maxSucursal1;
		maxSucursal1:=e.sucursal;
	end
	else if e.sueldo>maxSueldo2 then
	begin
		maxSueldo2:=e.sueldo;
		maxDepto2:=e.depto;
		maxSucursal2:=e.sucursal;
	end;
end;
var
	e:empleado;
	totalSueldos,maxSueldo1,maxSueldo2:real;
	deptoActual,sucursalActual,maxDepto1,maxDepto2,maxSucursal1,maxSucursal2:integer;
begin
	maxDepto1:=-1;
	maxSucursal1:=-1;
	maxSueldo1:=-1;
	maxSueldo2:=-1;
	leerEmpleado(e);
	while e.sucursal<>-1 do 
	begin
		sucursalActual:=e.sucursal;
		totalSueldos:=0;
		while e.sucursal=sucursalActual do
		begin
			deptoActual:=e.depto;
			while (e.depto=deptoActual)and(e.sucursal=sucursalActual) do
			begin
				totalSueldos:=totalSueldos+e.sueldo;
				mayores(e,maxDepto1,maxDepto2,maxSucursal1,maxSucursal2,maxSueldo1,maxSueldo2);
				leerEmpleado(e);
			end;
		end;
		writeln('La suma de todos los sueldos de la sucursal ',sucursalActual,' es $',totalSueldos:2:2);
	end;
	writeln('El empleado con mayor monto de sueldo trabaja en la sucursal ',maxSucursal1,' del departamento ',maxDepto1);
	writeln('El empleado con el segundo mayor monto de sueldo trabaja en la sucursal ',maxSucursal2,' del departamento ',maxDepto2);
end.
