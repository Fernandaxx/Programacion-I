{. Se dispone de una estructura de datos con la información de personas que pagan su servicio de
cable a una empresa. De cada persona se conoce nombre, apellido, categoría del servicio (1
doméstico, 2 empresa, 3 comercio, 4 sociedad de beneficencia), monto básico que debe pagar y la
dirección donde se le brinda el servicio (a lo sumo 70 caracteres). El monto final a pagar por el
servicio de cable se compone de un monto básico al que se le adiciona un importe extra de acuerdo
a la categoría del servicio. Para ello la empresa dispone de una tabla adicional donde para cada
categoría de servicio (1 doméstico, 2 empresa, 3 comercio, 4 sociedad de beneficencia) se indica el
monto extra a cobrar. Se pide:
a. Calcular el monto recaudado por la empresa para cada categoría de servicio.
b. El nombre de la persona que más pago por el servicio de cable de categoría 2. En caso de que
nadie haya pagado esta categoría de servicio, informar “nadie pagó servicio de cable categoría
2”.
c. Para cada persona indicar si su dirección cumple la siguiente forma: A % B % C donde:
• A debe ser una secuencia de letras mayúsculas de la “A”..”G” y caracteres dígitos pares.
• % es el carácter “%” que seguro existe.
• B debe ser exactamente las letras de A, en el mismo orden, donde para cada letra
mayúscula de A aparece su minúscula en B.
• C debe ser una secuencia donde están una única vez, todos los caracteres dígitos que no
aparecieron en A.
Ejemplo: DFG2A4EG % dfgaeg % 13057896 {cumple con el patrón.}
{Nota: Cada persona paga un solo impuesto.}

program ej2;
const dimF=70;
type
    vector = array[1..dimF] of char;
    persona = record 
        nombre,apellido:string;
        cat:1..4;
        basico:real;
        direccion:vector;
    end;

    lista=^nodo;
    nodo = record
        datos:persona;
        sig:lista;
    end;

    Vcategoria = array[1..4] of real;

    conjunto = set of char;

    
function cumpleDireccion(v:vector):boolean;
var 
    A:conjunto;
    i:integer;
begin
    cumpleDireccion:=true;
    A:=['A'..'G'] + ['0','2','4','6','8'];
    i:=1;
    while (cumpleDireccion=true) and (i<=dimF) do
    begin
        while (v[i] <> '%') and (cumpleDireccion=true) do
        begin
            if (v[i] in A) then cumpleDireccion:=true
            else cumpleDireccion:=false;
            i:=i+1;
        end;
        if i<dimF then i:=i+1;
        while (v[i] <> '%') and (cumpleDireccion=true) do 
        begin
            
        end;
    end;
end;

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

var 
    l:lista;
    act:lista;
    extras:Vcategoria;
    totalxCat:Vcategoria;
    nom2Max:string;
    monto2Max:real;
    i:1..4;
begin
    cargarLista(l); //se dispone de enunciado
    cargarVector(extras); //se dispone de enunciado
    monto2Max:=-1;
    act:=l;
    for i:=1 to 4 do totalxCat[i]:=0;
    while (act<>nil) do
    begin
        totalxCat[act^.datos.cat]:=totalxCat[act^.datos.cat] + act^.datos.basico + extras[act^.datos.cat];
        if act^.datos.cat = 2 then
        begin
            if (act^.datos.basico+extras[act^.datos.cat]) > monto2Max then begin
                                                                                monto2Max:=act^.datos.basico+extras[act^.datos.cat];
                                                                                nom2Max:=act^.datos.nombre;
                                                                            end;
        end;
        if (cumpleDireccion(act^.datos.direccion)) then writeln('La direccion cumple')
        else writeln('La direccion no cumple');
        act:=act^.sig;
    end;
    for i:=1 to 6 do writeln('El monto recaudado por la categoria ',i, ' es: ', totalxCat[i]);
    if totalxCat[2] <> 0 then writeln('El nombre de la persona que mas pago por la categoria 2 es: ', nom2Max);
    liberarMemoria(l);
    liberarMemoria(act);
end.
