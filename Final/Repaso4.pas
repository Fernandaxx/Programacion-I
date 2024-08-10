
Program Repaso4;

Const 
  MaxCalle = 122;

Type 
  Tcalle = 1..MaxCalle;
  TMes = 1..12;

  Tfecha = Record
    Dia: 1..31;
    Mes: TMes;
    Anio: integer;
  End;
  Tdireccion = Record
    calle: Tcalle;
    numero: integer;
    piso: Integer;
    departamento: Integer;
  End;

  Paquete = Record
    FechaEnvio: Tfecha;
    Entregado: Boolean;
    Direccion: Tdireccion;
  End;

  Lista = ^nodo;

  nodo = Record
    dato: paquete;
    sig: lista;
  End;

  vector = array [Tcalle] Of integer;
  vectorMes = array [Tmes] Of integer;
  vectorListas = array [11..20] Of Listas;

Procedure InformarMes (m:TMes);
Begin
  writeln('el nombre del mes con mayor cantidad de paquetes enviados es: ');
  Case m Of 
    1: writeln('enero');
    2: writeln('febrero');
    3: writeln('marzo');
    4: writeln('abril');
    5: writeln('mayo');
    6: writeln('junio');
    7: writeln('julio');
    8: writeln('agosto');
    9: writeln('septiembre');
    10: writeln('octubre');
    11: writeln('noviembre');
    12: writeln('diciembre');
  End;
End;


Procedure InformarA_B (V:vector;Vm:vectorMes);

Var 
  i : Tcalle;
  j,MesMax: TMes;
  max: Integer;

Begin
  For i := 1 To Maxcalle Do
    writeln ('Envios Realizados Por la calle', i , v[i]);
  max := -1;
  For j:= 1 To 12 Do
    Begin
      If Vm[j] > Max Then
        Begin
          max := Vm[j];
          MesMAx := j;
        End;
    End;
  InformarMes(MesMax);
End;

Procedure Inicializar(Var v:vector;Var Vm:vectorMes;Var Vl:vectorListas);

Var 
  i: Tcalle;
  j: TMes;
  k: Integer;

Begin
  For i := 1 To MaxCalle Do { Inicializar Vector de Calles}
    v[i] := 0;
  For j := 1 To 12 Do{ Inicializar Vector de Meses}
    Vm[j] := 0;
  For k:= 11 To 20 Do { Inicializar Vector de Listas}
    Vl[k] := Nil;
End;


Procedure InsertarOrdenado (Var l:Lista; P:Paquete);  {REVISAR}

Var 
  nue,act,ant: lista;
Begin
  new(nue);
  nue^.dato := p;
  act := l;
  ant := l;
  While (act <> Nil) And (act^.dato.Direccion.numero < p.Direccion.numero) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If ant = act Then
    l := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;


Procedure LiberarMemoria (Var l:lista);

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

Procedure borrarElemento (Var pri,l; ant:lista);

Var 
  aux: lista;
Begin
  If (L = pri) Then  {Elimina la primera posicion}
    pri := l^.sig
  Else
    Begin
      ant := l^.sig;
      aux := l;
      l := l^.sig;
      Dispose(aux);
    End;
End;



//Programa Principal

Var 
  pri, L ,ant : lista;
  V: vector;
  Vm: vectorMes;
  Vl: VectorListas;

  k: integer;

Begin
  l := Nil;
  cargarLista(l); {se dispone}
  Inicializar(v,Vm,Vl);
  pri := l;
  While (l <> Nil ) Do
    Begin
      V[L^.dato.Direccion.calle] := V[L^.dato.Direccion.calle] + 1;
      Vm[L^.dato.FechaEnvio.Mes] := Vm[L^.dato.FechaEnvio.Mes] + 1;
      If (l^.dato.Direccion.calle >= 11) And (l^.dato.Direccion.calle >= 20) Then
        InsertarOrdenado(vl[l^.dato.Direccion.calle],l^.dato);
      If Not(l^.dato.Entregado) Then
        borrarElemento(pri,l,ant)
      Else
        Begin
          ant := l;
          l := l^.sig;
        End;
    End;
  InformarA_B(v,Vm);
  liberarMemoria(pri);
  For k:= 1 To 10 Do
    liberarMemoria(Vl[k]);


End.
