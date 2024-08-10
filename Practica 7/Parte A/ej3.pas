program ej3;
const dimF=600;
type
    abc = set of char;
    vector = array[1..dimF] of char;

procedure leerVector(var v:vector);
var i:integer;
begin
    for i:=1 to dimF do
    begin
        writeln('Ingrese el caracter para el espacio ',i);
        readln(v[i]);
    end;
end;

procedure cuentaCons(v:vector; May,Min,consMay,consMin:abc; var totalABC,totalCons:integer);
var i:integer;
begin
    totalCons:=0;
    totalABC:=0;
    for i:=1 to dimF do
    begin
        if (v[i] in May) or (v[i] in Min) then
        begin
            totalABC:=totalABC+1;
            if (v[i] in consMay) or (v[i] in consMin) then totalCons:=totalCons+1;
        end;
    end;
end;

procedure cuentaDigMayMin(v:vector; Dig,May,Min:abc; var totalDigMayMin:integer);
var i:integer;
begin
    totalDigMayMin:=0;
    for i:=1 to dimF do
    begin
        if v[i] in Dig then totalDigMayMin:=totalDigMayMin+1
        else if v[i] in May then totalDigMayMin:=totalDigMayMin+1
        else if v[i] in Min then totalDigMayMin:=totalDigMayMin+1;
    end;
end;

var
    v:vector;
    consMay,consMin,vocalesMay,vocalesMin,Dig,May,Min:abc;
    totalABC,totalCons,totalDigMayMin:integer;
begin
    Dig:=['0'..'9'];
    May:=['A'..'Z'];
    Min:=['a'..'z'];
    vocalesMay:=['A','E','I','O','U'];
    vocalesMin:=['a','e','i','o','u'];
    consMay:=May-vocalesMay;
    consMin:=Min-vocalesMin;
    leerVector(v);
    cuentaCons(v,May,Min,consMay,consMin,totalABC,totalCons);
    cuentaDigMayMin(v,Dig,May,Min,totalDigMayMin);
    writeln('La cantidad de consonantes es: ', totalCons);
    writeln('La cantidad de digitos/mayusculas/minusculas es: ', totalDigMayMin);
    writeln('El porcentaje de consonantes del total de letras es: ', ((totalCons/totalABC)*100):2:2);
    writeln('El porcentaje de digitos/mayusculas/minusculas del total es: ', (((totalDigMayMin/dimF))*100):2:2);
end.