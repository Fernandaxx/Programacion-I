program ej_6;
var
	car,ant:char;
	cant:integer;
begin
	cant:=0;
	read(car);
	while (car<>'.') do
	begin
		ant:=car;
		read(car);
		if ((ant='a')and(car='e'))or((ant='e')and(car='a')) then cant:=cant+1;
	end;
	write(cant);
end.
