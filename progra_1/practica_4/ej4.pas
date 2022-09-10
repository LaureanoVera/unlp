{ NOTAS: }
{ - el ejercicio no pide el uso de modulos }
{ - no use reales porque el compilador no me deja, pero variables como }
{   precioPromedioMermeladas tienen que ser real }
program practica4_ej4;
const 
  CORTE = 9999;
type 
  producto = record
    codigo: integer;
    tipo: 1..2;
    unidades: integer;
    precio: integer;
  end;
procedure leerProducto(var p: producto);
begin
  { el codigo se lee fuera para no hacer una lectura completa del producto }
  writeln('Tipo (1 = Alfajor, 2 = Mermelada):');
  readln(p.tipo);
  writeln('Unidades:');
  readln(p.unidades);
  writeln('Precio:');
  readln(p.precio);
end;
var
  productoPrincipal: producto;
  cantidadAlfajores: integer;
  precioTotalMermeladas, precioPromedioMermeladas: integer;
  cantidadTipoMermeladas: integer;
  max1, max2, codMax1, codMax2: integer;
begin
  max1 := -1;
  max2 := -1;
  codMax1 := 0;
  codMax2 := 0;
  { inicializamos en 0 para hacer operaciones necesarias }
  cantidadAlfajores := 0;
  precioTotalMermeladas := 0;
  cantidadTipoMermeladas := 0;
  { si el codigo fuera 9999 y la lectura del codigo estaria dentro de }
  { leerProducto leeria todo un producto sin necesidad }
  writeln('Codigo:');
  readln(productoPrincipal.codigo);
  while (productoPrincipal.codigo <> CORTE) do
  begin
    leerProducto(productoPrincipal);
    if (productoPrincipal.tipo = 1) then
      { acumula las unidades de alfajores}
      cantidadAlfajores := cantidadAlfajores + productoPrincipal.unidades
    else
    begin
      { else if no es necesario, si no es tipo 1 (alfajor) es tipo 2 (mermelada)}
      { la suma de todos los precios de diferentes tipos de mermeladas }
      precioTotalMermeladas := precioTotalMermeladas + productoPrincipal.precio;
      { cuenta la cantidad de productos que son mermelada para sacar el promedio de precio }
      cantidadTipoMermeladas := cantidadTipoMermeladas + 1;
    end;
    if (productoPrincipal.unidades > max1) then
    begin
      { la cantidad de unidades del producto actual es mayor al maximo 1 }
      { salva los valores del maximo anterior en el secundario }
      max2 := max1;
      codMax2 := codMax1;
      { actualiza los valores del nuevo maximo }
      max1 := productoPrincipal.unidades;
      codMax1 := productoPrincipal.codigo;
    end
    else if (productoPrincipal.unidades > max2) then
    begin
      { la cantidad de unidades no es mayor que el maximo actual }
      { pero si que el maximo secundario }
      { actualiza los valores del maximo secundario }
      max2 := productoPrincipal.unidades;
      codMax2 := productoPrincipal.codigo;
    end;
    { lee el codigo para evaluar el corte }
    writeln('Codigo:');
    readln(productoPrincipal.codigo);
  end;
  if (cantidadTipoMermeladas <> 0) then
    { si cantidadTipoMermeladas = 0 no se puede hacer la division }
    precioPromedioMermeladas := precioTotalMermeladas DIV cantidadTipoMermeladas;
  writeln('Se fabricaron: ', cantidadAlfajores, ' alfajores en el mes.');
  writeln('El precio promedio de las mermeladas es:', precioPromedioMermeladas);
  writeln('Los productos con mas unidades son: ', codMax1, ' / ', codMax2);
  readln;
end.

