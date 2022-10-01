program practica6Ej2;
const
  CAJAS = 6;
  CORTE = 0;
type
  rangoCajas = 0..CAJAS;
  tipoCaja = record
    numero: rangoCajas;
    monto: real;
  end;
  arrMontos = array[1..CAJAS] of real;
procedure iniciarArray(var arr: arrMontos; cant: integer);
var
  i: integer;
begin
  for i:=1 to cant do
    arr[i] := 0;
end;
procedure leerNumeroCaja(var caja: tipoCaja);
begin
  write('Caja Nº: ');
  readln(caja.numero);
end;
procedure leerMontoCaja(var caja: tipoCaja);
begin
  write('Monto de caja: ');
  readln(caja.monto);
end;
procedure informarMontos(arr: arrMontos; cant: integer);
var
  i: integer;
begin
  for i:=1 to cant do
    writeln('Caja Nº',i, ': ', arr[i]:6:2);
end;
var
  caja: tipoCaja;
  montos: arrMontos;
begin
  iniciarArray(montos, CAJAS);
  leerNumeroCaja(caja);
  while (caja.numero <> 0) do
  begin
    leerMontoCaja(caja);
    montos[caja.numero] := montos[caja.numero] + caja.monto;
    leerNumeroCaja(caja);
  end;
  informarMontos(montos, CAJAS);
end.