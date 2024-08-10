program ejv2;
var
	car,ult,prim:char;
	pes,p6,letras,palabras,cont,x,tes,rn:integer;
begin
	palabras:=0;
	p6:=0;
	cont:=0;
	x:=0;
	tes:=0;
	rn:=0;
	repeat
		pes:=0;
		letras:=0;
		read(car);
		while car=' ' do begin
			read(car);
			cont:=cont+1;
		end;
		if (car='r') then begin
			x:=x+1;
			prim:='r';
		end;
		palabras:=palabras+1;
		cont:=cont+1;
		letras:=letras+1;
		while(car<>' ')and(car<>'z')and(cont<500) do
		begin
			if car='p' then pes:=pes+1;
			ult:=car;
			letras:=letras+1;
			read(car);
			cont:=cont+1;
		end;
		if (ult='t') then tes:=tes+1;
		if (prim='r') and (ult='n') then rn:=rn+1;
		if (letras<6) and (pes=2) then p6:=p6+1;
	until((car='z')or(cont=500));
	writeln('caracteres: ', cont);
	writeln('empiezan con r: ', x);
	writeln('terminan con t: ', tes);
	writeln('empiezan con r y terminan con n: ', rn);
	writeln('tienen menos de 6 caracteres y dos pes: ', p6);
end.
