
Program Repaso3;

Const 
  AnioMax = 2000;
  AnioMin = 1970;
  COrigen = 'Brandsen';
  Carreras = 3;

Type 

  Tnombre = String[30];
  cod = string[5];
  rangoAnio = AnioMin..AnioMax;
  TFechaNac = Record
    Dia: 1..31;
    Mes: 1..12;
    Anio: rangoAnio;
  End;

  Ingresantes = Record
    Nombre: tnombre;
    Apellido: tnombre;
    Origen: tnombre;
    FechaNac: TFechaNac;
    Titulo: Boolean;
    Carrera: Cod;
  End;

  Lista = ^nodo;
  nodo =  Record
    dato: Ingresantes;
    sig: Lista;
  End;
  VectorA = array [rangoAnio] Of Integer;
  VectorC = array [1..carreras] Of integer;


{Programa Principal}

Function AMAX (Va:VectorA): Integer;

Var 
  i: rangoAnio;
  max: Integer;
Begin
  max := 0;
  For i := AnioMin To AnioMax Do
    Begin
      If Va[i] > max Then
        Begin
          max := Va[i];
          AMAX := i;
        End;
    End;
End;

Procedure MaxCarrera (Vc: VectorC);

Var 
  i: Integer;
  max,MaxCar: integer;
Begin
  max := 0;
  For i:= 1 To carreras Do
    If Vc[i] > max Then
      Begin
        max := Vc[i];
        MaxCar := i;
      End;
  Case MaxCar Of 
    1 : writeln ('Carrera con mayor cantidad de ingresantes APU');
    2 : writeln ('Carrera con mayor cantidad de ingresantes LI');
    3 : writeln ('Carrera con mayor cantidad de ingresantes LS');
  End;
End;
{Procedure BorrarElemento (Var l: lista,Var act: lista ,Var ant:lista);

Var 
  ok: Boolean;
Begin
  ok := false;
  If act <> l Then
    Begin
      ant^.sig  := act^.sig;
      ok := true;
    End
  Else l := act^.sig;
  dispose(act);
  If ok Then
    Begin
      act := ant^.sig;
    End
  Else act := l^.sig;
End;}

Procedure RecorrerLista (Var L:lista; Var Va:VectorA; Var Vc:
                         VectorC);

Var 
  act,ant: lista;
Begin
  act := l;
  If (L^.dato.Origen = COrigen) Then
    writeln(L^.dato.Apellido);
  Va[L^.dato.FechaNac.Anio] := Va[L^.dato.FechaNac.Anio] + 1;
  Case I.Carrera Of 
    'APU' : Vc[1] := Vc[1] + 1;
    'LI' : Vc[2] := Vc[2] + 1;
    'LS' : Vc[3] := Vc[3] + 1;
    Else writeln('la carrera ingresada no es valida');
  End;
  If Not (L^.dato.titulo) Then
    BorrarElemento(l,act,ant);
    ant:= act;
End;



Var 
  L,pri : lista;
  Va: VectorA;
  Vc: VectorC;
  i, j : Integer;

Begin
  l := Nil;
  cargarlista(l); {se dispone}
  For i := AnioMin To AnioMax Do
    Va[i] := 0;
  For i := 1 To carreras Do
    Vc[i] := 0;
  pri := l;
  While (l <> Nil) Do
    Begin
      RecorrerLista(L^.dato, Va, Vc);
      l := l^.sig;
    End;
  Writeln('Anio en que mas ingresantes nacieron' AMAX(Va));
  MaxCarrera(Vc);
  LiberarMemoria(pri);

End.
