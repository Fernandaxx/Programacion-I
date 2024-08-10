program ej5_b_b;
type
	Tletras=set of char;
procedure contabiliza(var cantVoc,cantCon:integer; var c:char);
var
	consonantes,vocales,abc:Tletras;
begin
	cantVoc:=0;
	cantCon:=0;
	abc:=['a'..'z'];
	vocales:=['a','e','i','o','u'];
	consonantes:=abc-vocales;
	while (c<>' ') and (c<>'*') do begin
		if (c in vocales)then cantVoc:=cantVoc+1
		else if (c in consonantes)then cantCon:=cantCon+1;
		read(c);
	end;
end;
var
	voc,con,palabras,maxVoc,maxCon,vmax,cmax:integer;
	secuencia:char;
begin
	voc:=0;
	con:=0;
	maxVoc:=-1;
	maxCon:=-1;
	palabras:=0;
	read(secuencia);
	while (secuencia<>'*') do begin
		while secuencia=' ' do read(secuencia);
		palabras:=palabras+1;
		contabiliza(voc,con,secuencia);
		if voc>maxVoc then begin 
			maxVoc:=voc;
			vmax:=palabras;
		end;
		if con>maxCon then begin
			maxCon:=con;
			cmax:=palabras;
		end;
	end;
	writeln('La palabra con mas vocales es: ',vmax);
	writeln('La palabra con mas consonantes es: ',cmax);
end.
