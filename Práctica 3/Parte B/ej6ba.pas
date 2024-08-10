program ej6_b_a;
type
	letras=set of char;
procedure A(var car:char; var conjuntofinal:letras; var parteA:boolean);
var
	abc:letras;
begin
	abc:=['A'..'Z'];
	while (car<>'@')do
	begin
		if not(car in abc) then parteA:=false;
		conjuntofinal:=conjuntofinal+[car];
		read(car);
	end;
end;

procedure B(var car:char; var conjuntofinal:letras; var parteB:boolean);
begin
	read(car);
	while car<>'.' do 
	begin
		if car in conjuntofinal then parteB:=false;
		read(car);
	end;
end;
var
	secuencia:char;
	conjuntofinal:letras;
	parteA,parteB:boolean;
begin
	conjuntofinal:=[];
	parteA:=True;
	parteB:=True;
	read(secuencia);
	A(secuencia,conjuntofinal,parteA);
	B(secuencia,conjuntofinal,parteB);
	if (parteA=True)and(parteB=true) then writeln('El patron se cumple correctamente')
	else 
	begin
		if parteA=false then writeln('La parte A no cumple con el patron');
		if parteB=false then writeln('La parte B no cumple con  el patron');
	end;
end.
