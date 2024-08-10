program ej_5;
var
	cant,a,sa:integer;
	car,ant:char;
begin
	sa:=0;
	a:=0;
	cant:=0;
	read(car);
	while(car<>'.')do
	begin
		if car='A' then a:=a+1;
		cant:=cant+1;
		ant:=car;
		read(car);
		if (ant='s')and(car='a')then sa:=sa+1;
	end;
	write('La cantidad de caracteres ingresados fue: ', cant);
	write('La cantidad de letras A fue: ', a);
	write('La cantidad de s seguidas de a fue: ', sa);
end.
