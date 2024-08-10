
Program Repaso1;

Const 
  CORTE = 100000;

Type 
  Tnombre = String[30];
  Tcod = 1..9;

  Cliente = Record
    dni: integer;
    nombre: Tnombre;
    apellido: Tnombre;
    Cod : Tcod;
    Monto: real;
  End;

  lista = ^nodo;
  nodo = Record
    dato: Cliente;
    sig: lista;
  End;
  vector = array [Tcod] Of Integer;

Procedure ImpuestoMax (Var cod: Tcod; V:vector);

Var i: Tcod;
  max: integer;
Begin
  max := -1;
  For i := 1 To 9 Do
    Begin
      If v[i]> max Then
        Begin
          max := v[i];
          cod := i;
        End;
    End;
End;

Procedure SinAtender (Var Cant:integer; l:lista);
Begin
  While ( l <> Nil) Do
    Begin
      cant := cant +1;
      l := l^.sig;
    End;
End;

{Programa Principal}

Var 
  l,pri: lista;
  MontoR,cant: integer;
  v: vector;
  i,cod: Tcod;

Begin
  l := Nil;
  cargarlista(l);
  pri := l;
  montoR := 0;
  cant := 0;
  For i := 1 To 9 Do
    v[i] := 0;
  While (l <> Nil) And (MontoR <> CORTE) Do
    Begin
      MontoR := MontoR + l^.dato.monto;
      v[l^.dato.Cod] := v[l^.dato.Cod] + 1;
      l := l^.sig;
    End;
  ImpuestoMax(cod,v);
  writeln('El impuesto mas pagado fue: ', cod);
  If (l <> Nil) Then
    Begin
      SinAtender( Cant,l);
      WriteLn('Cantidad de personas sin atender: ', cant);
    End;
  liberarmemoria(pri);
End.

