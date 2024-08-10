




{Leer una secuencia de 20 números y crear una lista agregando siempre al
principio. Una vez generada dicha lista debe imprimirla en pantalla.}

Program ejemplo;

Const 
  CANT = 5;

Type 
  Lista = ^Nodo;
  nodo = Record
    dato: Integer;
    sig: lista;
  End;

Procedure AgregarAlInicio (Var pri:Lista; num: Integer);

Var 
  nue: lista;

Begin
  new(nue);
  nue^.dato := num;
  nue^.sig := pri;
  pri := nue;
End;

Procedure ImprimirLista (l: lista);
Begin
  writeln('---------- LISTADO ----------');
  While (l <> Nil ) Do
    Begin
      writeln ('Numero: ', l^.dato);
      l := l^.sig;
    End;
End;

Var 
  pri: lista;
  num,i: Integer;

Begin
  pri := Nil;
  For i := 1 To CANT Do
    Begin
      WriteLn('Ingrese el numero a la lista');
      readln(num);
      AgregarAlInicio(pri,num);
    End;
  ImprimirLista(pri);
End.
