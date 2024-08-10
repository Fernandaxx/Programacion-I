
Program PARCIAL_1.pas;

Const FIN = -1;
  maxcodep = 1000;
  maxcodec = 100;

Type 
  fecha = Record
    dia: 1..31;
    mes: 1..12;
    año: 2000 ..2022;
  End;

  trasmision: Record
    codep: 1..maxcodep;
    codec: 1..maxcodec;
    dia: fecha;
    hora: 1..24;
    duracion: real;{suponiendo que una tramision dure mas de una hora y no sea en minuto exacto}
  End;
  lista = ^tramisiones;
  tramisiones = Record
    datos: tramision;
    sig: lista;
    vector = array [1..maxcodep] Of integer;
    listas = array [1..maxcoedc] Of lista;
    vectordado = array [1..maxcodep] Of nombre; {vectordado}


{resolucion A}

    Procedure agrega_elemento (Var l:lista; d:trasmision; Var ult:lista);

    Var 
      nue: lista;
    Begin
      new(nue);
      nue^.sig := Nil;
      nue^.datos := d;
      If (l=Nil) Then
        Begin
          l := nue;
        End
      Else
        Begin
          ult^.sig := nue;
          ult := nue;
        End;
    End;
    Procedure cargar_lista(Var l:lista);

    Var ult: lista;
      d: trasmision;
    Begin
      writeln ('ingrese el codigo del programa');
      readln(d.codep);
      While (d.codep<> FIN) Do
        Begin
          writeln('ingrese codigo del canal');
          readln(d.codec);
          writeln ( 'ingrese el dia de la tramision');
          readln(d.fecha.dia);
          writeln('ingrese el mes de la trasmision');
          readln(d.fecha.mes);
          writeln('ingrese el año de la trasmicion');
          readln(d.fecha.año);
          writeln('ingrese la duracion en minutos de la trasmicion');
          readln(a.duracion);
          agrega_elemento(l,d);
          writeln('ingrese el codigo del programa');
          readln(a.codep);
        End;
    End;
{resolucion B}

    Procedure nombres_pares(l:lista;vecd:vectordado);

    Var sumap: integer;
      sumac: integer;
      numerop: integer;
      numeroc: integer;
    Begin
      sumap := 0;
      sumac := 0;
      numerop := l^.datos.codep;
      numeroc := l^.datos.codec;
      While (numerop <> 0) Do
        Begin
          digito := numerop Mod 10;
          sumap := sumap+digito;
          numerop := numerop Div 10;
        End;
      If ( sumap Mod 2 = 0)Then
        Begin
          While ( numeroc <> 0) Do
            Begin
              digito := numeroc Mod 10;
              sumac := sumac + digito;
              numeroc := numeroc Div 10;
            End;
          If (sumac Mod 2 = 0)Then
            Begin
              writeln(' el nombre de el programa con digitos pares es:',v[l^.datos.codep],)
            End;
        End;
    End;

{resolucion C}

    Procedure inicializar_vector(Var vec:vector);

    Var i: integer;
    Begin
      For i:= 1 To maxcodep Do
        vec[i] := 0;
    End;


    Procedure cargar_vector ( l:lista; Var vec:vector;Var max1,max2:real;code1,code2: integer);
    Begin
      vec[l^.datos.codep] = vec[l^.datos.codep] + l^.datos.duracion;
      max1 := -1;
      max2 := -1;
      If (l^.dato.duracion> max1)Then
        Begin
          max2 := max1;
          max1 := l^.datos.duracion;
          code2 := code1;
          code1 := l^.datos.codep;
        End;
      If (l^.datos.duracion>max2)Then
        Begin
          max2 := l^.datos.duracion;
          code2 := l^.datos.codep;
        End;
    End;

{resolucion D}
    Procedure insertar_ordenado (Var l:lista,d:trasmicion);

    Var act,ant,nue: lista;
    Begin
      new(nue);
      nue^.datos := d;
      nue^.sig := Nil;
      act := l;
      ant := l;
      While (act<>Nil) And (d.duracion>act^.datos.duracion) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If (act=l) Then
        Begin
          nue^.sig := l;
          l := nue;
        End;
      Else
        Begin
          ant^.sig := nue;
          nue^.sig := act;
        End;


    End;

    Procedure inicializar_vectorl( Var vecl:listas);

    Var i: integer;
    Begin
      For i:= 1 To maxcodec Do
        Begin
          vecl[i] := Nil;
        End;
    End;


    Procedure cargar_vectorl (l:listas; Var vecl:listas);

    Var d: trasmision;
    Begin
      d := l^.datos;
      insertar_ordenado(vecl[l^.datos.codec],d);
    End;

    Procedure recorrer (l:lista;vec:vector;vecd:vectordado;vecl:listas);

    Var max1,max2: real;
      code1,code2: integer;
    Begin
      inicializar_vector(vec);{inicializo aca adentro ya que se debe recorrer una sola vez la lista}
      inicializar_vectorl(vecl);
      While (l<>Nil ) Do
        Begin
          cargar_vectord(vecd);{se dispone}
          nombres_pares(l,vecd);
          cargar_vector(l,vec,max1,max2,code1,code2);
          cargar_vectorl(l,vecl);
          l := l^.sig;
        End;
      writeln(' el canal con mas horas trasmitidas es:',vecd[code1],' con un total de:',max1/60,);
      writeln(' el segundo canal con mas horas trasmitidas es el: ',vecd[code2],' con un total d: ', max2/60);
    End;
    Procedure liberar_memoria(Var l:listas)

    Var 
      act: lista;
    Begin
      While (l<>Nil) Do
        Begin
          act := L;
          l := l^.sig;
          dispose(act);
        End;
    End;

    Var l: lista;
      vec: vector;
      vecl: listas;
      vecd: vectordado;
      d: trasmision;
    Begin
      l := Nil;
      cargar_lista(l);
      recorrer( l,vec,vecd,vecl);
      liberar_memoria(l);
      For i:= 1 To maxcodec Do
        Begin
          liberar_memoria(vecl[i]);
        End;
    End.
