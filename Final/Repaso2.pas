
Program Repaso2;

Const 
  MaxCat = 4;
  MaxDirec = 70;

Type 
  rango = 0..MaxDirec;
  tnombre = string[30];
  tcategoria = 1..MaxCat;
  tdireccion = array [1..MaxDirec] Of Char;
  conjunto = set Of char;


  Dato = Record
    Nombre: tnombre;
    Apellido: Tnombre;
    categoria: tcategoria;
    Monto: real;
    direccion: tdireccion;
  End;

  vector = array [tcategoria] Of real; {Se dispone con el monto extra}

{}
Function cumpleDireccion (Dr:tdireccion): Boolean;

Var 
  Cumple: Boolean;
  Diml: rango;
  A: conjunto;

Begin
 A:= ['A'..'G'] + ['0','2','4','6','8'];
 while Dr[]
Diml:= 0;


End;
}

Procedure RecorrerLista (D:dato; Var MontoR:vector; Extra:vector; Var Nombre:tnombre; Var Max:integer);
Begin
  MontoR[D.categoria] := MontoR[D.categoria] + D.Monto + Extra[D.categoria];
  If (D.categoria = 2) Then
    Begin
      If (D.Monto > Max) Then
        Begin
          Max := D.Monto;
          Nombre := D.Nombre;
        End;
    End;
End;


{Programa Principal}

Var 

  L,pri: lista;
  MontoR, Extra : vector;
  Nombre: tnombre;
  Max: integer;

Begin
  Max := 0;
  L := Nil;
  CargarLista(l); {se dispone}
  CargarExtra(Extra); {se dispone}
  InicializarVector(MontoR);
  pri := l;
  While (l <> Nil) Do
    Begin
      RecorrerLista(L^.dato, MontoR, Extra, Nombre, Max)
      l := l^.sig;
    End;
  If (Max = 0) Then
    writeln('Nadie pago servicio de cable categoria 2')
  Else
    writeln ('Nombre de la persona que mas pago por el servicio de categoria 2:' ; Nombre);

End.
