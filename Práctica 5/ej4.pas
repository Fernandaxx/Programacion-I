program ej4;
type
	nombres=string[30];
	juego=record
		nombre:nombres;
		categoria:nombres;
		idioma:nombres;
		votos:integer;
	end;
procedure leerJuego(var j:juego);
begin
	writeln('Ingrese la categoria: ');
	readln(j.categoria);
	if j.categoria<>'fin' then
	begin
		writeln('Ingrese el idioma: ');
		readln(j.idioma);
		writeln('Ingrese el nombre del juego: ');
		readln(j.nombre);
		writeln('Ingrese la cantidad de votos: ');
		readln(j.votos);
	end;
end;

procedure CatMax(cantJuegos,cantVotos:integer; var maxjCategoria,maxvCategoria:integer; var nomCatMaxJuegos,nomCatMaxVotos:nombres; categoriaActual:nombres);
begin
	if cantJuegos>maxjCategoria then
	begin
		maxjCategoria:=cantJuegos;
		nomCatMaxJuegos:=categoriaActual;
	end;
	if cantVotos>maxvCategoria then
	begin
		maxvCategoria:=cantVotos;
		nomCatMaxVotos:=categoriaActual;
	end;
end;

procedure jMaxVotos(nombre,idioma:nombres; votos:integer; var juegoMaxVotos:integer; var nomjuegoMaxVotos,idiomajuegoMaxVotos:nombres);
begin
	if votos>juegoMaxVotos then
	begin
		juegoMaxVotos:=votos;
		nomjuegoMaxVotos:=nombre;
		idiomajuegoMaxVotos:=idioma;
	end;
end;

var
	j:juego;
	vCategoria,vIdioma,jCategoria,jIdioma,maxjCategoria,maxvCategoria,CanteduIdioma,juegoMaxVotos:integer;
	categoriaActual,idiomaActual,nomCatMaxJuegos,nomCatMaxVotos,nomjuegoMaxVotos,idiomajuegoMaxVotos:nombres;
begin
	leerJuego(j);
	maxjCategoria:=-1;
	maxvCategoria:=-1;
	juegoMaxVotos:=-1;
	while j.categoria<>'fin'do
	begin
		categoriaActual:=j.categoria;
		vCategoria:=0;
		jCategoria:=0;
		while j.categoria=categoriaActual do
		begin
			idiomaActual:=j.idioma;
			vIdioma:=0;
			jIdioma:=0;
			CanteduIdioma:=0;
			while (j.idioma=idiomaActual)and(j.categoria=categoriaActual)do
			begin
				vIdioma:=vIdioma+j.votos;
				jIdioma:=jIdioma+1;
				if categoriaActual='educativo' then CanteduIdioma:=Canteduidioma+1;
				jMaxVotos(j.nombre,j.idioma,j.votos,juegoMaxVotos,nomjuegoMaxVotos,idiomajuegoMaxVotos);
				leerJuego(j);
			end;
			jCategoria:=jCategoria+jIdioma;
			vCategoria:=vCategoria+vIdioma;
			CatMax(jCategoria,vCategoria,maxjCategoria,maxvCategoria,nomCatMaxJuegos,nomCatMaxVotos,categoriaActual);
			if categoriaActual='educativo' then
			writeln('El promedio de votos de juegos educativos en el idioma ',idiomaActual,' es de ',vIdioma/CanteduIdioma:2:2, ' votos.');
		end;
	end;
	writeln('La categoria con mas juegos es: ', nomCatMaxJuegos);
	writeln('La categoria con mas votos es: ', nomCatMaxVotos);
	writeln('El nombre del juego mas votado es: ', nomjuegoMaxVotos,' y esta en el idioma ', idiomajuegoMaxVotos);
end.
