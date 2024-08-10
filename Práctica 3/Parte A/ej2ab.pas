program ej2_ab;
function resto(dividendo,divisor:integer):integer;
var
	cociente:integer;
begin
	cociente:=dividendo div divisor;
	resto:=dividendo-(cociente*divisor);
end;
function espar(a:integer):boolean;
begin
	if resto(a,2) = 0 then espar:=true
	else espar:=false;
end;
var
	num:integer;
begin
	writeln('Ingrese un numero entero');
	readln(num);
	write(espar(num));
end.
