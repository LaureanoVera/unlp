program practica4_ej2;
type 
tiempo = record
  hora: 0..23;
  minuto: 0..59;
end;
procedure leerTiempo(var t: tiempo);
begin
  writeln('Hora: ');
  readln(t.hora);
  writeln('Minutos');
  readln(t.minuto);
end;
procedure convertirEnHoras(var t: tiempo; minutos: integer);
begin
  t.hora := minutos DIV 60;
  t.minuto := minutos MOD 60;
end;
function convertirEnMinutos(t: tiempo): integer;
begin
  convertirEnMinutos := t.hora * 60 + t.minuto;
end;
function diferenciaTiempo (t1, t2: tiempo): tiempo;
var
  n1, n2: integer;
  t: tiempo;
begin
  n1 := convertirEnMinutos(t1);
  n2 := convertirEnMinutos(t2);
  if (n1 > n2) then
    convertirEnHoras(t, (n1 - n2))
  else
    convertirEnHoras(t, (n2 - n1));
  diferenciaTiempo := t;
end;
var
  tiempo1, tiempo2, difTiempo: tiempo;
begin
  leerTiempo(tiempo1);
  leerTiempo(tiempo2);
  writeln('Diferencia de tiempo: ');
  difTiempo := diferenciaTiempo(tiempo1, tiempo2);
  writeln(difTiempo.hora,':',difTiempo.minuto);
end.
