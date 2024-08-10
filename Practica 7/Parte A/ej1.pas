program ej1;
const
	dimF=10;
type
	vector = array[1..dimF] of integer;

procedure leerVector(var v:vector; var dimL:integer);
var i:integer;
begin
	for i:=1 to dimF do 
	begin
		readln(v[i]);
		dimL:=dimL+1;
	end;
end;

procedure prom(v:vector; dimL:integer; var suma,neg,pos:integer);
var i:integer;
begin
	suma:=0; neg:=0; pos:=0;
	for i:=1 to dimL do
	begin
		suma:=suma+v[i];
		if v[i]>0 then pos:=pos+1
		else neg:=neg+1;
	end;
end;
procedure rango(v:vector; desde,hasta,dimL:integer; var cant:integer);
var i:integer;
begin
	cant:=0;
	for i:=1 to dimL do
	begin
		if (v[i]>=desde) and (v[i]<=hasta) then cant:=cant+1;
	end;
	writeln(cant,' valores del vector pertenecen a ese rango.');
end;

procedure maximos(v:vector; var max1,max2,pos1,pos2:integer; dimL:integer);
var i:integer;
begin
	for i:=1 to dimL do
	begin
		if v[i]>max1 then 
		begin
			max2:=max1;
			max1:=v[i];
			pos2:=pos1;
			pos1:=i;
		end
		else if v[i]>max2 then
		begin
			max2:=v[i];
			pos2:=i;
		end;
	end;
end;

var
	v:vector;
	dimL,desde,hasta,suma,pos,neg,cant,max1,max2,pos1,pos2:integer;
begin
	pos1:=-1;
	max1:=-9999;
	max2:=-9999;
	dimL:=0;
	leerVector(v,dimL);
	prom(v,dimL,suma,neg,pos);
	writeln('Ingrese el valor incial del rango a analizar');
	readln(desde);
	writeln('Ingrese el valor final del rango a analizar');
	readln(hasta);
	rango(v,desde,hasta,dimL,cant);
	maximos(v,max1,max2,pos1,pos2,dimL);
end.
