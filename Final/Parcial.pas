
Program Parcial;

Const 
  CORTE = -1;
  DIMF = 100;

Type 
  RangoCodP = 1..1000;
  CodP = -1..1000;

  CodC = 1..100;
  d = 1..31;
  m = 1..12;
  h = 1..24;

  TFecha = Record
    Dia: d;
    Mes: m;
    anio: integer;
  End;

  Vec_NomP = array [RangoCodP] Of String; {guarda el nombre en la pos del cod programa, SE DISPONE}

  Transmicion = Record
    Cod_Programa: CodP;
    Cod_Canal: CodC;
    Fecha: TFecha;
    hora: h;
    duracion: Integer;
  End;

  Lista = ^nodo;
  nodo = Record
    dato : Transmicion;
    sig: Lista;
  End;

  Vec_Tiempo = array [RangoCodP] Of Integer;
  vec_Listas = array [1..DIMF] Of lista;

Procedure LeerTransmicion (Var T:Transmicion);

Procedure LeerFecha (Var F:TFecha);
Begin
  readln(F.Dia);
  readln(F.Mes);
  readln(F.anio);
End;

Var 
  F: TFecha;
Begin
  T.diml := 0;
  readln(T.Cod_Programa);
  If T.Cod_Programa <> CORTE Then
    Begin
      T.diml := T.diml+1;
      readln(T.cod_canal);
      readln(T.hora);
      leerfecha(F);
      readln(T.duracion);
    End;
End;

Procedure InsertarAlInicio (Var l:Lista; T:Transmicion);

Var 
  nue: Lista;
Begin
  new(nue);
  nue^.dato := T;
  nue^.sig := l;
  l := nue;
End;

Procedure CargarLista (Var l:Lista);

Var 
  T: Transmicion;
Begin
  LeerTransmicion (T);
  While T.Cod_Programa <> CORTE Do
    Begin
      InsertarAlInicio(l,T);
      LeerTransmicion(T);
    End;
End;

Function SumaDig (n:Integer): Integer;

Var 
  Suma: Integer;
  dig: Integer;
Begin
  suma := 0;
  While n <> 0 Do
    Begin
      dig := n Mod 10;
      suma := suma + dig;
      n := n Div 10;
    End;
  SumaDig := Suma;
End;

Procedure InicializarVector(Var v2:Vec_Tiempo);

Var 
  i: Integer;
Begin
  For i:= 1 To 1000 Do
    v[i] := 0;
End;

Procedure CargarVecTiempo (Var v2:Vec_Tiempo; l:Lista); {Vector que guarda el tiempo por cada porgrama}

Var 
Begin
  InicializarVector(v2);
  v2[l^.dato.Cod_Programa] := v2[l^.dato.Cod_Programa] + l^.dato.duracion;
End;

Procedure InformarMayorTiempo (l:Lista; v:Vec_NomP; v2:Vec_Tiempo );

Var 
  horas: Integer;
  Max1,Max2: integer;
  NomMax1,NomMax2: String;

Begin
  max1 := -1;
  Max2 := -1;
  While l <> Nil Do
    Begin
      horas := v2[l^.dato.Cod_Programa] Div 60; {Calcula las Horas (B) ,pasa de min a horas}
      If horas > max1 Then
        Begin
          Max2 := Max1;
          NomMax2 := v[l^.dato.Cod_Programa];
          Max1 := horas;
          NomMax1 := v[l^.dato.Cod_Programa];
        End;
      If horas > Max2 Then
        Begin
          Max2 := horas;
          NomMax2 := v[l^.dato.Cod_Programa];
        End;
    End;
  write(max1,nomMax1);
  write(max2,NomMax2);
End;



Procedure InsertarOrdenado (Var l: lista, T:tramision);

Var 
  ant,act,nue: Lista;
  encontre: Boolean;
Begin
  encontre := False;
  ant := l;
  act := l;
  new(nue);
  nue^.dato := T;
  While (act <> Nil) And Not encontre Do
    Begin
      If (T.duracion) < act ^.dato.duracion Then
        encontre := true
      Else
        Begin
          ant := act;
          act := act^.sig;
        End;
    End;
  If act = l Then
    Begin
      nue^.sig := l;
      l := nue;
    End;
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;

Procedure InicializarListas (Var v3:vec_Listas);

Var 
  i: integer;
Begin
  For i:= 1 To DIMF Do
    v[i] := Nil;
End;

Procedure CargarVecListas (Var v3:vec_Listas; l: lista);

Var 
  T: Transmicion;
Begin
  T := l^.dato;
  InsertarOrdenado(v3[l^.dato.Cod_Canal],T);
End;


Procedure LiberarMemoria (Var l:lista);

Var ant: lista;
Begin
  While l <> Nil Do
    Begin
      ant := l;
      l := l^.sig;
      dispose (ant);
    End;
End;


Procedure RecorrerLista (l:Lista; v:Vec_NomP);

Var 
  v2: Vec_Tiempo;
  v3: vec_Listas;


Begin
  InicializarListas(v3);
  While L <> Nil Do
    Begin
      If (SumaDig(l^.dato.Cod_Programa) Mod 2 = 0) And (SumaDig(l^.dato.Cod_Canal) Mod 2 = 0) Then {A}
        writeln(v[l^.dato.Cod_Programa]);
      CargarVecTiempo(v2,l);
      InformarMayorTiempo(l,v,v2); {B}
      CargarVecListas(v3,l);
      l := l^.sig;
    End;
End;

Var 
  l: lista;
  v: Vec_NomP;
  i: integer;
  v3: vec_Listas;

Begin
  l := Nil;
  CargarLista(l);
  cargarVector(v); {se dispone}
  RecorrerLista(l,v);
  LiberarMemoria(l);
  For i:= 1 To DIMF Do
    liberar_memoria(v3[i]);
End;
