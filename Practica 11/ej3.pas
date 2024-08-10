{3. Se dispone de una lista con la información de los ingresantes a la Facultad en el año anterior. De
cada ingresante se conoce: apellido, nombre, ciudad de origen, fecha de nacimiento (día, mes, año),
si presentó el título del colegio secundario y el código de la carrera en la que se inscribe (APU, LI,
LS). Con esta información de los ingresantes se pide que recorra la lista una vez para:
a. Informar el apellido de los ingresantes cuya ciudad origen es “Brandsen”.
b. Calcular e informar el año en que más ingresantes nacieron (asumir que los años de
nacimientos de los ingresantes pueden variar entre 1970 y 2000).
c. Informar la carrera con la mayor cantidad de inscriptos.
d. Eliminar de la lista aquellos ingresantes que no presentaron el título.}
//APU=A
//LI =B
//LS =C

program ej3;
type
    fechas = record
        dia:1..31;
        mes:1..12;
        anio:1970..2000;
    end;
    persona = record
        apellido,nombre,ciudad:string;
        fecha:fechas;
        titulo:boolean;
        codigo:char;
    end;

    lista=^nodo;
    nodo = record
        datos:persona;
        sig:lista;
    end;

    vector1 = array[1970..2000] of integer;
    vector2 = array['A..C'] of integer;

procedure liberarMemoria(var l:lista);
var sig:lista;
begin
    while l<>nil do
    begin
        sig:=l^.sig;
        dispose(l);
        l:=sig;
    end;
end;

procedure eliminar(var l:lista; datos:persona);
var ant,act:lista;
begin
    act:=l;
    while (act<>nil) and (act^.datos <> datos) do
    begin
        ant:act;
        act:=act^.sig;
    end;
    if act<>nil then 
    begin
        if act=l then l:=act^.sig
        else ant^.sig:=act^.sig;
        dispose(act);
    end;
end;

var 
    l:lista;
    act:lista;
    anios:vector1;
    carreras:vector2;
    maxAnio:integer;
    maxcantAnio:integer;
    maxCarrera:char;
    maxcantCarrera:integer;
    i:integer;
    j:char;
begin
    l:=nil;
    cargarLista(l); //se dispone de enunciado
    act:=l;
    for i:=1970 to 2000 do anios[i]:=0;
    for j:='A' to 'C' do carreras[j]:=0;
    while act <> nil do
    begin
        if (act^.datos.ciudad = 'Brandsen') then writeln (act^.datos.nombre);
        anios[act^.datos.fecha.anio]:=anios[act^.datos.fecha.anio]+1;
        carreras[act^.datos.codigo]:=carreras[act^.datos.codigo] + 1:
        if (act^.datos.titulo = false) then eliminar(l,act^.datos);
        act:=act^.sig;
    end;
    maxcantAnio:=-1;
    for i:=1970 to 2000 do begin
         if anios[i]>maxcantAnio then begin maxAnio:=i;
         maxcantAnio:=anios[i];
         end;
    end;
    maxcantCarrera:=-1;
    for j:='A' to 'C' do 
    begin 
        if carreras[j]>maxcantCarrera then begin maxCarrera:=j;
        maxcantCarrera:=carreras[j];
        end;
    end;
    writeln('El año en el que mas ingresante nacieron es: ', maxAnio);
    writeln('La carrera con mas ingresante es la de codigo: ', maxCarrera);
    liberarMemoria(l);
    liberarMemoria(act);
end.