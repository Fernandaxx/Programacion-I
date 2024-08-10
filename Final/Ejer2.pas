






{Escribir un programa que lea una secuencia de números enteros y genere una lista. La lectura finaliza
cuando se lee el número 0. Una vez generada la lista, informar:
a) El mayor número leído.
b) La cantidad de números cuya cantidad de dígitos es impar.
c) Los 2 últimos números pares de la lista}

Program Ejer2;

Const 
  FIN = 0;

Type 
  tdato = integer;
  lista = ^nodo;
  nodo = Record
    dato: tdato;
    sig: lista;
  End;

Procedure AgregarAlInicio (Var L:lista; num:tdato);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.dato := num;
  nue^.sig := l;
  l := nue;
End;

Procedure CargarLista (Var l: lista);

Var 
  num: TDato;
Begin
  writeln ('Ingrese el dato');
  readln(num);
  While (num <> FIN) Do
    Begin
      agregarAlInicio(l,num);
      writeln ('Ingrese el dato');
      readln(num);
    End;
End;

Procedure ImprimirLista (l: lista);
Begin
  WriteLn ('---------------------');
  While (l <> Nil) Do
    Begin
      Writeln(l^.dato);
      l := l^.sig;
    End;
End;
Function NumMax (l:lista): Integer;
{Implementar preguntando si la lista esta vacia}

Var 
  max : Integer;
Begin
  max := -9999;
  While (l <> Nil) Do
    Begin
      If (l^.dato > max) Then
        max := l^.dato;
      l := l^.sig;
    End;
  numMax := max;
End;


Function CantDigImpar (l:lista): integer;

Var 
  cantDig,Impar, num: Integer;
Begin
  Impar := 0;
  While L <> Nil Do
    Begin
      num := l^.dato;
      CantDig := 0;
      While num  <> 0 Do
        Begin
          cantDig := cantDig + 1;
          num := num Div 10;
        End;
      If (CantDig Mod 2 <> 0) Then
        Impar := Impar + 1;
      L := l^.sig;
    End;
  CantDigImpar := Impar;
End;


Procedure Ultimospares (l: lista; Var Par1,Par2: tdato);

Begin

  While (l <> Nil ) Do
    Begin
      If (l^.dato Mod 2 = 0)  Then
        Begin
          Par2 := Par1;
          par1 := l^.dato;
        End;
      l := l^.sig;
    End;
End;


Var 
  l: lista;
  Par1: tdato;
  Par2: tdato;

Begin
  par1 := 1;
  par2 := 1;
  l := Nil;
  cargarlista(l);
  imprimirlista (l);

  WriteLn('----------------A--------------');
  WriteLn();
  If l=Nil Then
    Write ('Lista Vacia')
  Else
    WriteLn('Maximo numero de la lista ', numMax(l));
  WriteLn();

  WriteLn('----------------B--------------');
  WriteLn();
  WriteLn('Cantidad de numeros cuya cantidad de digitos es impar ',
          CantDigImpar(l));
  WriteLn('----------------C--------------');
  Ultimospares (l,Par1,Par2);
  writeln('ultimo par : ',par1 , '.    ante ultimo par : ', par2,'.');

End.
