{9. Una empresa turística ofrece servicios de venta de paquetes a diferentes lugares del país. La misma
cuenta con dos estructuras de datos: una estructura en donde almacena la información de sus
clientes, donde de cada cliente se sabe su número de cliente, apellido, nombre, DNI y domicilio; y
otra estructura en donde almacena la información de los 300 paquetes de turismo que dispone para
la venta. Dichos paquetes se encuentran codificados del 1 al 300 y de cada uno se sabe el nombre
del destino del paquete y cantidad de plazas disponibles para el mismo. La estructura con la
información de los clientes no tiene orden. Realice un programa que:
a. Simule la venta de paquetes. De cada solicitud de compra de un paquete se lee el DNI de la
persona que desea hacer la compra, el código de paquete que solicita y la cantidad de plazas
que solicita. Una venta no podrá ser realizada si ocurre alguno de los siguientes motivos: que el
DNI no exista en la estructura de clientes o que la cantidad de plazas libres del paquete
solicitado no alcance para cubrir la cantidad de plazas solicitadas. En caso de que la venta
pueda ser realizada se debe actualizar la cantidad de plazas disponibles del paquete que se
vende. La venta de paquetes finaliza cuando se lee un DNI igual a 0. Una persona solicita un
único paquete.
b. Una vez finalizada la venta de paquetes se pide:
i. Realice un módulo que calcule e informe los dos códigos de paquetes con mayor cantidad de
plazas disponibles.
ii. Informe la cantidad de ventas que no pudieron ser realizadas porque el DNI no correspondía
a un cliente y la cantidad de ventas que no se pudieron realizar porque la cantidad de plazas
solicitadas era mayor que la cantidad de plazas libres del paquete.}

program ej9;
type
    cliente = record 
        nro:integer;
        apellido,nombre:string;
        dni:integer;
        domicilio:string;
    end;

    lista = ^nodo;
    nodo = record
        datos:cliente;
        sig:lista;
    end;

    paquete = record 
        destino:string;
        plazas:integer;
    end;

    vector1 = array[1..300] of paquete;

function existeDNI(l:lista; dni:integer):boolean;
begin
    existeDNI:=false;
    while (l<>nil) and (existeDNI=false) do 
    begin
        if l^.datos.dni = dni then existeDNI := true
        else l:=l^.sig;
    end;
end;

function hayPlazas(disponibles:integer; solicitadas:integer):boolean;
begin
    if disponibles>=solicitadas then hayPlazas:=true 
    else hayPlazas:=false;
end;

procedure maxPlazas(paquetes:vector1);
var i,cmax1,cmax2,max1,max2:integer;
begin
    max1:=-1;
    max2:=-1;
    cmax1:=0;
    for i:=1 to 300 do 
    begin
        if paquetes[i].plazas>max1 then 
        begin
            max2:=max1;
            cmax2:=cmax1;
            max1:=paquetes[i].plazas;
            cmax1:=i;
        end
        else if paquetes[i].plazas>max2 then
        begin
            max2:=paquetes[i].plazas;
            cmax2:=i;
        end;
    end;
    writeln('El codigo del destino con mas plazas disponibles es: ', cmax1);
    writeln('El codigo del segundo destino con mas plazas disponibles es: ', cmax2);
end;

procedure liberarMemoria(var l:lista);
var aux:lista;
begin
    while l<>nil do 
    begin
        aux:=l^.sig;
        dispose(l);
        l:=aux;
    end;
end;

var 
    l:lista;
    paquetes:vector1;
    dni,cod,plazas:integer;
    error1,error2:integer;
begin
    l:=nil;
    cargarL(l); //se dispone de enunciado
    cargarP(paquetes); //se dispone de enunciado
    error1:=0;
    error2:=0;
    writeln('Ingrese el DNI del cliente: ');
    readln(dni);
    while dni<>0 do 
    begin
        writeln('Ingrese el codigo de paquete solicitado: ');
        readln(cod);
        writeln('Ingrese la cantidad de plazas solicitadas: ');
        readln(plazas);
        if existeDNI(l,dni) and hayPlazas(paquetes[cod].plazas,plazas) then
        begin
            paquetes[cod].plazas:=paquetes[cod].plazas-1;
            writeln('La venta se concreta sin problemas.');
        end
        else
            if hayPlazas(paquetes[cod].plazas,plazas) = false then 
            begin 
                writeln('No hay tantas plazas disponibles para el paquete seleccionado.');
                error1:=error1+1;
            end
            else 
            begin
                writeln('El DNI no coincide con el de alguno de nuestros clientes.');
                error2:=error2+1; 
            end;
        writeln('Ingrese el DNI del cliente: ');
        readln(dni);
    end;
    maxPlazas(paquetes);
    writeln('Esta es la cantidad de ventas que no pudieron concretarse por falta de plazas disponibles: ', error1);
    writeln('Esta es la cantidad de ventas que no pudieron concretarse por dni no perteneciente a cliente registrado: ', error2);
    liberarMemoria(l);
end.

