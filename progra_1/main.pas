program Programacion_I_EjExtra;
const
  MAX_MATERIAS = 38;
  FIN_LISTA = 'ZZZ'; { para finalizar la lectura de lista }
  FIN_MATERIAS = '.';
type
 { si dejaba string[6] y string[50] en el tipo por defecto }
 { daba error en los parametros de los modulos }
  tipoCodigo = string[6];
  texto = string[50];
  TMateria = record
    codigo:tipoCodigo;
    nombre:texto;
  end;
  TMaterias = array[1..MAX_MATERIAS] of TMateria;
  rangoMaterias = 0..MAX_MATERIAS;
  { === array materias aprobadas === }
  materiaAprobada = record
    nota: integer;
    materia: TMateria;
  end;
  arrMateriasAprobadas = array [1..MAX_MATERIAS] of materiaAprobada;
  rangoAprobadas = 1..MAX_MATERIAS;
 { === lista alumnos === }
  alumno = record
    nombre: texto;
    cantidadAprobadas: rangoMaterias;
    aprobadas: arrMateriasAprobadas;
  end;
  tipoListaAlumnos = ^nodoAlumnos;
  nodoAlumnos = record
    info: alumno;
    sig: tipoListaAlumnos;
  end;
const
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
{ === inciso A === }
function buscarMateriaPorCodigo(arr: TMaterias; codigo: tipoCodigo): texto;
var
  encontre: boolean;
  inicio: integer;
  medio: integer;
  fin: integer;
begin
  encontre := false;
  inicio := 1;
   { fin es limite de materias }
  fin := MAX_MATERIAS;
while (not(encontre) and (fin >= inicio)) do
begin
  { divide los indices del array en 2 }
  { ej: se dividio y se paso al lado derecho del array }
  { medio := (20 + 38) DIV 2 => trabaja con division de enteros }
  medio := (inicio + fin) DIV 2;
  if (arr[medio].codigo = codigo) then
    encontre := true
  else
    if (arr[medio].codigo < codigo) then
      { el codigo del array en la posicion medio es menor al codigo buscado }
      { se busca en la mitad derecha }
      inicio := medio + 1
    else
      { se busca en la mitad izquierda }
      fin := medio - 1;
  end;
  if (encontre) then
    { si se encontro el codigo retorna el nombre de la materia con ese codigo }
    buscarMateriaPorCodigo := arr[medio].nombre
  else
    { si no devuelve un string vacio }
    buscarMateriaPorCodigo := '';
end;
{ === inciso B === }
function existeCodigo(arr: TMaterias; codigo: tipoCodigo): boolean;
begin
  { si lo que retorna la funcion buscarMateriaPorCodigo con el codigo recibido }
  { es distinto a un array vacio es verdadero, entonces existe }
  existeCodigo := buscarMateriaPorCodigo(arr, codigo) <> '';
end;
{ === inciso C === }
procedure insertarMateria(var materias: arrMateriasAprobadas; var dimL:rangoMaterias; materia: materiaAprobada; var exito: boolean);
begin
  { verifica que la dimension logica no supere el limite del vector }
  if (dimL < MAX_MATERIAS) then
  begin
    { incrementa la dimension logica }
    dimL := dimL + 1;
    {añade la materia aprobada en el indice actual de dimL}
    materias[dimL] := materia;
    exito := true;
  end
  else
    exito := false;
end;
procedure insertarOrdenado(var alumnos: tipoListaAlumnos; elemento: alumno);
var
  nueva: tipoListaAlumnos;
  anterior: tipoListaAlumnos;
  posicion: tipoListaAlumnos;
