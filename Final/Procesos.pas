
Program procesos;
Procedure AgregarAlInicio (Var pri:lista; num:integer);

Var Nue: Lista;
Begin
  New(nue); {Reservo memoria para mi nodo a agregar}
  nue^.Dato := num; {Guardo el dato en el nodo}
  nue^.sig := pri; {Nuevo se enlaza con el viejo inicio}
  pri := nue; {La lista apunta al nuevo nodo}
End;

Var Pri: lista;
  num: Integer;
Begin {Programa Principal}
  Pri := Nil; {Inicializo la lista}
  Readln(num);
  AgregarAlInicio(Pri,num);
End.


Procedure AgregarAlFinal (Var pri:lista; num:integer);
{RECORRIENDO TODA LA LISTA}

Var Nue,pos: Lista;
Begin
  New(nue); {Reservo memoria para mi nodo a agregar}
  nue^.Dato := num; {Guardo el dato en el nodo}
  nue^.sig := Nil; {Hago que sea el ultmo de la lista}
  If (pri = Nil) Then {En caso de estar vacia la lista}
    pri := nue
  Else
    Begin
      Pos := pri;{Sino esta vacia,recorre al final}
      While (Pos^.sig <> Nil) Do
        pos := pos^.sig;
      pos^.sig := nue;
    End;
End;


Procedure AgregarAlFinal (Var pri, ult:lista; num:integer);
{PUNTERO AL ULTIMO}

Var Nue: Lista;
Begin
  New(nue); {Reservo memoria para mi nodo a agregar}
  nue^.Dato := num; {Guardo el dato en el nodo}
  nue^.sig := Nil; {Hago que sea el ultmo de la lista}
  If (pri = Nil) Then {En caso de estar vacia la lista}
    pri := nue
  Else
    ult^.sig := nue;
  ult := nue;
End;

Procedure LiberarMemoria (Var pri:lista);

Var 
  ant: lista;
Begin
  While (Pri <> Nil) Do
    Begin
      ant := pri;
      pri := Pri^.sig;
      dispose (ant);
    End;
End;

Procedure ImprimirLista (pri: Lista);
Begin
  writeln('-------Lista---------');
  While (Pri <> Nil) Do
    Begin
      Writeln('Numero: ', Pri^.dato);
      Pri := pri^.sig;
    End;
End;


Procedure InsertarNodo (Var pri: lista; D:tdato); {LISTA ORDENADA}

Var 
  Nue,ant,act: lista;
  encontre: Boolean;
Begin
  New(nue); {reservar memoria para nuevo nodo}
  nue^.dato := D; {guardo el dato en el nodo}
  ant := pri;
  act := pri; {inicializo al comienzo de la lista}
  encontre := False;
  While (act <> Nil) And (Not encontre) Do
    Begin
      If (d <= act^.dato) Then
        encontre := true
      Else
        Begin
          ant := act;
          act := act^.sig;
        End;
    End;
  If (ant = act) Then {inserta en la primera posicion}
    pri := Nue
  Else          {Inserta entre dos nodos o al final, en caso de que act =nil}
    Begin
      ant^.sig := nue;
    End;
  nue^.sig := act;
End;


Procedure EliminarNodo (Var pri:lista; D:tdato);

Var 
  ant,act: lista;
  encontre: Boolean;
Begin
  ant := pri;
  Act := pri;
  encontre := False;
  While (act <> Nil) And Not(encontre) Do
    {Recorre hasta encontrar el dato a eliminar}
    Begin
      If (Act^.dato = D) Then
        encontre := true
      Else
        Begin
          ant := act;
          act := act^.sig;
        End;
    End;
  If encontre Then
    Begin
      If (Act = pri) Then  {Caso en que el dato este de primero en la lista}
        pri := pri^.sig
      Else    {Caso en que este de ultimo o entre dos nodos}
        ant^.sig := act^.sig;
      dispose (act);
    End;
