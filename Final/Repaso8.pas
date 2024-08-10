
Program Repaso8;

Const 
  Maxcombo = 12;

Type 
  TcodCombo = 1..Maxcombo;
  TSemana = 1..7;
  Tdescripcion = string[50];

  pedidos = Record
    CodCombo: TcodCombo;
    DiaSem : TSemana;
    Precio: real;
  End;

  lista = ^nodo;
  nodo = Record
    dato: pedidos;
    sig: lista;
  End;

  VDescripcion = array [TcodCombo] Of Tdescripcion;
  VDescuento = array [Tsemana] Of real;
  VMax = array [TcodCombo] Of Integer;
  vectorListas = array [1..4] Of lista;


Procedure InicializarListas (vl:vectorListas);

Var i: Integer;
Begin
  For i := 1 To 4 Do
    vl[i] := Nil;
End;
Procedure InicializarVectores (Var Factur:VDescuento; Var MasVend:VMax);

Var 
  i: TSemana;
  j: TcodCombo;
Begin
  For i:= 1 To 7 Do
    Factur[i] := 0;
  For j:= 1 To Maxcombo Do
    MasVend[j] := 0;
End;

Procedure CombosMax (MasVend:VMax; Var D1,D2:Tdescripcion);

Var 
  i: TcodCombo;
  max1,max2: integer;
Begin
  For i:= 1 To Maxcombo Do
    If MasVend[i] > max1 Then
      Begin
        max2 := max1;
        D2 := D1;
        max1 := MasVend[i];
        D1 := i;
      End
    Else
      If (MasVend[i] > max2) Then
        Begin
          max2 := MasVend[i];
          D2 := i;
        End;
End;

Procedure InsertarAlFinal (Var l:lista;p:pedidos);

Var 
  act,ant,nue: lista;
Begin
  new(nue);
  nue^.dato := p;
  nue^.sig := Nil;
  act := l;
  If (act = Nil) Then
    l := nue
  Else
    Begin
      While (act <> Nil) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      ant^.sig := nue;
    End;
End;

Procedure generarListas (Var vl:vectorListas; P:pedidos);
Begin
  If p.Precio < 100 Then
    InsertarAlFinal(vl[1],p)
  Else
    insetarAlfinal(cl[2],p);
  If p.CodCombo >= 1 And p.CodCombo >= 3 Then
    insertarAlfinar(vl[3],P)
  Else insertaralfinal(vl[4],p)
End;

Procedure liberarMemoria(Var l:lista);

Var 
  aux: lista;
Begin
  While L<> Nil Do
    Begin
      aux := l;
      l := l^.sig;
      dispose(aux);
    End;
End;

Var 
  l,pri: lista;
  Combos: VDescripcion;{Vector de descripcion por codigo}
  Descu: VDescuento;{Vector de descuentos por dia}
  Factur: VDescuento; {para calcular Facturado por dia}
  MasVend: VMax; {Guarda por codigo cuandos combos se vendieron}
  vl: vectorListas;
  monto1,monto2: Integer;
  D1,D2: Tdescripcion;
  h,i: integer;

Begin
  l := Nil;
  InicializarListas(vl);
  cargarLista(l); {se dispone}
  CargarVector(Combos); {Cargar la descripcion por Cod de combo, se dispone}
  CargarVector(Descu); {carga el descuento por dia de la semana, se dispone}
  InicializarVectores(Factur,MasVend);
  pri := l;
  While (l <> Nil) Do
    Begin
      Factur[l^.dato.DiaSem] := (Factur[l^.dato.DiaSem] + l^.dato.Precio) - Descu[l^.dato.DiaSem]; {Calcula el monto facuturado con descuento}
      MasVend[l^.dato.CodCombo] := MasVend[l^.dato.CodCombo] +1; {Guarda la cantidad de combos vedidios de cada cod}
      generarListas(vl,l^.dato);
    End;
  CombosMax(MasVend,D1,D2)  {Calcula los dos combos maximos, guarda el monto y codigo para la descripcion }
  For i:= 1 To 7 Do
    Writeln('Facturado el dia de la semana: ', i, Factur[i] );
  WriteLn('Descripcion del combo1 mas vendido', MasVend[D1],'monto', ????);
  WriteLn('Descripcion del combo2 mas vendido', MasVend[D2],'monto', ????);

  liberarMemoria(pri);
  For h:= 1 To 4 Do
    liberarmemoria(vl[h]);
End.