begin
  { asigna una nueva direccion }
  new(nueva);
  { guarda los datos recibidos por parametro en el elemento de la lista }
  nueva^.info := elemento;
  nueva^.sig := nil;
  anterior := alumnos;
  posicion := alumnos;
  while (posicion <> nil) and (elemento.nombre > posicion^.info.nombre) do
  begin
    { mientras el nombre del elemento sea mayor al nombre de la posicion actual }
    { se va a avanzar en la lista }
    anterior := posicion;
    posicion := posicion^.sig;
  end;
  if (posicion = alumnos) then
  begin
    nueva^.sig := alumnos;
    alumnos := nueva;
  end
  else
  begin
    { se deja la nueva lista en medio de las dos listas }
    anterior^.sig := nueva;
    nueva^.sig := posicion;
  end;
end;
procedure leerMateriasAprobadas(var arrAprobadas: arrMateriasAprobadas; var cantAprobadas: rangoMaterias);
var
  materiasAprobadas: rangoMaterias;
  codigoMateria: tipoCodigo;
  materia: materiaAprobada;
  dimL: rangoMaterias;
  materiasLeidas: rangoMaterias;
  materiaInsertada: boolean;
begin
  materiasAprobadas := 0;
  dimL := 0;
  materiasLeidas := 0;
  while (materiasLeidas < MAX_MATERIAS) do
  begin
    materiaInsertada := false;
    write('Ingrese el codigo de materia: ')
    readln(codigoMateria);
    if (existeCodigo(MATERIAS, codigoMateria)) then
    begin
      write('Ingrese nota de materia: ')
      readln(materia.nota);
      if (materia.nota > 4) then
      begin
        materia.materia.codigo := codigoMateria;
        materia.materia.nombre := buscarMateriaPorCodigo(MATERIAS, codigoMateria);
        insertarMateria(arrAprobadas, dimL, materia, materiaInsertada);
      end;
      materiasLeidas := materiasAprobadas + 1;
    end
    else
    begin
      writeln('Codigo de materia invalido');
      readln(codigoMateria);
    end;
  end;
  cantAprobadas := dimL;
end;
var
  alumnos: tipoListaAlumnos;
  i: integer;
  maxNota: integer;
  notaTotal: integer;
  notaPromedio: real;
  cantMaterias: integer;
  maxMateria: materiaAprobada;
  materiasAprobadas: rangoMaterias;
  codigoMateria: tipoCodigo;
  auxMateriaAprobada: materiaAprobada; { este lo puedo usar para el maximo tambien }
  auxAlumno: alumno;
  indice: rangoMaterias;
begin
  alumnos := nil;
  maxNota := -1;
  write('Ingrese nombre alumno: ');
  readln(auxAlumno.nombre);
  while (auxAlumno.nombre <> FIN_LISTA) do
  begin
    leerMateriasAprobadas(auxAlumno.aprobadas, auxAlumno.cantidadAprobadas);
    insertarOrdenado(alumnos, auxAlumno);
    write('Ingrese nombre alumno: ');
    readln(auxAlumno.nombre);
  end;
   { === loop para recorrer la lista de alumnos === }
  while (alumnos <> nil) do
  begin
    notaTotal := 0;
    cantMaterias := 0;
    maxNota := -1;
    maxMateria.nota := 0;
    write('Alumno: ')
    writeln(alumnos^.info.nombre);
    indice := alumnos^.info.cantidadAprobadas;
    for i:= 1 to indice do
    begin
      notaTotal := notaTotal + alumnos^.info.aprobadas[i].nota;
      if (alumnos^.info.aprobadas[i].nota > maxNota) then
      begin
        maxNota := alumnos^.info.aprobadas[i].nota;
        maxMateria := alumnos^.info.aprobadas[i];
      end;
    end;
    if (cantMaterias <> 0) then
    begin
      notaPromedio := notaTotal / cantMaterias;
      writeln('Nota Promedio: ',notaPromedio:2:1);
    end
    else
      writeln('Nota Promedio: ', 0);
    writeln('Materia: ',maxMateria.materia.nombre);
    writeln('Codigo: ',maxMateria.materia.codigo);
    writeln('Nota: ',maxMateria.nota);
  end;
end.