End;




Program Parcial1TEMA2;

Const 
  DiaConst = 9;
  MesConst = 11;
  AnioConst = 2022;
  CantEntradasPorListaConst = 1;

Type 
  CodigoType = 1..200;
  UbiType = 1..12;
  Nombre = string[30];
  d = 1..31;
  m = 1..12;
  a = 2020..2022;
  min = 0..59;
  hor = 0..23;

  FechaL = Record
    Dia : d;
    Mes : m;
    Anio : a;
  End;

  HorarioL = Record
    Minuto : min;
    Hora : hor;
  End;

  InfoEspectaculo = Record
    NombreEspectaculo : Nombre;
    Horario : HorarioL;
    Fecha : FechaL;
  End;

  EntradaInfo = Record
    NumeroEntrada : integer;
    Precio : real;
    CodEsp : CodigoType;
    UbiEstadio : UbiType;
  End;

  ListaEntradas = ^nodo;

  Nodo = Record
    Dato : EntradaInfo;
    sig : ListaEntradas;
  End;

  max = Record
    MaxEntradas : integer;
    NomEspec : nombre;
  End;

  vEntradas = Array [1..200] Of integer;
  vListas = array [1..12] Of ListaEntradas;
  vDispone = array [1..200] Of InfoEspectaculo;



Function ParImpar (numero : integer) : boolean;

Var 
  par, impar : integer;

Begin
  par := 0;
  impar := 0;
  While (numero <> 0) Do
    // Hasta que.. (El numero sea igual a 0)
    Begin
      If (((numero Mod 10) Div 2) = 0)
  // Divide y deduce si es par/impar. * Opcional: Se puede usar una variable para guardar el digito y analizarlo despues
        Then par := par + 1            // Si es un digito par, sumamos uno.     
      Else impar := impar + 1;
      // Si es un digito impar, sumamos uno.
      numero := numero Div 10;
      // Pasamos al siguiente digito.
    End;
  If (par = impar)   // Entonces, si tiene la misma cantidad de numeros Impares que Pares. Cumple la consigna (B)
    Then ParImpar := true
  Else ParImpar := false;
End;

Procedure CalcularMaximos (Var max1,max2 : max; Monto : integer; NombreEspectaculo : Nombre);

Begin
  If (monto > max1.MaxEntradas)      // Si mi valor de entrada es mayor que mi maximo, entonces..
    Then
    Begin
      max2.MaxEntradas := max1.MaxEntradas;
      // Guardo mi maximo en el segundo maximo. (Porque pasaria a ser el segundo valor mas alto).
      max2.NomEspec := max1.NomEspec;
      // Actualizo el nombre del segundo maximo por mi primer maximo.
      max1.MaxEntradas := Monto;
      // Actualizo el maximo (Mi valor mas grande).
      max1.NomEspec := NombreEspectaculo;
      // Guardo el nombre del espectaculo en ese maximo.
    End
  Else
    Begin
      If (monto > max2.MaxEntradas)      // Si no es el primer maximo, chequeamos si puede ser el segundo maximo.
        Then
        Begin
          max2.MaxEntradas := Monto;
          // Cumple condicion, actualizamos el segundo valor maximo.
          max2.NomEspec := NombreEspectaculo;
          // Y consigo el nombre de ese maximo (nombre del segundo espectaculo maximo).
        End;
    End;
End;

Procedure GenerarListaOrdenada (Var l : ListaEntradas; datoLista : EntradaInfo);

Var 
  nue, ant, act : ListaEntradas;

