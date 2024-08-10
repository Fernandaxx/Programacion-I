program ej_9;
var
	car,pri,ult:char;
	cont,total,a:integer;
begin
	total:=0;
	read(car);
	while (car<>'*')and(car<>'.')do
	begin
		cont:=0;
		a:=0;
		while (car<>'*')and(car<>'.')and(car=' ')do
		begin
			read(car);
		end;
		pri:=car;
		while (car<>'*')and(car<>'.')and(car<>' ')do
		begin
			ult:=car;
			cont:=cont+1;
			if car='a' then a:=a+1;
			read(car);
		end;
		if (pri='s')and(ult='s')and(cont>=5)and(a=2)then total:=total+1;
		while (car<>'*')and(car<>'.')and(car=' ')do
		begin
			read(car);
		end;
	end;
	writeln('Hay', total, 'palabras que empiezan y terminan con s, tienen al menos 5 caracteres y contienen exactamente dos a');
end.
