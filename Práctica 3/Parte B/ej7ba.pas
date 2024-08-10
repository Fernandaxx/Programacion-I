program ej7_b_a;
type
	letras=set of char;
procedure V(var car:char; var parteV:boolean);
var
	prim,ult:char;
begin
	while (car<>'&')do
	begin
		while (car=' ')and(car<>'&')do read(car);
		prim:=car;
		while (car<>' ')and (car<>'&')do 
		begin
			ult:=car;
			read(car);
		end;
		if (prim<>'o')or(ult<>'n')then parteV:=false;
	end;
end;

procedure Q(var car:char; var parteQ:boolean);
var
	vocales:letras;
begin
	read(car);
	while car<>'%' do
	begin
		vocales:=['a','e','i','o','u'];
		while (car=' ')and (car<>'%') do read(car);
		while (car<>' ')and (car<>'%') do
		begin
			if (car in vocales)then vocales:=vocales-[car];
			read(car);
		end;
		if vocales<>[] then parteQ:=false;
	end;
end;

procedure W(var car:char; var parteW:boolean);
var
	longitud,eses:integer;
begin
	while (car<>'*')do
	begin
		longitud:=0;
		eses:=0;
		while (car=' ')and(car<>'*')do read(car);
		while (car<>' ')and (car<>'*')do
		begin
			longitud:=longitud+1;
			if car='s' then eses:=eses+1;
			read(car);
		end;
		if (longitud>5)and(eses<>3)then parteW:=false;
	end;
end;

var
	parteV,parteQ,parteW:boolean;
	secuencia:char;
begin
	parteV:=true;
	parteQ:=true;
	parteW:=true;
	read(secuencia);
	V(secuencia,parteV);
	if parteV=true then
	begin
		Q(secuencia,parteQ);
		if parteQ=true then
		begin
			W(secuencia,parteW);
			if parteW=true then writeln('El patron se cumple correctamente')
			else writeln('El patron se interrumpe en W');
		end
		else writeln('El patron se interrumpe en Q');
	end
	else writeln('El patron se interrumpe en V');
end.
