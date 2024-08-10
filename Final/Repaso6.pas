
Program Repaso6;

Const 
  maxcod = 10;
  FIN = 'zzz';

Type 
  Tcod = 1..maxcod;
  Tnombre = string[15];
  Tedad = 16..80;

  Tinscripcion = Record
    dni: Integer;
    Nombre: Tnombre;
    Apellido: Tnombre;
    Edad: Tedad;
    Cod: Tcod;
  End;

  Cursos = array [Tcod] Of Integer; {Se dispone con la capacidad de cada curso}

  lista = ^nodo;
  nodo = Record
    dato: Tinscripcion;
    sig: lista;
  End;

Procedure LeerInscripto(Var D:Tinscripcion);
Begin
  ReadLn(D.Apellido);
  If (d.Apellido) <> Fin Then
    Begin
      readln(D.dni);
      ReadLn(D.Nombre);
      ReadLn(D.Edad);
      ReadLn(D.Cod);
    End;
End;


Procedure InsertarAlInicio (Var l:lista; D:Tinscripcion);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.dato := D;
  nue^.sig := l;
  l := nue;
End;


Procedure cargarlista (Var L:lista; C:Cursos; Var V:Cursos);

Var 
  D: Tinscripcion;
Begin
  LeerInscripto(D);
  If (C[l^.dato.Cod] >= V[l^.dato.Cod]) Then
    Begin
      While (D.Apellido <> FIN ) Do
        Begin
          InsertarAlInicio(l,D);
          LeerInscripto(D);
        End;
      v[l^.dato.Cod] := v[l^.dato.Cod] + 1;
    End
  Else WriteLn('El curso no tiene cupos');
End;

Procedure LiberarMemoria(Var l: lista);

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

{Programa Principal}

Var 
  L,pri: lista;
  C,V: Cursos;
  cant: integer;


Begin
  l := Nil;
  CargarVector(c); {se dispone}
  For i:= 1 To maxcod Do
    v[i] := 0;
  cargarlista(l,C,V);
  pri := l;
  cant := 0;
  While (l <> Nil) Do
    Begin
      If (l^.dato.Cod = 2) And (l^.dato.Edad <= 30) And (l^.dato.Edad <= 35) Then
        cant := cant + 1;
      l := l^.sig;
    End;

  For i:= 1 To maxcod Do
    Begin
      If v[i]<> C[i] Then
        writeln('El cupo no se completo, curso:', i);
    End;
  Writeln('Inscripos del curso 2 entre 30 y 35 ', cant);
  liberarMemoria(pri);
End.

