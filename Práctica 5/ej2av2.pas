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

procedure mayores(var maxDepto1,maxDepto2,maxSucursal1,maxSucursal2:integer; var maxSueldo1,maxSueldo2:real; totalSueldosDepto:real; deptoActual,sucursalActual:integer);
begin
	if totalSueldosDepto>maxSueldo1 then
	begin
		maxSueldo2:=maxSueldo1;
		maxSueldo1:=totalSueldosDepto;
		maxDepto2:=maxDepto1;
		maxDepto1:=deptoActual;
		maxSucursal2:=maxSucursal1;
		maxSucursal1:=sucursalActual;
	end
	
	else if totalSueldosDepto>maxSueldo2 then
	begin
		maxSueldo2:=totalSueldosDepto;
		maxDepto2:=deptoActual;
		maxSucursal2:=sucursalActual;
	end;
	
end;

var
	e:empleado;
	totalSueldos,totalSueldosDepto,maxSueldo1,maxSueldo2:real;
	deptoActual,sucursalActual,maxDepto1,maxDepto2,maxSucursal1,maxSucursal2:integer;
begin
	maxDepto1:=-1;
	maxSucursal1:=-1;
	maxSueldo1:=-1;
	maxSueldo2:=-1;
	leerEmpleado(e);
	while e.sucursal<>-1 do 
	begin
		totalSueldos:=0;
		sucursalActual:=e.sucursal;
		while e.sucursal=sucursalActual do
		begin
			totalSueldosDepto:=0;
			deptoActual:=e.depto;
			while (e.depto=deptoActual)and(e.sucursal=sucursalActual) do
			begin
				totalSueldos:=totalSueldos+e.sueldo;
				totalSueldosDepto:=totalSueldosDepto+e.sueldo;
				leerEmpleado(e);
			end;
			mayores(maxDepto1,maxDepto2,maxSucursal1,maxSucursal2,maxSueldo1,maxSueldo2,totalSueldosDepto,deptoActual,sucursalActual);
		end;
		writeln('La suma de todos los sueldos de la sucursal ',sucursalActual,' es $',totalSueldos:2:2);
	end;
	writeln('El departamento con mayor monto de sueldos es el ',maxDepto1,' de la sucursal ',maxSucursal1);
	writeln('El departamento con el segundo mayor monto de sueldos es el ',maxDepto2,' de la sucursal ',maxSucursal2);
end.
