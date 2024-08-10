program ej9a;
type
    imagenRGB = record
        ancho:integer;
        alto:integer;
        datos: array[1..4, 1..4] of integer;
    end;

procedure cargarImagen(var im:imagenRGB);
var f,c:integer;
begin
    writeln('Ingrese el ancho');
    readln(im.ancho);
    writeln('Ingrese el alto');
    readln(im.alto);
    write('Ingrese los datos');
    for f:=1 to 4 do
        for c:=1 to 4 do
            readln(im.datos[f,c]);
end;

procedure copiarImagen(im1:imagenRGB; var im2:imagenRGB);
var f,c:integer;
begin
    im2.ancho:=im1.ancho;
    im2.alto:=im1.alto;
    for f:=1 to 4 do 
        for c:=1 to 4 do
            im2.datos[f,c]:=im1.datos[f,c];
end;

procedure rotarImagen(im1:imagenRGB; var im2:imagenRGB);
var f,c,x:integer;
begin
    x:=4;
    for f:=1 to 4 do
    begin
        for c:=1 to 4 do
                im2.datos[c,x]:=im1.datos[f,c];
        x:=x-1;
    end;
end;

procedure espejarImagen(im1:imagenRGB; var im2:imagenRGB);
var 
    x,f,c:integer;
begin
    x:=4;
    for c:=1 to 4 do
    begin
        for f:=1 to 4 do
            im2.datos[f,x]:=im1.datos[f,c];
        x:=x-1;
    end;

end;

procedure imprimir(var im2:imagenRGB);
var f,c:integer;
begin
    for f:=1 to 4 do 
        for c:=1 to 4 do
            writeln(im2.datos[f,c]);
end;

var
    im1,im2:imagenRGB;
begin
    cargarImagen(im1);
    espejarImagen(im1,im2);
    imprimir(im2);
end.