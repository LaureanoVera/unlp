program vectores;
const 
  LIMIT = 4;
type
  digitos = 1..9;
  vector1 = array [1..LIMIT] of digitos;
var
  vectorDigitos: vector1;
procedure leerDigitos(var arr: vector1; cant: integer);
var
  i: integer;
begin
  for i:= 1 to cant do
    readln(arr[i]);
end;
procedure informarDigitos(arr: vector1; cant: integer);
var
  i: integer;
begin
  for i:=1 to cant do
    writeln('Nº:',arr[i]);
end;
begin
  leerDigitos(vectorDigitos, LIMIT);
  informarDigitos(vectorDigitos, LIMIT);
  readln;
end.