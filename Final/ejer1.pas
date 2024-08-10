

{Escribir un programa que lea una secuencia de números enteros terminada en 999 y los almacene
en una lista simple. Utilizando la lista creada implementar:
a) un módulo que reciba la lista y devuelva como resultado la cantidad de números con 3 dígitos.
b) un módulo que reciba la lista y un número y determine si dicho número está o no en la lista. La
búsqueda debe terminar al encontrar la primera ocurrencia del número buscado.
c) Un módulo que reciba la lista y libere la memoria reservada.
}

Program ejer1;

Const 
  FIN = 999;

Type 
  lista = ^numeros;
  numeros = Record
    dato: Integer;
    sig: lista;
  End;

Procedure AgregarAlInicio (Var pri:lista; num:integer);

Var 
  nue: lista;
Begin
  New(nue);
  nue^.dato := num;
  nue^.sig := pri;
  pri := nue;
End;

Procedure CargarLista (Var Pri:lista);

Var 
  num: Integer;
Begin
  Writeln('Ingresa el dato a cargar');
  ReadLn (num);
  While num <> FIN Do
    Begin
      agregarAlinicio(pri,num);
      Writeln('Ingresa el dato a cargar');
      ReadLn (num);
    End;
End;

Function contardig (num:Integer): Integer;

Var 
  contar: Integer;
Begin
  contar := 0;
  While num <> 0 Do
    Begin
      num := num Div 10;
      contar := contar + 1;
    End;
  contardig := contar;
End;

Function Cant3dig (Pri:lista): Integer;

Var 
  cant: Integer;
Begin
  cant := 0;
  While (pri <> Nil) Do
    Begin
      If (contardig(Pri^.dato) = 3) Then
        cant := cant + 1;
      pri := pri^.sig;
    End;
  Cant3dig := cant;
End;

Function pertenece (Pri:lista; n:integer): boolean;

Var 
  encontre: boolean;
Begin
  encontre := false;
  While (pri <> Nil) And Not(encontre) Do
    Begin
      If (Pri^.dato = n) Then
        encontre := true
      Else
        Pri := Pri^.sig;
    End;
End;

Procedure LiberarMemoria (Var pri:lista);

Var 
  ant: lista;
Begin
  While (Pri <> Nil) Do
    Begin
      ant := pri;
      pri := Pri^.sig;
      dispose (ant);
    End;
End;

Procedure ImprimirLista (pri: Lista);
Begin
  writeln('-------Lista---------');
  While (Pri <> Nil) Do
    Begin
      Writeln('Numero: ', Pri^.dato);
      Pri := pri^.sig;
    End;
End;

Var 
  Pri: Lista;
  numero: integer;
Begin
  pri := Nil;
  CargarLista(Pri);
  ImprimirLista(pri);
  writeln('Cantidad de numeros con 3 digitos en la lista: ', Cant3dig(pri));
  writeln('Ingrese un numero a buscar en la lista: ');
  readln(numero);
  If (pertenece(pri,numero)) Then
    writeln(numero, ' Esta en la lista')
  Else
    writeln (numero, ' No esta en la lista');
  LiberarMemoria(pri);
  ReadLn();
End.
