program ej4_b_a;
type
	Tletras=set of char;
procedure imprime(conjuntoFinal:Tletras);
var
	i:char;
begin
	for i:='a' to 'z' do begin
		if (i in conjuntoFinal) then writeln(i);
	end;
end;
procedure contabiliza(var letras:Tletras);
var
	secuencia:char;
begin
	read(secuencia);
	while secuencia<>'#' do begin
		if(secuencia in letras) then letras:=letras-[secuencia];
		read(secuencia);
	end;
	imprime(letras);
end;
var
	abc:Tletras;
begin
	abc:=['a'..'z'];
	contabiliza(abc);
end.
