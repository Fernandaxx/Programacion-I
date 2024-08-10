program ej_2;
var
	j,i,ciudades,habitantes,total,masdiezmil:integer;
	promedio,min,max:real;
begin
 masdiezmil:=0;
 min:=32767;
 max:=0;
 for i:=1 to 135 do
	begin
		total:=0;
		write('Ingresa el nro de ciudades en el partido:');
		read(ciudades);
		for j:=1 to ciudades do
			begin
				write('Ingresa el numero de habitantes en la ciudad',j);
				read(habitantes);
				total:=total+habitantes;
			end;
		promedio:=total/ciudades;
		if promedio>10000 then
			masdiezmil:=masdiezmil+1;
		write('El promedio de habitantes en el partido',i,'es de',promedio:2:2);
		if(promedio>max) then
			max:=promedio;
		if(promedio<min) then
			min:=promedio;
	end;
 write('El mayor promedio de habitantes es ', max:2:2);
 write('El menor promedio de habitantes es ', min:2:2);
 write('El porcentaje de partidos con mas de diez mil habitantes es del', ((masdiezmil/135)*100):2:2, 'porciento');
end.
