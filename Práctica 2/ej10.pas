program ej10;
var
	car,pri,seg:char;
	cont,palabras,pa,sa:integer;
begin
	palabras:=0;
	pa:=0;
	sa:=0;
	read(car);
	while(car<>'#')do
	begin
		cont:=0;
		while(car<>'#') and (car=' ')do
			read(car);
		pri:=car;
		read(car);
		seg:=car;
		cont:=(cont+1);
		if (pri='p')and(seg='a') then pa:=pa+1;
		while(car<>'#') and (car<>' ')do
		begin
			seg:=pri;
			pri:=car;
			cont:=cont+1;
			read(car);
		end;
		if (seg='s') and (pri='a') then sa:=sa+1;
		if cont=6 then palabras:=palabras+1;
		while(car<>'#') and (car=' ')do
			read(car);
	end;
	writeln('Hay' , palabras, 'palabras que tienen 6 caracteres');
	writeln(pa, 'palabras empiezan con pa');
	writeln(sa, 'palabras terminan con sa');
end.
