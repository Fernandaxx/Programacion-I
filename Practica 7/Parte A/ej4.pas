program ej3;
const 
    dimF=10;
    fin='.';
type
    abc = set of char;
    vector = array[1..dimF] of char;

procedure leerVector(var v:vector; var dimL:integer);
begin
    dimL:=1;
    writeln('Ingrese el caracter para la posicion, ', dimL);
    readln(v[dimL]);
    while (dimL<dimF) and (v[dimL]<>'.') do
    begin
        dimL:=dimL+1;
        writeln('Ingrese el caracter para la posicion, ', dimL);
        readln(v[dimL]);
    end;
end;

procedure cuentaCons(v:vector; May,Min,consMay,consMin:abc; var totalABC,totalCons:integer; dimL:integer);
var i:integer;
begin
    totalCons:=0;
    totalABC:=0;
    for i:=1 to dimL do
    begin
        if (v[i] in May) or (v[i] in Min) then
        begin
            totalABC:=totalABC+1;
            if (v[i] in consMay) or (v[i] in consMin) then totalCons:=totalCons+1;
        end;
    end;
end;

procedure cuentaDigMayMin(v:vector; Dig,May,Min:abc; var totalDigMayMin:integer; dimL:integer);
var i:integer;
begin
    totalDigMayMin:=0;
    for i:=1 to dimL do
    begin
        if v[i] in Dig then totalDigMayMin:=totalDigMayMin+1
        else if v[i] in May then totalDigMayMin:=totalDigMayMin+1
        else if v[i] in Min then totalDigMayMin:=totalDigMayMin+1;
    end;
end;

var
    v:vector;
    consMay,consMin,vocalesMay,vocalesMin,Dig,May,Min:abc;
    totalABC,totalCons,totalDigMayMin,dimL:integer;
begin
    Dig:=['0'..'9'];
    May:=['A'..'Z'];
    Min:=['a'..'z'];
    vocalesMay:=['A','E','I','O','U'];
    vocalesMin:=['a','e','i','o','u'];
    consMay:=May-vocalesMay;
    consMin:=Min-vocalesMin;
    leerVector(v,dimL);
    cuentaCons(v,May,Min,consMay,consMin,totalABC,totalCons,dimL);
    cuentaDigMayMin(v,Dig,May,Min,totalDigMayMin,dimL);
    writeln('La cantidad de consonantes es: ', totalCons);
    writeln('La cantidad de digitos/mayusculas/minusculas es: ', totalDigMayMin);
    writeln('El porcentaje de consonantes del total de letras es: ', ((totalCons/totalABC)*100):2:2);
    writeln('El porcentaje de digitos/mayusculas/minusculas del total es: ', (((totalDigMayMin/dimL))*100):2:2);
end.