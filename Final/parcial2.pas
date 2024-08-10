
Program parcial2;

Const 
  Maxcod = 200;

Type 
  Tcodigo = 1..Maxcod;
  Tubicacion = 1..12;
  Tnombre = String [20];

  entrada = Record
    numero: integer;
    precio: real;
    Codigo: Tcodigo;
    Ubicacion: Tubicacion ;
  End;

  lista = ^nodo; {se dispone ordenada por codigo}
  nodo = Record
    dato: entrada;
    sig: lista;
  End;
  Tfecha = Record
    Dia: 1..31;
    Mes: 1..12;
    Anio: Integer;
  End;

  Ttiempo = Record
    hora: 0..23;
    min: 1..59;
  End;

  espectaculo = Record
    nombre: Tnombre;
    Fecha: Tfecha;
    Tiempo: Ttiempo;
  End;
  vector = array [Tcodigo] Of espectaculo; {Se dispone}
  VendidasxEspec = array [Tcodigo] Of integer;

  VecListas = array [Tubicacion] Of lista;


Function cumpleB (Num:integer): Boolean;

Var 
  cantPar,cantImpar,dig: Integer;
Begin
  cumpleB := False;
  cantPar := 0;
  cantImpar := 0;
  While ( num <> 0) Do
    Begin
      dig := num Mod 10;
      If (dig Mod 2 = 0 ) Then
        cantPar := cantPar + 1
      Else
        cantImpar := cantImpar + 1;
      num := num Div 10;
    End;
  If (cantPar = cantImpar) Then
    cumpleB := true;
End;

Procedure MasVendidas (ve:VendidasxEspec;v:vector; Var NomEsp1,NomEsp2: Tnombre; Var Monto1,Monto2: real; precio: real);

Var 
  Max1,Max2: Integer;
  i: Tcodigo;
Begin
  Max1 := -1;
  Max2 := -1;
  For i := 1 To Maxcod Do
    Begin
      If Ve[i] > Max1 Then
        Begin
          Max2 := Max1;
          NomEsp2 := NomEsp1;
          Monto2 := Ve[i]*precio;
          Max1 := Ve[i];
          NomEsp1 := V[i].nombre;
          Monto1 := Ve[i]*precio;
        End;
      If Ve[i] > Max2 Then
        Begin
          Max2 := Ve[i];
          NomEsp2 := V[i].nombre;
          Monto2 := Ve[i]*precio;
        End;
    End;
End;
Procedure InsertarAlFinal (Var l:lista; E:entrada);

Var 
  nue, ant: lista;
Begin
  new(nue);
  nue^.dato := E;
  nue^.sig := Nil;
  If l = Nil Then
    l := nue
  Else
    Begin
      ant := l;
      While (ant^.sig <> Nil) Do
        ant := ant^.sig;
      ant^.sig := nue;
    End;
End;

Procedure procesos (E:entrada;v:vector; Var ve:VendidasxEspec; Var NomEsp1,NomEsp2: Tnombre; Var Monto1,Monto2: real);
Begin
  Ve[E.Codigo] := Ve[E.Codigo] + 1;
  If cumpleB(E.numero) Then
    Writeln('El numero de entrada  tiene la misma cant de dig pares e impares', E.numero);
  MasVendidas (ve,v,NomEsp1,NomEsp2 ,Monto1,Monto2, E.precio);
End;


Procedure InicializarListas (Var Vl: VecListas);

Var 
  i: Tubicacion;
Begin
  For i:= 1 To 12 Do
    Vl[i] := Nil
End;


Procedure LiberarMemoria(Var l:lista);

Var 
  aux: lista;
Begin
  While l <> Nil Do
    Begin
      aux := l;
      l := l^.sig;
      dispose(aux);
    End;
End;
Procedure inicializarVector(Var Ve:VendidasxEspec);

Var i: Tcodigo;
Begin
  For i := 1 To Maxcod Do
    ve[i] := 0;
End;

  {Programa Principal}

Var 
  l,pri: lista;
  V: vector;
  Ve: VendidasxEspec;
  i: Tcodigo;
  NomEsp1,NomEsp2: Tnombre;
  Monto1,Monto2: real;
  Vl: VecListas;

Begin
  l := Nil;
  cargarlista(l); {se dispone}
  CargarVector(V);{se dispone}
  inicializarVector(Ve);
  InicializarListas(Vl);
  pri := l;
  While (L <> Nil) Do
    Begin
      procesos(l^.dato,v,Ve,NomEsp1,NomEsp2,Monto1,Monto2);
      If (V[E.cod].Fecha.Dia = 9) And (V[E.cod].Fecha.Mes = 11 ) And (V[E.cod].Fecha.Anio = 2022) Then
        InsertarAlFinal(vl[L^.dato.Ubicacion],l^.dato);
      l := l^.sig;
    End;
  For i := 1 To Maxcod Do
    writeln('Entradas vendidas del espectaculo', i , v[i] ); {informar A}
  WriteLn('Nombre de los espectaculos mas vendidos', NomEsp1 , NomEsp2); {Informar C}
  WriteLn('Monto de los espectaculos mas vendidos', Monto1 , Monto2);
  LiberarMemoria(pri);
  For i := 1 To 12 Do
    liberarMemoria(vl[i]);
End.
