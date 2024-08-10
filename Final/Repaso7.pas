
Program Repaso7;

Const 
  MaxCat = 10;

Type 
  Tnombre = string[30];
  Tcategoria = 1..maxCat;
  Tmes = 1..12;

  Tmonto = array [Tmes] Of real;

  Factura = Record
    Cod: Integer;
    categoria: tcategoria;
    m3: real;
    monto: real;
    MontoMeses: Tmonto;
  End;

  lista = ^nodo;
  nodo = Record
    dato: Factura;
    sig: lista;
  End;

  VCat = array [Tcategoria] Of Tnombre;
  Mt3 = array [Tcategoria] Of real;


Function PromedioAnio (v:Tmonto): real;

Var 
  prom: real;
  i: tmes;
Begin
  prom := 0;
  For i:= 1 To 12 Do
    prom := prom + v[i];
  PromedioAnio := prom/12;
End;




Procedure InsertarOrdenado (Var l:lista; F:factura);

Var 
  nue,act,ant: lista;
Begin
  new(nue);
  nue^.dato := F;
  act := l;
  ant := l;
  While (act <> Nil) And (act^.dato.cod < f.cod) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act = ant) Then
    l := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;



{Programa principal}


Var 
  l,pri,l1,l2,l3: lista;
  Vc: VCat;
  M: Mt3;
  i : Tcategoria;
Begin
  l := Nil;
  l1 := Nil;
  l2 := Nil;
  l3 := Nil;
  cargarLista(l); {Se dispone}
  CargarVector(Vc); {Carga el nombre de las categorias por codigo}
  pri := l;
  For i:= 1 To MaxCat Do
    M[i] := 0;
  While (l <> Nil) Do
    Begin
      If (l^.dato.monto < PromedioAnio(l^.dato.montomeses)) Then
        InsertarOrdenado(l1);
      If (l^.dato.monto > PromedioAnio(l^.dato.montomeses)) And l^.dato.m3 > 1000 Then
        InsertarOrdenado(l2)
      Else
        InsetarOrdenado(l3);
      M[l^.dato.categoria] := M[l^.dato.categoria] + l^.dato.m3;
      l := l^.sig;
    End;
  For j:= 1 To MaxCat Do
    Writeln('Metros cubicos consumidos de la categoria:', Vc[i], 'Son', M[i]);
  liberarMemoria(pri);
  liberarMemoria(l1);
  liberarMemoria(l2);
  liberarMemoria(l3);
End.