Begin
  new(nue);
  // Generamos un nuevo nodo.
  nue^.dato := datoLista;
  // Asignamos los datos al nodo.
  act := l;
  // Asignamos el actual y el anterior.
  ant := l;

  While (act <> Nil) And ((act^.dato.CodEsp) > (datoLista.CodEsp)) Do
    // Recorremos la lista hasta un punto.
    Begin
      ant := act;
      act := act^.sig;
    End;

  If (act = l)  // Si es la primera posicion entonces..
    Then
    Begin
      nue^.sig := l;
      // Nuestra nueva lista va a apuntar a la lista anterior.
      l := nue;
      // Nuestra Lista principal va a tener el ''parametro'' de la lista anterior.
    End
  Else      // Si no es la primera posicion..
    Begin
      ant^.sig := nue;
      // La lista anterior va a apuntar al nuevo nodo.
      nue^.sig := act;
      // El nodo va da apuntar a la la posicion.
    End;
End;

Procedure EliminarLista (Var l : ListaEntradas);
// Liberamos la memoria

Var 
  aux : ListaEntradas;

Begin
  While (l <> Nil) Do
    // Mientras la lista tenga datos..
    Begin
      aux := l;
      // Guardamos el nodo.
      l := l^.sig;
      // Avanzamos en nuestra lista.
      dispose(aux);
      // Desaparecemos el nodo.
    End;
End;

Function CheckFecha (FechaEsp : FechaL) : boolean;

Begin
  If (FechaEsp.Dia = DiaConst) And (FechaEsp.Mes = MesConst) And (FechaEsp.Anio = AnioConst)
     // Si cumple la condicion.. (D)
    Then CheckFecha := true
  Else CheckFecha := false;
End;

Procedure SumarEntrada (aux : integer);

Begin
  Aux := aux + CantEntradasPorListaConst;
End;

// PROGRAMA PRINCIPAL

Var 

  VectorEntradasVendidas : vEntradas;
  VectorDispone : vDispone;
  VectorListas : vListas;
  max1, max2 : max;
  L : ListaEntradas;
  i : integer;
  aux : ListaEntradas;

Begin

  max1.MaxEntradas := 0;
  // Inicializamos los maximos.
  max2.MaxEntradas := 0;
  l := Nil;
  // Inicializamos la lista.

  For i := 1 To 200 Do
    VectorEntradasVendidas[I] := 0;
  // Inicializamos los vectores.
  For i := 1 To 12 Do
    VectorListas[i] := Nil;

  Dispone(VectorDispone);
  // Dispone Enunciado
  DisponeLista(L);
  // Dispone Lista Enunciado

  aux := l;
  // Asignamos una lista ''auxiliar'' para recorrerla una vez y no perder el puntero principal.

  While (aux <> Nil) Do
    Begin

      If ParImpar(aux^.dato.NumeroEntrada) Then writeln('Informar : ',aux^.dato.NumeroEntrada);
      // Consigna (B)

      SumarEntrada(VectorEntradasVendidas[aux^.dato.CodEsp]);
      // Sumamos una entrada a ese espectaculo. Consigna (A)

      If CheckFecha(VectorDispone[aux^.dato.CodEsp].Fecha) Then GenerarListaOrdenada(VectorListas[aux^.dato.UbiEstadio],
                                                                                     Aux^.dato);
      // Generamos una lista en la posicion de la ubicacion del estadio (1 a 12). Consigna (D)

      aux := aux^.sig;
      // Avanzamos en la lista.
    End;

  For i := 1 To 200 Do
    Begin
      Writeln('Informar CantEntradasVen : ',VectorEntradasVendidas[i]);
      // Consigna (A)
      CalcularMaximos(max1,max2,VectorEntradasVendidas[i],VectorDispone[i].NombreEspectaculo);
      // Guardamos al mismo tiempo los maximos. Consigna (C)
    End;

  writeln('Informar : ',Max1.MaxEntradas,Max1.NomEspec);
  // Consigna (C)
  writeln('Informar : ',Max2.MaxEntradas,Max2.NomEspec);
  // Consigna (C)

  // Liberar memoria

  EliminarLista(L);
  For i := 1 To 12 Do
    EliminarLista(VectorListas[i]);

End.
