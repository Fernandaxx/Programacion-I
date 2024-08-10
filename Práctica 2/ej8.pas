program ej8;
var
	car,t,r,n:char;
	palabras,cont,x,tes,rn:integer;
begin
	palabras:=0;
	cont:=0;
	x:=0;
	tes:=0;
	rn:=0;
	repeat
		read(car);
		while(car=' ')do
		begin
			read(car);
			cont:=cont+1;
		end;
		if (car='R')then begin
		x:=x+1;
		r:='R';
		end;
		palabras:=palabras+1;
		cont:=cont+1;
		while(car<>' ')and(car<>'z')and(cont<50)do
		begin
			t:=car;
			n:=car;
			read(car);
			cont:=cont+1;
		end;
		if (t='T')and(car=' ') then tes:=tes+1;
		if (r='R')and(n='N')then rn:=rn+1;
		while(car=' ')and(cont<50)do
		begin
			read(car);
			cont:=cont+1;
		end;
		if (car='R')then begin
		x:=x+1;
		r:='R';
		end;
	until((car='z')or(cont=50));
	writeln('Hay', palabras, 'palabras');
	writeln('Hay', cont, 'caracteres');
	writeln(x,' palabras empiezan con R');
	writeln(tes, ' palabras terminan con T');
	writeln(rn, 'palabras empiezan con R y terminan con N');
end.

