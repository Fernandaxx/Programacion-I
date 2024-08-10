
Program dos;

Const 
  maxs = 99;
  dias = 31;
  meses = 12;
  horas = 23;
  minutos = 59;

Type 
  rangos = 1..maxs;
  hora = 1..horas;
  mn = 1..minutos;
  dia = 1..dias;
  mes = 1..meses;

  f = Record
    d: dia;
    m: mes;
    anio: integer;
  End;

  h = Record
    hs: hora;
    mn: min;
  End;

  vector = array[1..60] Of char;

  spam = Record
    id: integer;
    mail: vector;
    fecha: f;
    hora: h;
    ps: rangos;
  End;

  lista = ^nodo;
  nodo = Record
    dato: spam;
    sig: lista;
  End;
  vectorD = array[1..10] Of lista;

Procedure eliminar(Var act,l,ant:lista;)

Var aux: lista;
Begin
  If (act=l)Then
    Begin
      l := l^.sig;
      aux := act
             act:=l;
      dispose(aux);
    End
  Else
    Begin
      aux := act;
      act := act^.sig;
      ant^.sig := act;
      dispose(aux);
    End;
End;

Procedure InsertarNodo (Var pri: Lista; dato:spam);

Var ant, nue, act: Lista;
  encontre: boolean;
Begin
  encontre := false;
  new (nue);
  nue^.datos := dato;
  act := pri;
  ant := pri;
  While (act<>Nil) And (Not encontre)) Do {MEJOR}
    Begin
      If (dato.ps <=act^.datos.ps)
        Then encontre := true
      Else
        Begin
          ant := act;
          act := act^.sig ;
        End;
    End;
  If (ant = act) Then pri := nue
  Else  ant^.sig  := nue;
  nue^.sig := act ;
End;
End;


Var 
  l,act,ant: lista;
  i: integer
     conjl: set Of char;
  conjn: set Of integer;
  cumple: boolean;
  vD: vectorD;
Begin
  conjl := ['a'..'z','A'..'Z'];
  conjn := ['0'..'9'];
  ant := l;
  act := l;
  i := 1;
  While (act<>Nil) Do
    Begin
      cumple := false;
      While ((act^.dato.mail[i]In conjl)Or(act^.dato.mail[i]In conjn)) Do
        Begin
          ccaa := ccaa+1;
          i := i+1;
        End;
      If (act^.dato.mail[i]<>'@')Then i := i+1;
      While ((act^.dato.mail[i]In conjl)Or(act^.dato.mail[i]In conjn)) Do
        Begin
          ccda := ccda+1;
          i := i+1;
        End;
      If (act^.dato.mail[i]<>'.')Then i := i+1;
      While ((act^.dato.mail[i]In conjl)) Do
        Begin
          ccdp := ccdp+1;
          i := i+1;
        End;
      If ((ccaa>3)And(ccda>3)And(ccdp>=2 And ccdp<=3))Then cumple := true;
      eliminar(act,l,ant);
      If ((act^.dato.ps<min1)And((act^.dato.f.d=30)And(act^.dato.f.m=6)And(act^.dato.f.anio=2021))Then
        Begin
          min1 := act^.dato.ps;
          idmin := act^.dato.id;
        End;
      Case act^.dato.ps Of 
        0..9: InsertarNodo(vD[1],act^.dato);
        10..19: InsertarNodo(vD[2],act^.dato);
        20..29: InsertarNodo(vD[3],act^.dato);
        30..39: InsertarNodo(vD[4],act^.dato);

      End;
    End;

End.
