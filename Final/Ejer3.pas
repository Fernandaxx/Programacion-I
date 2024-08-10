

{Dada una lista de lugares turísticos identificados por nombre y país, definir una estructura de datos
para almacenarlos y escribir un programa que implemente los siguientes módulos:
a) Calcular la longitud de la lista.
b) Calcular la cantidad de veces que aparece un país dado (un país puede aparecer más de una
vez, ya que puede haber diferentes lugares turísticos).
c) Dado un país, si existe, generar una nueva lista con los nombres de sus lugares turísticos.
d) Agregar al final de la lista creada en c) un nuevo lugar turístico.}

Program Ejer3;

Const 
  FIN = 'fin';

Type 
  cadena = string[30];
  Turismo = Record
    nombre: cadena;
    pais: cadena;
  End;
  lista = ^nodo;
  nodo = Record
    dato: Turismo;
    sig: lista;
  End;
  Lista2 = ^nodo2;
  nodo2 = Record
    dato: cadena;
    sig: Lista2;
  End;


Procedure LeerLugar (Var T:Turismo);
Begin
  WriteLn('Ingrese el nombre del lugar turistico');
  readln (t.nombre);
  If (t.nombre <> FIN) Then
    WriteLn('Ingrese el nombre del Pais');
  readln (t.pais);
End;

Procedure agregarElemento(Var l : lista; t : Turismo);

Var 
  nue : lista;
Begin
  new(nue);
  nue^.dato := t;
  nue^.sig := l;
  l := nue;
End;

Procedure AgregarAlFinal (Var L:lista2; n:cadena);

Var 
  nue,aux: Lista2;
Begin
  new (nue);
  nue^.dato := n;
  nue^.sig := Nil;
  aux := l;
  If l <> Nil Then
    Begin
      While aux^.sig <> Nil Do
        aux := aux^.sig;
      aux^.sig := nue;
    End
  Else
    l := nue;
End;

Procedure CargarLista (Var L:lista);

Var 
  t: Turismo;
Begin
  l := Nil;
  WriteLn();
  LeerLugar(t);
  While (t.nombre <> fin) Do
    Begin
      agregarElemento(l,t);
      LeerLugar(t);
    End;
End;

Procedure imprimirLista( l: lista);

Var 
  i : integer;
  long: integer;

Begin
  i := 1;
  long := 0;

  While l <> Nil Do
    Begin
      writeln(i,'_ nombre: ',l^.dato.nombre,'.     pais: ',l^.dato.pais,'.');
      l := l^.sig;
      i := i + 1;
      long := long+1;
    End;
  WriteLn('longitud de la lista: ', long);
  writeln('-----------------------------------------------------------------');
End;

Procedure Pais (l:lista; p:cadena);

Var 
  Cant: Integer;
Begin
  cant := 0;
  While (l <> Nil)  Do
    Begin
      If (l^.dato.pais = p) Then
        cant := cant +1;
      l := l^.sig;
    End;
  WriteLn (p,' esta en la lista: ', cant, ' veces');
End;

Function Existe (l: lista; p2:cadena): Boolean;

Var 
  encontre: Boolean;
Begin
  encontre := false;
  While (l <> Nil) And Not(encontre) Do
    Begin
      If (l^.dato.Pais = p2 ) Then
        encontre := true
      Else
        l := l^.sig;
    End;
  existe := encontre;
End;

Procedure ListaDeLugares (l:lista; Var l2: Lista2; p2:cadena);
Begin
  l2 := Nil;

  If existe(l,p2) Then
    Begin
      While l <> Nil Do
        Begin
          If l^.dato.Pais = p2 Then
            agregarAlfinal(l2,l^.dato.nombre);
          l := l^.sig;
        End;
    End;
End;

Procedure ImprimirLista2(l2:lista2; p2: cadena);
Begin
  writeln('Sitios turisticos del pais ',p2);
  While (l2 <> Nil) Do
    Begin
      writeln(L2^.dato);
      l2 := L2^.sig;
    End;
End;

Var 
  L: lista;
  l2: lista2;
  p: cadena;
  p2: cadena;
  lugar: cadena;

Begin
  CargarLista(l);
  imprimirLista(l);
  WriteLn('Ingrese el pais a contar cuantas veces esta en la lista');
  ReadLn(p);
  pais(l,p);
  writeln('-----------------------------------');
  WriteLn('Lista de lugares turisticos de ',p2);
  ReadLn(p2);
  ListaDeLugares(l,l2,p2);
  WriteLn('Ingrese un lugar turistico a guardar en la lista');
  ReadLn(lugar);
  AgregarAlFinal(l2,lugar);
  ImprimirLista2(l2,p2);
End.
