
Program eliminar;

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

Procedure EliminarNodo (Var pri:lista; D:tdato);

Var 
  ant,act: lista;
  encontre: Boolean;
Begin
  ant := pri;
  Act := pri;
  encontre := False;
  While (act <> Nil) And Not(encontre) Do
    {Recorre hasta encontrar el dato a eliminar}
    Begin
      If (Act^.dato = D) Then
        encontre := true
      Else
        Begin
          ant := act;
          act := act^.sig;
        End;
    End;
  If encontre Then
    Begin
      If (Act = pri) Then  {Caso en que el dato este de primero en la lista}
        pri := pri^.sig
      Else    {Caso en que este de ultimo o entre dos nodos}
        ant^.sig := act^.sig;
      dispose (act);
    End;
End;


Var 
  pri: lista;
  num : tdato;
Begin
  pri := Nil;
  CargarLista(pri);
  ImprimirLista(pri);
  WriteLn ('ingrese el numero a eliminar ');
  readln(num);
  EliminarNodo (pri,num);
  ImprimirLista(pri);

End.
