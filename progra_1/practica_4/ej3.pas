program practica4_ej3;
const 
  OFICINAS = 15;
type
  oficina = record
    numero: integer;
    mts2: integer;
    habitaciones: integer;
    horas: integer;
    precio: integer;
  end;
procedure leerOficina(var a: oficina);
begin
  write('Numero: ');
  readln(a.numero);
  write('mts2: ');
  readln(a.mts2);
  write('Habitaciones: ');
  readln(a.habitaciones);
  write('Horas: ');
  readln(a.horas);
  write('Precio: ');
  readln(a.precio);
end;
procedure informarOficina(a: oficina; monto: integer);
begin
  writeln('La oficina Nº', a.numero, ' tiene menos horas de alquiler');
  writeln('Con ', a.horas, 'hs en total');
  writeln('Monto recaudado: ', monto);
end;
function menosHorasAlquiladas (cantOf: integer): oficina;
var
  min, i: integer;
  oficinaModulo, aux: oficina;
begin
  min := maxInt;
  for i := 1 to cantOf do
  begin
    writeln('===== Oficina Nº', i,' =====');
    leerOficina(oficinaModulo);
    if (oficinaModulo.horas < min) then
    begin
      min := oficinaModulo.horas;
      aux := oficinaModulo;
    end;
  end;
  menosHorasAlquiladas := aux;
end;
function montoRecaudado (horas, precio: integer): integer;
begin
  montoRecaudado := horas * precio;
end;
var
  oficinaPrograma: oficina;
  monto: integer;
begin
  oficinaPrograma := menosHorasAlquiladas(OFICINAS);
  monto := montoRecaudado(oficinaPrograma.horas, oficinaPrograma.precio);
  informarOficina(oficinaPrograma, monto);
end.
