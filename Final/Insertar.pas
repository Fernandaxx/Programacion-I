
Program Insertar;

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

Procedure InsertarNodo (Var pri: lista; D:tdato); {LISTA ORDENADA}

Var 
  Nue,ant,act: lista;
  encontre: Boolean;
Begin
  New(nue); {reservar memoria para nuevo nodo}
  nue^.dato := D; {guardo el dato en el nodo}
  ant := pri;
  act := pri; {inicializo al comienzo de la lista}
  encontre := False;
  While (act <> Nil) And (Not encontre) Do
    Begin
      If (d <= act^.dato) Then
        encontre := true
      Else
        Begin
          ant := act;
          act := act^.sig;
        End;
    End;
  If (ant = act) Then {inserta en la primera posicion}
    pri := Nue
  Else          {Inserta entre dos nodos o al final, en caso de que act =nil}
    Begin
      ant^.sig := nue;
    End;
  nue^.sig := act;
End;

Var 
  pri: lista;
  D: tdato;

Begin
  pri := Nil;
  CargarLista(pri);
  ImprimirLista(pri);
  writeln('Ingrese el dato a Insertar en la lista');
  readln(D);
  InsertarNodo(pri,D);
  ImprimirLista(pri);
End.

Procedure EliminarNodo (Var pri:lista; D:tdato);

Var 
  ant,act: lista;
  encontre: Boolean;
Begin
  ant := pri;
  Act := pri;
  encontre := False;
  While (act <> pri) And Not(encontre) Do
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
















