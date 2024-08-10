
Program prueba;

Type 
  lista = ^nodo;
  nodo = Record
    dato: integer;
    sig: lista;
  End;

Procedure cargarlista (Var l:lista );

Var 
  n: integer;
  nue: lista;
Begin
  write('numero');
  read(n);
  While (n <> 0) Do
    Begin
      new(nue);
      nue^.dato := n;
      nue^.sig := l;
      l := nue;
      write('numero');
      read(n);

    End;
End;

Procedure ImprimirLista (l:lista);
Begin
  While (l <> Nil) Do
    Begin
      Write('/', l^.dato ,'/');
      l := l^.sig;
    End;
End;

Procedure agregaralinicio (Var l:lista; n:Integer);

Var nue: lista;
Begin
  new(nue);
  nue^.dato := n;
  nue^.sig := l;
  l := nue;
End;
Procedure cortedecontrol (l:lista; Var l2:lista);

Var 
  n: integer;
  t: integer;
Begin

  While (l <> Nil) Do
    Begin
      n := l^.dato;
      t := 0;
      While (l <> Nil) And (l^.dato = n) Do
        Begin
          t := t+n;
          l := l^.sig;
        End;
      agregaralinicio(l2,t);
    End;
End;

Var 
  L,l2: lista;
Begin
  l := Nil;
  l2 := Nil;
  cargarlista(l);
  imprimirlista(l);
  cortedecontrol(l,l2);
  imprimirlista(l2);
End.
