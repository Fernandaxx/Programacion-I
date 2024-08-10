
Program Repaso9;

Const 
  PAQUETES = 300;
  CORTE = 0;

Type 

  Tnombre = String[50];
  RangoPaquetes = 1.. PAQUETES;

  Cliente = Record
    Numero: Integer;
    Apellido: Tnombre;
    Nombre: Tnombre;
    DNI: Integer;
    Domicilio: Tnombre;
  End;

  Lista = ^nodo;
  Nodo = Record
    dato: Cliente;
    sig: lista;
  End;

  Paquete = Record
    Destino: Tnombre;
    Plazas: integer;
  End;

  Vector = array [RangoPaquetes] Of Paquete;

  Venta = Record
    DNI: Integer;
    CodigoPaquete: RangoPaquetes;
    Plazas: Integer;
  End;

  Lista1 = ^nodo1;
  nodo1 = Record
    dato: Venta;
    sig: Lista1;
  End;

  VMax = array [RangoPaquetes] Of Integer;

Procedure LeerVenta (Var d:Venta);
Begin
  Read(d.DNI);
  If (d.DNI <> CORTE) Then
    Begin
      read(d.CodigoPaquete);
      ReadLn(d.Plazas);
    End;
End;

Procedure InsertarALInicio (Var l:Lista1;d:Venta);

Var 
  nue: Lista1;
Begin
  New(nue);
  nue^.dato := d;
  nue^.sig := l;
  l := nue;
End;

Function ExisteDNI (l:lista; n:Integer): Boolean;

Var 
  encontre: Boolean;
Begin
  encontre := False;
  While (l <> Nil) And Not (Encontre) Do
    Begin
      If (l^.dato.DNI = n) Then
        encontre := true
      Else l := l^.sig;
    End;
  ExisteDNI := encontre;
End;

Function HayPlazas(disponible:Integer; pedidas:Integer): Boolean;
Begin
  If disponible >= pedidas Then
    HayPlazas := True;
End;



Procedure CargarLista1 (Var l1:Lista1; l:lista ;Var v:Vector; Var plazas: VMax);

Var 
  d: Venta;
  error1: Integer;
  error2: integer;
Begin
  LeerVenta(d);
  error1 := 0;
  error2 := 0;
  While d.DNI <> CORTE Do
    Begin
      If (ExiteDNI(l,d.DNI)) And (HayPlazas(v[d.CodigoPaquete].Plazas,plazas[d.CodigoPaquete])) Then
        Begin
          InsertarALInicio(l1,d);
          Leerventa(d);
          plazas[d.CodigoPaquete] := plazas[d.CodigoPaquete] + d.Plazas;
        End
      Else If Not(ExiteDNI(l,d.DNI)) Then
             Begin
               WriteLn('El DNI no se escuentra en el sistema');
               error1 := error1 +1;
             End
      Else
        Begin
          WriteLn('No hay plazas suficientes');
          error2 := error2 +1;
        End;
      Write(error1,error2);
    End;
  Procedure MaxPlazas (v: Vector; Var C1,C2:RangoPaquetes);

  Var 
    i: RangoPaquetes;
    max1;
    max2: Integer;
  Begin
    ma1 := -1;
    max2 := -1;
    For i:= 1 To PAQUETES Do
      Begin
        If v[i].Plazas > max1 Then
          Begin
            max2 := max1;
            C2 := C1;
            max1 := v[i].Plazas;
            C1 := i;
          End
        Else
          If  v[i] > max2 Then
            Begin
              max2 := v[i];
              c2 := i;
            End;
      End;
  End;
  {Programa principal}

  Var 
    l, act: Lista; {Lista cargada con la informacion de clientes, se dispone}
    L1,act1: lista1; {Lista Que se carga con la venta de paquetes}
    Plazas: VMax; {Vector para calcular las 2 mayor cantidad de plazas}
    V: Vector; {Vector cargado con la informacion de los paquetes, se dispone}
    c1,c2: RangoPaquetes;

  Begin
    l := Nil;
    l1 := Nil;
    Cargarlista(l); {Se dispone}
    act := l;
    CargarVector(v); {se dispone}
    CargarLista1(l1);
    For i:= 1 To PAQUETES Do
      Plazas[i] := 0;
    CargarLista1 (l1,l,v,plazas);
    act1 := l1;
    MaxPlazas(v,c1,c2);
    WriteLn('codigo de los paquetes con mayor cantidad de plazas:', c1,c2);
  End.
