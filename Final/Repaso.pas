










{Una casa de ropa deportiva tienen una lista con información sobre sus
productos. Por cada producto que se vende tienen código de producto, código
de deporte con el que se asocia el producto (codificado entre 1..15),
descripción y cantidad en stock. La lista está ordenada por código de
producto.
Se pide:
Generar 15 listas separadas, una por cada código de deporte, con los
productos que pertenecen a cada uno. Las listas deben mantener el orden de
la lista original.}

Program Repaso;


Type 
  tcodDep = 1.. 15;
  producto = Record
    CodProd: Integer;
    CodDep: TcodDep;
    descripricion: string;
    Stock: integer;
  End;
  lista = ^nodo;
  nodo = Record
    dato: producto;
    sig: lista;
  End;

  vectorListas = array [tcodDep] Of lista;

Procedure InsertarAlfinal (Var l:lista; P:producto);

Var 
  nue, aux, ant: lista;
Begin
  new(nue);
  nue^.dato := P;
  nue^.sig := Nil;
  If (l = Nil) Then
    l := nue
  Else
    Begin
      aux := l;
      While (aux <> Nil) Do
        Begin
          ant := aux;
          aux := aux^.sig;
        End;
      ant^.sig := nue
    End;
End;

Procedure InicializarListas (Var vl:vectorListas);

Var 
  i: tcodDep;
Begin
  For i:= 1 To 15 Do
    vl[i] := Nil;
End;
Procedure liberarMemoria (Var l:lista);

Var 
  aux: lista;
Begin
  While l <> Nil Do
    aux := l;
  l := l^.sig;
  dispose(aux);
End;

Var 
  l,pri: lista;
  Vl: vectorListas;
  i: tcodDep;
Begin
  l := Nil;
  cargarlista(l); {se dispone}
  InicializarListas(Vl);
  pri := l;
  While (l <> Nil) Do
    Begin
      InsertarAlfinal(Vl[l^.dato.CodDep],l^.dato);
      l := l^.sig;
    End;
  liberarmemoria(pri);
  For i:= 1 To 15 Do
    liberarMemoria(vl[i]);
End;
