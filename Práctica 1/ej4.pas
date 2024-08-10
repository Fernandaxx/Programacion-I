program ej_4;
var
	i,nieve,nievemin1,nievemin2,nievemax1,nievemax2,nievetotal,lmin1,lmin2,lmax1,lmax2,mascien:integer;
	promedio,porcentaje:real;
const
	localidades=10;
begin
	nievemin1:=9999;
	nievemin2:=9999;
	nievemax1:=0;
	nievemax2:=0;
	nievetotal:=0;
	lmin1:=0;
	lmin2:=0;
	lmax1:=0;
	lmax2:=0;
	mascien:=0;
	
	for i:=1 to localidades do 
	begin
		read(nieve);
		if nieve<nievemin1 then
			begin
				nievemin2:=nievemin1;
				nievemin1:=nieve;
				lmin2:=lmin1;
				lmin1:=i;
			end
		else if nieve<nievemin2 then
			begin
				nievemin2:=nieve;
				lmin2:=i;
			end;
		if nieve>nievemax1 then
			begin
				nievemax2:=nievemax1;
				nievemax1:=nieve;
				lmax2:=lmax1;
				lmax1:=i;
			end
		else if nieve>nievemax2 then
			begin
				nievemax2:=nieve;
				lmax2:=i;
			end;
		nievetotal:=nievetotal+nieve;
		if nieve>100 then
			mascien:=mascien+1;
	end;
	promedio:=nievetotal/localidades;
	porcentaje:=(mascien/localidades)*100;
	writeln('La localidad con mas nieve es, ',lmax1,'con', nievemax1, 'milimetros');
	writeln('La segunda localidad con mas nieve es, ',lmax2,'con', nievemax2, 'milimetros');
	writeln('La localidad con menos nieve es, ',lmin1,'con', nievemin1, 'milimetros');
	writeln('La segunda localidad con menos nieve es, ',lmin2,'con', nievemin2, 'milimetros');
	writeln('El promedio de nieve que cayo fue ', promedio:2:2, 'milimetros');
	writeln('El porcentaje de localidades donde nevo mas de 100 milimetros fue del', porcentaje:2:2, '%');
end.
