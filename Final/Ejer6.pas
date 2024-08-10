



































{Un cine dispone de una lista con la información de los tickets del día (Nro. Caja, nro ticket, monto)
correspondientes a sus 5 cajas. Escribir un programa que procese dicha lista y permita:
a) Calcular e informar el monto promedio recaudado por caja.
b) Genere una nueva lista con las cajas con montos menores a $1000.
c) Genere una nueva lista con las cajas que recaudaron más de $12000 con menos de 100 tickets.}

Program Ejer6;

Const 
  CAJAS = 5;
  FIN = 0; {La carga de dato finaliza cuando se ingresa el ticket 0}

Type 
  RangoCajas = 1..CAJAS;

  Tickets = Record
    nro_Caja : RangoCajas;
    nro_Ticket: Integer;
    monto: real;
  End;

  Lista = ^nodo;
  nodo = Record
    dato: tickets;
    sig: lista;
  End;

  Tmonto = Record
    MontoTot: real;
    CantTicket: Integer;
    Promedio: real;
  End;

  VecMonto = Array [RangoCajas] Of Tmonto; {Guarda los datos del monto por caja}



Procedure LeerTicket (Var T:Tickets);
Begin
  T.nro_Ticket := random(20);
  If T.nro_Ticket <> FIN Then
    Begin
      T.nro_Caja := random(CAJAS) + 1;
      T.monto := random(1000);
    End;
End;

Procedure AgregarAlInicio (Var l:lista; T:Tickets);

Var nue: Lista;
Begin
  new(nue);
  nue^.dato := T;
  nue^.sig := l;
  l := nue;
End;

Procedure CargarLista (Var l: lista);

Var 
  T: Tickets;
Begin
  L := Nil;
  LeerTicket(T);
  While (T.nro_ticket <> Fin) Do
    Begin
      AgregarAlInicio(l,T);
      LeerTicket(T);
    End;
End;


{----------------------------------A----------------------------------}

Procedure InicializarVector (Var v:VecMonto);

Var 
  i: RangoCajas;
Begin
  For i := 1 To CAJAS Do
    Begin
      v[i].MontoTot := 0;
      v[i].CantTicket := 0;
      v[i].promedio := 0;
    End;
End;

Procedure CalcularPromedio (Var v:VecMonto);

Var 
  i: RangoCajas;
Begin
  For i := 1 To CAJAS Do
    Begin
      v[i].promedio := v[i].MontoTot / v[i].CantTicket;
    End;
End;

Procedure InformarPromedio (v:VecMonto);

Var i : RangoCajas;
Begin
  For i := 1 To cajas Do
    Begin
      Writeln('Caja: ', i);
      writeln('Monto de la Caja: ', v[i].montotot:2:2);
      writeln('Promedio recaudado por la caja: ', v[i].promedio:2:2);
    End;
End;

Procedure RecorrerLista (l:Lista; Var v: VecMonto );

Begin
  InicializarVector(v); {A}
  While (l <> Nil) Do
    Begin
      v[l^.dato.nro_caja].MontoTot := v[l^.dato.nro_caja].MontoTot + l^.dato.monto;
      v[l^.dato.nro_caja].CantTicket := v[l^.dato.nro_caja].CantTicket + 1;
      l := l^.sig;
    End;
  CalcularPromedio(v);
  informarPromedio(v);


End;
Procedure LiberarMemoria (Var l:Lista);

Var 
  ant: lista;
Begin
  While l <> Nil Do
    Begin
      ant := l;
      l := l^.sig;
      Dispose(ant);
    End;
End;

{------------------------B-----------------------}
Procedure InformarLista (l:lista);
Begin
  writeln('==================================================');
  While (l <> Nil) Do
    Begin
      If l^.dato.nro_Ticket < 10 Then
        Begin
          writeln('nro de ticket :   0',l^.dato.nro_Ticket, '.          caja :   ', l^.dato.nro_Caja,'.       monto : ',
                  l^.dato.monto:5
                  :2,'$.');
        End
      Else
        writeln('nro de ticket :   ',l^.dato.nro_Ticket,'.          caja :   ', l^.dato.nro_Caja,'.       monto : ',l^.
                dato.monto:5:2,
                '$.');
      l := l^.sig;
    End;
  WriteLn('=====================================');
End;

Procedure RecorrerLista2 (l:lista; v:VecMonto);

Var 
  l2,l3: lista;
Begin
  l2 := Nil;
  l3 := Nil;
  While l <> Nil Do
    Begin
      If v[l^.dato.nro_caja].MontoTot < 1000 Then
        AgregarAlInicio (l2,l^.dato)
      Else If (v[l^.dato.nro_caja].MontoTot > 1200) And (v[l^.dato.nro_caja].CantTicket < 100) Then
             AgregarAlInicio (l3,l^.dato);
      l := l^.sig;
    End;
  writeln('INCISO B');
  InformarLista(l2);
  writeln('INCISO C');
  InformarLista(l3);
  LiberarMemoria(l2);
  LiberarMemoria(l3);
End;

Var 
  L: Lista;
  v: VecMonto;

Begin
  randomize;
  CargarLista(l);
  InformarLista(l);
  RecorrerLista(l,v);
  RecorrerLista2(l,v);
  liberarMemoria(l);

End.
