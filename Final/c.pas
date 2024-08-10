Procedure InsertarAlFinal (Var l:lista; E:entrada);

Var 
  nue, ant,pos: lista;
Begin
  new(nue);
  nue^.dato := E;
  nue^.sig := Nil;
  If l = Nil Then
    l := nue
  Else
    Begin
      pos := pri;
      ant := pos;
      While (pos<> Nil) Do
        ant := pos;
      pos := pos^.sig;
      ant^.sig := nue;
    End;
End;
