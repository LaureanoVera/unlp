program practica4_ej6;
const 
  MESES = 12;
  SUCURSALES = 7;
type
  infoSucursal = record
    bicicletasVendidas: integer;
    montoFacturado: real;
    bicicletasDefectuosas: integer;
    montoDevuelto: real;
  end;
procedure leerInformacion(var s: infoSucursal);
begin
  writeln('Bicicletas Vendidas');
  readln(s.bicicletasVendidas);
  writeln('Bicicletas Defectuosas');
  readln(s.bicicletasDefectuosas);
  writeln('Monto Total Facturado');
  readln(s.montoFacturado);
  writeln('Monto Total Devuelto Por Defectos');
  readln(s.montoDevuelto);
end;
procedure informarMes(mes: integer);
begin
  case mes of
    1: writeln('Enero');
    2: writeln('Febrero');
    3: writeln('Marzo');
    4: writeln('Abril');
    5: writeln('Mayo');
    6: writeln('Junio');
    7: writeln('Julio');
    8: writeln('Agosto');
    9: writeln('Septiembre');
    10: writeln('Octubre');
    11: writeln('Noviembre');
    12: writeln('Diciembre');
  else
    writeln('El numero de mes no es valido');
  end;
end;
var
  i, j: integer;
  min: real;
  numMin: integer;
  max: real;
  mesMax: integer;
  montoSucursal: real;
  recaudacionMarzo: real;
  promedioMarzo: real;
  informacionPrincipal: infoSucursal;
begin
  for i := 1 to SUCURSALES do
  begin
    writeln('Sucursal Nº',i);
    montoSucursal := 0;
    for j := 1 to MESES do
    begin
      writeln('Mes Nº', j);
      leerInformacion(informacionPrincipal);
      montoSucursal := montoSucursal + informacionPrincipal.montoFacturado;
      if (informacionPrincipal.montoFacturado > max) then
        mesMax := j;
      if (j = 4) then
        recaudacionMarzo := recaudacionMarzo + informacionPrincipal.montoFacturado;
    end;
    writeln('El mes que mas vendio fue:');
    informarMes(mesMax);
    if (montoSucursal < min) then
    begin
      min := montoSucursal;
      numMin := i;
    end;
  end;
  promedioMarzo := recaudacionMarzo / SUCURSALES;
  writeln('La sucursal con menos ganancia fue la Nº',numMin,' recaudo:', min);
  writeln('El promedio de recaudacion de marzo fue ',promedioMarzo);
end.
