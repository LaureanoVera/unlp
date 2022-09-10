program practica4_ej5;
const 
  CORTE = 1900;
type
  rangHoras = 0..23;
  rangMinutos = 0..59;
  texto = string[20];
  fecha = record
    dia: 1..31;
    mes: 1..12;
    anio: 1900..2022;
  end;
  tiempo = record
    hora: rangHoras;
    minuto: rangMinutos;
  end;
  atencion = record
    paciente: texto;
    medico: texto;
    fechaAtencion: fecha;
    llegada: tiempo;
    salida: tiempo;
  end;
procedure convertirEnHoras(var t: tiempo; minutos: integer);
begin
  { divicion entera por 60 de los minutos (horas) }
  t.hora := minutos DIV 60;
  { resto de la divicion entera (minutos) }
  t.minuto := minutos MOD 60;
end;
procedure leerFecha(var f: fecha);
begin
  { lee la fecha, excepto el año para usarlo en el while }
  writeln('Dia:');
  readln(f.dia);
  writeln('Mes:');
  readln(f.mes);
end;
procedure leerTiempo(var t: tiempo);
begin
  { lee el tiempo }
  writeln('Hora:');
  readln(t.hora);
  writeln('Minutos:');
  readln(t.minuto);
end;
procedure leerAtencion (var a: atencion);
begin
  { lee la atencion }
  { llama al modulo para leer fecha }
  leerFecha(a.fechaAtencion);
  writeln('Nombre paciente:');
  readln(a.paciente);
  writeln('Nombre medico:');
  readln(a.medico);
  writeln('Llegada');
  { llama al modulo para leer tienpo }
  leerTiempo(a.llegada);
  writeln('Salida');
  { llama al modulo para leer tienpo }
  leerTiempo(a.salida);
end;
function convertirEnMinutos(t: tiempo): integer;
begin
  { multiplica por 60 las horas y le suma los minutos }
  convertirEnMinutos := t.hora * 60 + t.minuto;
end;
function diferenciaTiempo (t1, t2: tiempo): tiempo;
var
  n1, n2: integer;
  t: tiempo;
begin
  { pasa los tiempo t1, t2 a minutos y los guarda en las variables }
  n1 := convertirEnMinutos(t1);
  n2 := convertirEnMinutos(t2);
  if (n1 > n2) then
    { comprueba si n1 es mayor a n2 para evitar un resultado negativo }
    convertirEnHoras(t, (n1 - n2))
  else
    { si n2 no es mayor a n1 van a ser iguales }
    { entonces no va a haber un resultado negativo }
    convertirEnHoras(t, (n2 - n1));
  diferenciaTiempo := t;
end;
var
  tiempoEnAtender: tiempo;
  atencionPrincipal: atencion;
  max: integer;
  nombreMax: texto;
  pacientesAgosto: integer;
begin
  max := -1;
  pacientesAgosto := 0;
  { lee el año para evitar una lectura innecesaria }
  writeln('Año:');
  readln(atencionPrincipal.fechaAtencion.anio);
  while (atencionPrincipal.fechaAtencion.anio <> CORTE) do
  begin
    { entra al while y lee la atencion }
    leerAtencion(atencionPrincipal);
    { para calcular el tiempo de la atencion, calcula la diferencia de tiempo }
    tiempoEnAtender := diferenciaTiempo(atencionPrincipal.llegada, atencionPrincipal.salida);
    if (convertirEnMinutos(tiempoEnAtender) > max) then
    begin
      { si el tiempo en minutos es mayor a max, actualiza los datos }
      { trabajamos con minutos para usar directamente enteros }
      max := convertirEnMinutos(tiempoEnAtender);
      nombreMax := atencionPrincipal.paciente;
    end;
    if (atencionPrincipal.fechaAtencion.mes = 8) then
      { si el mes es 8 entonces la cantidad de pacientes de agosto aumenta en 1 }
      pacientesAgosto := pacientesAgosto + 1;
    writeln('Año:');
    readln(atencionPrincipal.fechaAtencion.anio);
  end;
  writeln('El paciente que mas tardo en ser atendido fue: ', nombreMax);
  writeln('Tiempo de atencion ', tiempoEnAtender.hora,':',tiempoEnAtender.minuto, 'hs');
  writeln('En agosto asistieron ', pacientesAgosto, ' pacientes');
end.