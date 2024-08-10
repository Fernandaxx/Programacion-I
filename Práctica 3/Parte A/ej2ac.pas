program ej2_ac;
function resto(dividendo,divisor:integer):integer;
var
	cociente:integer;
begin
	cociente:=dividendo div divisor;
	resto:=dividendo-(cociente*divisor);
end;
function esimpar(a:integer):boolean;
begin
	if resto(a,2) <> 0 then esimpar:=true
	else esimpar:=false;
end;
var
	num:integer;
begin
	writeln('Ingrese un numero entero');
	readln(num);
	write(esimpar(num));
end.
