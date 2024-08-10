program ej5_b_a;
type
	Tletras=set of char;
procedure contabiliza(var cantVoc,cantCon:integer);
var
	consonantes,vocales,abc:Tletras;
	c:char;
begin
	abc:=['a'..'z'];
	vocales:=['a','e','i','o','u'];
	consonantes:=abc-vocales;
	read(c);
	while (c<>' ') and (c<>'*') do begin
		if (c in vocales)then cantVoc:=cantVoc+1
		else if (c in consonantes)then cantCon:=cantCon+1;
		read(c);
	end;
end;
var
	voc,con:integer;
begin
	voc:=0;
	con:=0;
	contabiliza(voc,con);
	writeln(voc);
	writeln(con);
end.
