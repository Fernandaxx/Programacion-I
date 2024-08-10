


{Dada una lista de aviones (marca, modelo y cantidad de asientos), definir la estructura que permita
almacenarlos y escribir un programa que implemente:
a) Un módulo que reciba una lista de aviones y un avión y lo agregue a la lista. Se sabe que la lista
está ordenada por marca en forma descendente y se pide agregar el avión a la lista de forma que
se mantenga el orden.
b) Un módulo que reciba una lista de aviones y un avión, y elimine el elemento de la lista que
coincida totalmente con el avión recibido. Además, debe retornar si la eliminación se realizó o no}

Program Ejer4;

Const 
  FIN = 'fin';

Type 
  Cadena = string[30];
  Aviones = Record
    marca: Cadena;
    modelo: cadena;
    asientos: Integer;
  End;

  lista = ^nodo;
  nodo = Record
    dato: Aviones;
    sig: lista;
  End;

Procedure LeerAviones (Var A:Aviones);
Begin
  WriteLn ('Ingrese la marca del avion');
  readln(A.marca);
  If (A.marca <> FIN) Then
    Begin
      WriteLn ('Ingrese el modelo del avion');
      readln(A.modelo);
      WriteLn ('Ingrese la cantidad de asientos');
      readln(A.asientos);
    End;
End;




Procedure InsertarOrdenado (Var l:lista; A:Aviones);

Var 
  nue,act, ant: lista;
  encontre: Boolean;

Begin
  act := l;
  ant := l;
  encontre := False;
  new(nue);
  nue^.dato := A;
  While (act <> Nil) And Not(encontre) Do
    Begin
      If (nue^.dato.marca >= act^.dato.marca) Then
        encontre := true
      Else
        Begin
          ant := act;
          Act := act^.sig;
        End;
    End;
  If (act = ant) Then
    l := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;


Procedure CrearLista (Var l: lista);

Var 
  A: Aviones;
Begin
  l := Nil;
  LeerAviones(A);
  While (A.marca <> fin) Do
    Begin
      InsertarOrdenado(l,A);
      LeerAviones(A);
    End;
End;


Procedure ImprimirLista (l:lista);
Begin
  writeln ('-----Lista de Aviones------');
  While l <> Nil Do
    Begin
      writeln ('Marca: ', l^.dato.marca);
      writeln ('Modelo: ', l^.dato.modelo);
      writeln ('Asientos: ', l^.dato.asientos);
      writeln ('-------------------------------');
      l := l^.sig;
    End;
End;

Procedure insertarAvion(l : lista);

Var 
  A : Aviones;
Begin
  leerAviones(A);
  writeln('insertar avion ',a.marca);
  writeln;
  insertarOrdenado(l,A);
  imprimirLista(l);
End;




{Programa principal}
{Falta parte b}

Var 
  L: lista;
Begin
  crearLista(l);
  ImprimirLista(l);
  insertarAvion(l);

End.
