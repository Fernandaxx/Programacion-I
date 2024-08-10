program ej_5;
var
	peso,menorpeso,sumapesosmenores,sumapesosmayores,mayorpeso,promediomayor,promediomenor:real;
	edad,cantidadmenores,cantidadmayores:integer;
begin
	menorpeso:=9999;
	mayorpeso:=0;
	sumapesosmenores:=0;
	sumapesosmayores:=0;
	cantidadmenores:=0;
	cantidadmayores:=0;
	writeln('Ingrese la edad del animal: ');
	readln(edad);
	while (edad>0) do
	begin
		writeln('Ingrese el peso del animal: ');
		readln(peso);
		if edad<3 then
		begin
			cantidadmenores:=cantidadmenores+1;
			sumapesosmenores:=sumapesosmenores+peso;
			if peso<menorpeso then
				menorpeso:=peso;
		end
		else 
		begin
			sumapesosmayores:=sumapesosmayores+peso;
			cantidadmayores:=cantidadmayores+1;
			if peso>mayorpeso then
				mayorpeso:=peso;
		end;
		writeln('Ingrese la edad del animal: ');
		readln(edad);
	end;
	promediomayor:=sumapesosmayores/cantidadmayores;
	promediomenor:=sumapesosmenores/cantidadmenores;
	writeln('PESO PROMEDIO -3 ANOS: ',promediomenor:2:2);
	writeln('PESO PROMEDIO +3 ANOS: ', promediomayor:2:2);
	writeln('MENOR PESO -3 ANOS', menorpeso:2:2);
	writeln('MAYOR PESO +3 ANOS ', mayorpeso:2:2);
end.
