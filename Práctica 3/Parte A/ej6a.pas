program ej6_a;
procedure conteo(var car:char;var cinco:integer);
var
	cont,palabras:integer;
begin
	palabras:=0;
	while car<>'*' do begin
		cont:=0;
		while (car=' ') and (car<>'*') do 
		  read(car);
		while (car<>' ') and (car<>'*')do 
		begin
			cont:=cont+1;
			read(car);
		end;
		if (cont=5) then palabras:=palabras+1;
	end;
	cinco:=palabras;
end;

var
	c:char;
	cinco:integer;
begin
	read(c);
	conteo(c,cinco);
	writeln(cinco);
end.
