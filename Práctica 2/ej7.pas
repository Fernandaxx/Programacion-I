program ej_7;
var
	palabras,max,t:integer;
	car:char;
begin
	palabras:=0;
	max:=0;
	read(car);
	while (car=' ')do
		read(car);
	while (car<>'.')do
	begin
		palabras:=palabras+1;
		if (car='t')then
		begin
			t:=0;
			while(car<>' ')and(car<>'.')do
			begin
				t:=t+1;
				read(car);
			end;
			if (t>max) then max:=t;
		end;
		while(car<>' ')and(car<>'.') do
			read(car);
		while(car=' ')do read(car);
	end;
	writeln('La cantidad de palabras es: ', palabras);
	writeln('La longitud de la palabra mas larga que empieza con t es: ', max, 'letras.');
end.
