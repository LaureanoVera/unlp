program practica6Ejercicio1;
const
 LIMIT = 50;
type
  tipoVector = array[1..LIMIT] of integer;
  tipoPorcentaje = record
    pos: integer;
    neg: integer;
  end;
  rcrdMaximo = record
    pos: integer;
    num: integer;
  end;
  arrMaximos = array[1..2] of rcrdMaximo;
procedure cargarNumeros(var arr: tipoVector; cant: integer);
var
  i: integer;
begin
  randomize;
  for i:=1 to cant do
    arr[i] := random(100) - 20;
end;
procedure mostrarVector(arr: tipoVector; cant: integer);
var 
  i: integer;
begin
  for i:=1 to (cant-1) do
    write(arr[i], ', ');
  write(arr[cant]);
  writeln;
end;
procedure administrarVector(var arr: tipoVector; cant: integer);
begin
  cargarNumeros(arr, cant);
  mostrarVector(arr, cant);
end;
procedure iniciarMaximos(var arr: arrMaximos; cant: integer);
var
  i: integer;
begin
  for i:=1 to cant do
  begin
    arr[i].num := 0;
    arr[i].pos := 0;
  end;
end;
procedure mostrarMaximos(arr: arrMaximos; cant: integer);
var
  i: integer;
begin
  for i:=1 to cant do
  begin
    writeln('Maximo Nº',i,': ',arr[i].num);
    writeln('Posicion Nº', arr[i].pos)
  end;
end;
function promedioValoresVector(arr: tipoVector; cant: integer): real;
var
  i: integer;
  total: integer;
begin
  total := 0;
  for i:=1 to cant do
    total := total + arr[i];
  promedioValoresVector := total / cant;
end;
function calculadorPorcentajes(arr: tipoVector; cant: integer): tipoPorcentaje;
var
  i: integer;
  aux: tipoPorcentaje;
begin
  aux.pos := 0;
  aux.neg := 0;
  for i:=1 to cant do
  begin
    if (arr[i] > 0) then
      aux.pos := aux.pos + 1
    else if (arr[i] < 0) then
      aux.neg := aux.neg + 1;
  end;
  aux.pos := aux.pos * 2;
  aux.neg := aux.neg * 2;
  calculadorPorcentajes := aux;
end;
function calcularNumerosDeUnRango(arr: tipoVector; cant,num1, num2: integer): integer;
var
  i: integer;
  count: integer;
  dentroDelRango: boolean;
begin
  count := 0;
  for i:=1 to cant do
  begin
    dentroDelRango := (arr[i] >= num1) and (arr[i] <= num2);
    if dentroDelRango then
      count := count + 1;
  end;
  calcularNumerosDeUnRango := count;
end;
function maximosEnVector(arr: tipoVector; maxs: arrMaximos; cant: integer): arrMaximos;
var
  i: integer;
begin
  for i:=1 to cant do
  begin
    if (arr[i] > maxs[1].num) then
    begin
      maxs[2].num := maxs[1].num;
      maxs[2].pos := maxs[1].pos; 
      maxs[1].num := arr[i];
      maxs[1].pos := i;
    end
    else if (arr[i] >= maxs[2].num) then
    begin
      maxs[2].num := arr[i];
      maxs[2].pos := i;
    end;
  end;
  maximosEnVector := maxs;
end;
var
  vector: tipoVector;
  promedio: real;
  porcentaje: tipoPorcentaje;
  ceros: integer;
  cantidadRango: integer;
  maximos: arrMaximos;
begin
  administrarVector(vector, LIMIT);
  promedio := promedioValoresVector(vector, LIMIT);
  writeln('Valor promedio: ',promedio:4:2);
  porcentaje := calculadorPorcentajes(vector, LIMIT);
  ceros := 100 - (porcentaje.pos + porcentaje.neg);
  writeln('Positivos: ', porcentaje.pos,'%');
  writeln('Negativos: ', porcentaje.neg,'%');
  writeln('Ceros: ', ceros,'%');
  cantidadRango := calcularNumerosDeUnRango(vector, LIMIT, 17, 26); 
  writeln('Numeros en [17, 26]: ',cantidadRango);
  iniciarMaximos(maximos, 2);
  maximos := maximosEnVector(vector, maximos, LIMIT);
  mostrarMaximos(maximos, 2);
end.