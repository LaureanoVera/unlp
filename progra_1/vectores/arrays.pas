program vectores;
const
  LIMIT = 10;
type
  tipoVector = array [1..LIMIT] of integer;
procedure iniciarVector(var arr: tipoVector; cant: integer);
var
  j: integer;
begin
  for j := 1 to cant do
    arr[j] := 0;
end;
procedure cargarNumeros(var arr: tipoVector; cant, num: integer);
var
  i: integer;
begin
  for i:=1 to LIMIT do
      arr[i] := arr[i] + (10 * i - (num + i));
end;
procedure mostrarVector(arr: tipoVector; cant: integer);
var
  i: integer;
begin
  for i := 1 to cant do
    writeln(arr[i]);
end;
var
  vector: tipoVector;
  i: integer;
begin
  iniciarVector(vector, LIMIT);
  cargarNumeros(vector, LIMIT, 3);
  mostrarVector(vector, LIMIT);
  readln;
end.