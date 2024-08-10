{La Facultad está interesada en procesar datos de sus alumnos de Ingeniería en
Computación. De cada alumno se conoce nombre, legajo y materias aprobadas. Se
sabe que a lo sumo son 38 materias y de cada una se conoce la nota (entero) y el
código de materia (alfanumérico de hasta 5 caracteres, ej: I101 o E0228). Además,
se dispone de una estructura de datos que contiene la información de las materias. En
ésta se almacena código y nombre de cada materia (ver más abajo) y se encuentra
ordenada por código de materia.
Se requiere realizar un programa que:
a) Implemente un módulo que recibe la estructura de datos de materias y un código
y retorna el nombre de la materia. En caso de que el código no se encuentre debe
retornar un string vacío. Implemente una búsqueda binaria/dicotómica.
b) Implemente un segundo módulo que determine si un código de materia existe,
invocando al módulo del punto a)
c) Generar una lista de alumnos ordenada por nombre junto con las materias que
tiene aprobadas. Los datos de cada alumno se ingresan desde el teclado hasta
ingresar “zzz” como nombre. En caso de ingresar un código de materia inválido
debe informarse y volver a pedirse.
Una vez generada la lista se pide recorrerla una única vez para:
d) Informar para cada alumno:
o Nombre
o nota promedio
o nombre, código y nota de la materia con mejor nota}

Program Entregable;

Const 
  Max_materias = 38;
  FIN = 'zzz';

Type 
  Tcod = String[6];
  Tnombre = String[50];
  Tnota = 1..10;
  Tlegajo = String [8];
  Rango = 0..Max_materias;

  VecMatApro = array [1..Max_materias] Of ;

  Materia = Record
    codigo: Tcod;
    nombre: Tnombre;
    nota: Integer;
  End;

  Alumno = Record
    nombre: Tnombre;
    legajo: Tlegajo;
    materiasAprobadas: VectorMatApro;
    diml: Rango;
  End;


  Lista = ^nodo;
  nodo = Record
    dato: alumno;
    sig: lista;
  End;

  TMaterias = array [1..Max_materias] Of Materia;

Const 
  MATERIAS: TMaterias = 
                        ((codigo: 'E0228'; nombre: 'Práctica Profesional Supervisada'),
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
                        (codigo: 'U0902'; nombre: 'Química'));


Procedure Buscar (Mat: TMaterias; cod:Tcod; Diml:rango; Var Pos:Rango ; Var encontre:Boolean);
{Busqueda binaria, vector ordenado por cod materia}

Var 
  I, F, M : rango; {Inicio, Final,Medio}
Begin
  Encontre := false;
  I := 1;
  F := F;
  M := (I + F) Div 2;
  While (I <= F) And Not(encontre) Do
    Begin
      If (cod = Mat[M].codigo) Then
        Begin
          encontre := true;
          pos := M;
          Else If (cod < Mat[M].codigo) Then
                 F := M - 1
          Else
            I := M + 1;
          M := (I+F) Div 2;
        End;
    End;
End;

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

Procedure InformarNombre (Mat: TMaterias; Diml: Rango);

Var 
  cod: Tcod;
  encontre: Boolean;
  Pos: Rango;
Begin
  WriteLn('Ingrese el codigo de la materia:');
  ReadLn(cod);
  buscarMateria(Mat, cod, Diml, Pos, encontre );
  If encontre Then
    writeln('Nombre de la materia: ', Mat[pos].nombre)
  Else
    WriteLn(' ');
End;


Procedure InsertarOrdenado( Var L:lista; A:Alumno ); {Ordenado por nombre}

Var 
  nue,ant,act: lista;
  Ok: Boolean;
Begin
  ant := l;
  act := l;
  Ok := false;
  New(nue);
  nue^.dato := A;
  While (act <> Nil) And Not(ok) Do
    Begin
      If (nue^.dato.nombre <= act^.dato.nombre) Then
        ok := true
      Else
        Begin
          ant := act;
          act := act^.sig;
        End;
      If (act = ant) Then
        l := nue
      Else
        ant^.sig := nue;
      nue^sig := act;
    End;
End;

Procedure CargarLista (Var l:Lista);

Var 
  A: Alumno;
Begin
  LeerAlumno(A);
  While (A.nombre <> fin) Do
    Begin
      InsertarOrdenado(l,A);
      LeerAlumno(A);
    End;
End;


Function NotaPromedio ()
cantNotas: integer;


{Programa Principal}
