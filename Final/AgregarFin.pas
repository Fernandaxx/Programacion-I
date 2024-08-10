
Program AgregarFin;

Const 
  corte = 0;

Type 
  tdato = integer;
  lista = ^nodo;
  nodo = Record
    dato: tdato;
    sig: lista;
  End;

Procedure AgregarAlFinal (Var Pri:lista; D:tdato); {recorriendo toda la lista}

Var 
  nue,ant: lista;
Begin
  new(nue);
  nue^.dato := D;
  nue^.sig := Nil;
  If pri = Nil Then
    pri := nue
  Else
    Begin
      ant := pri;
      While (ant^.sig <> Nil) Do
        ant := ant^.sig;
      ant^.sig := nue;
    End;
End;

Procedure CargarLista (Var Pri:lista);

Var 
  D: tdato;
Begin
  writeln('Ingrese el dato a guardar en la lista');
  readln(D);
  While  (d <> corte) Do
    Begin
      agregarAlfinal(pri,D);
      writeln('Ingrese el dato a guardar en la lista');
      readln(D);
    End;
End;

Procedure ImprimirLista (pri: lista);
Begin
  writeln ('--------------LISTA--------------');
  While (pri <> Nil) Do
    Begin
      writeln('dato: ', pri^.dato);
      pri := pri^.sig;
    End;
End;

Var 
  pri: lista;
Begin
  pri := Nil;
  CargarLista(pri);
  ImprimirLista(pri);
  readln();
End.
