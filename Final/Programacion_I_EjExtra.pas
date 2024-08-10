
Program Programacion_I_EjExtra;

Const 
  MAX_MATERIAS = 38;
  FIN = 'zzz';


Type 
  Tcod = String[6];
  Tnombre = String[50];
  Tnota = 1..10;
  Tlegajo = String [8];
  Rango = 0..Max_materias;

  MateriasAprobadas = Record
    nota: Tnota;
    Codigo: Tcod;
  End;
  VMatAprob = array [1..MAX_MATERIAS] Of MateriasAprobadas;

  Alumno = Record
    nombreAlu: Tnombre;
    legajo: Tlegajo;
    MatAprob: VMatAprob;
    diml: Rango;
  End;

  Lista = ^nodo;
  nodo = Record
    dato: Alumno;
    sig: Lista;
  End;

  TMateria = Record
    codigo: Tcod;
    nombre: Tnombre;
  End;
  TMaterias = array[1..MAX_MATERIAS] Of TMateria;

Const 
  MATERIAS: TMaterias = (
                         (codigo: 'E0228'; nombre: 'Práctica Profesional Supervisada'),
                        (codigo: 'E0282'; nombre: 'Electrotecnia y Electrónica'),
                        (codigo: 'E0301'; nombre: 'Introducción al Diseño Lógico'),
                        (codigo: 'E0302'; nombre: 'Introducción al Procesamiento de Señales'),
                        (codigo: 'E0303'; nombre: 'Redes de Datos 1'),
                        (codigo: 'E0304'; nombre: 'Instrumentación y Control'),
                        (codigo: 'E0305'; nombre: 'Circuitos Digitales y Microcontroladores'),
                        (codigo: 'E0306'; nombre: 'Taller de Proyecto I'),
                        (codigo: 'F0301'; nombre: 'Matemáticas A'),
                        (codigo: 'F0302'; nombre: 'Matemáticas B'),
                        (codigo: 'F0304'; nombre: 'Matemática C'),
                        (codigo: 'F0307'; nombre: 'Estadistica'),
                        (codigo: 'F0310'; nombre: 'Matemáticas D1'),
                        (codigo: 'F0312'; nombre: 'Probabilidades'),
                        (codigo: 'F0316'; nombre: 'Física I'),
                        (codigo: 'F0317'; nombre: 'Física II'),
                        (codigo: 'I101'; nombre: 'Programación I'),
                        (codigo: 'I102'; nombre: 'Programación II'),
                        (codigo: 'I103'; nombre: 'Programación III'),
                        (codigo: 'I104'; nombre: 'Taller de Lenguajes I'),
                        (codigo: 'I105'; nombre: 'Conceptos de Arquitectura de Computadoras'),
                        (codigo: 'I106'; nombre: 'Conceptos de Sistemas Operativos'),
                        (codigo: 'I107'; nombre: 'Taller de Lenguajes II'),
                        (codigo: 'I108'; nombre: 'Conceptos de Bases de Datos'),
                        (codigo: 'I109'; nombre: 'Taller de Arquitectura'),
                        (codigo: 'I110'; nombre: 'Ingeniería de Software'),
                        (codigo: 'I111'; nombre: 'Concurrencia y Paralelismo'),
                        (codigo: 'I112'; nombre: 'Bases de Datos'),
                        (codigo: 'I113'; nombre: 'Economía y Emprendedorismo'),
                        (codigo: 'I114'; nombre: 'Redes de Datos II'),
                        (codigo: 'I115'; nombre: 'Sistemas de Tiempo Real'),
                        (codigo: 'I116'; nombre: 'Sistemas Distribuidos y Paralelos'),
                        (codigo: 'I117'; nombre: 'Aspectos Legales de Ingeniería Informática'),
                        (codigo: 'I118'; nombre: 'Taller de Proyecto II'),
                        (codigo: 'INFIN'; nombre: 'Inglés (Prueba de Suficiencia)'),
                        (codigo: 'M0670'; nombre: 'Sistemas de Representación'),
                        (codigo: 'S0012'; nombre: 'Seminario de Redacción de Textos Profesionales'),
                        (codigo: 'U0902'; nombre: 'Química')
                        );


Procedure Buscar (cod:Tcod; Var Pos:Rango; diml:rango);

Var 
  I,F,M: Rango; {inicio, Final, Medio}
  encontre: Boolean;
Begin
  encontre := False;
  pos := 0;
  I := 1;
  F := diml;
  M := (I + F) Div 2;
  While (cod <> MATERIAS[M].codigo) And Not(encontre) Do
    Begin
      If (cod = MATERIAS[M].codigo ) Then
        Begin
          encontre := true;
        End
      Else If (cod < MATERIAS[M].codigo) Then
             F := M - 1
      Else
        I := M +1;
      M := (I + F) Div 2;
    End;
  If I <= F Then pos := M
  Else pos := 0;
End;

Procedure NombreMateria (cod:Tcod;diml: Rango );

Var 
  pos: Rango;
Begin
  Buscar(cod,pos,diml);
  If (Pos = 0) Then
    writeln(' ')
  Else
    WriteLn('Nombre: ', MATERIAS[pos].nombre );
End;

Function ExisteCod (cod:Tcod; diml:Rango): Boolean;

Var 
  ok: Boolean;
  pos: Rango;
Begin
  ok := false;
  Buscar(cod,pos,diml);
  If (pos <> 0) Then
    ok := true
  Else If (pos = 0) Then
         ok := false;
  ExisteCod := ok;
End;



{Generar una lista de alumnos ordenada por nombre junto con las materias que
tiene aprobadas. Los datos de cada alumno se ingresan desde el teclado hasta
ingresar “zzz” como nombre. En caso de ingresar un código de materia inválido
debe informarse y volver a pedirse.}



Procedure LeerAlumno (Var A:Alumno,Mat:TMaterias;);

Var 
  i: Rango;
  cod: Tcod;
  pos: rango;
  encontre: Boolean;
Begin
  writeln('Ingrese el nombre del alumno:');
  readln(A.nombre);
  If (A.nombre <> fin) Then
    Begin
      writeln ('Ingrese El Legajo:');
      readln(A.legajo);
      WriteLn('Ingrese la cantidad de materias aprobadas');
      ReadLn(A.diml);
      For i:= 1 To A.diml Do
        Begin
          writeln('Ingrese el codigo de la materia aprobada ', i);
          readln(cod);
          buscar(Mat,cod,diml,pos,encontre);
          If Not encontre Then
            writeln (['codigo invalido'])
          Else
            A.materiasAprobadas[i] := Mat[pos].nombre;
          While Not encontre Do
            Begin
              writeln('Ingrese el codigo de la materia aprobada ', i);
              readln(cod);
              buscar(Mat,cod,diml,pos,encontre);
              If Not encontre Then
                writeln (['codigo invalido']);
              Else
                A.materiasAprobadas[i] := Mat[pos].nombre;
            End;
        End;
    End;
End;


                            

Begin


End.
