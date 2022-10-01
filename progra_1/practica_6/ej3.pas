program practica6Ej3;
const
  LIMIT = 600;
  VOCALES = ['a', 'e', 'i', 'o', 'u'];
  NUMERO_LETRAS = 27;
type
  arrCaracteres = array[1..LIMIT] of char;
  abecedario = 'a'..'z';
  conjConsonantes = set of abecedario;
  conjCaracteres = set of char;
procedure leerCaracteres(var arr: arrCaracteres; cant: integer);
var
  i: integer;
begin
  { "cant" representa el numero de iteraciones que el bucle debe hacer }
  for i:=1 to cant do
  begin
    write('Caracter Nº',i,': ');
    readln(arr[i]);
  end;
end;
function calcularPorcentaje(cantidad, total: integer): real;
begin
  { cantidad son las unidades con respecto al total }
  { para sacar el porcentajes, ej: }
  { cantidad=5, total=abecedario=27 }
  { cantidad/abecedario*100 = 18.518 }
  calcularPorcentaje := (cantidad/total) * 100;
end;
var
  i: integer;
  { array con los caracteres }
  caracteres: arrCaracteres;
  { conjuntos de consonantes }
  consonantes, aux: conjConsonantes;
  { conjunto para almacenar letras y digitos }
  { el tipo char tambien admite '@','.', etc }
  { por eso se restringe }
  letrasYDigitos: conjCaracteres;
  { cuenta el total de consonantes }
  consTotal: integer;
  { cuenta las consonantes diferentes para sacar el porcentaje }
  { de las que aparecen con respecto al abecedario }
  consDiferentes: integer;
  { contador de letras y digitos }
  letDigTotal: integer;
  { variables para porcentajes }
  porcentajeConsonantes: real;
  porcentajeLetrasDigitos: real;
begin
  { inicia los contadores en 0 }
  consTotal := 0;
  consDiferentes := 0;
  letDigTotal := 0;
  { al conjunto de letras le saca las vocales  }
  consonantes := ['a'..'z'] - VOCALES;
  aux := consonantes;
  { restringe el conjunto a solo digitos y letras  }
  letrasYDigitos := ['a'..'z'] + ['A'..'Z'] + ['0'..'9'];
  { llama al modulo para cargar el array }
  leerCaracteres(caracteres, LIMIT);
  for i:=1 to LIMIT do
  begin
    { itera todo el array }
    if (caracteres[i] in consonantes) then
    begin
      { si el caracter actual esta incluido en el conjuntoi }
      { de consonantes incrementa el contador en uno }
      consTotal := consTotal + 1;
      if (caracteres[i] in aux) then
      begin
        { si el caracter actual esta en el conjunto auxiliar }
        { incremente el contador en uno y elimina el caracter del }
        { conjunto, porque queremos contar las consonantes diferentes }
        consDiferentes := consDiferentes + 1;
        aux := aux - [caracteres[i]];
      end;
    end;
    if (caracteres[i] in letrasYDigitos) then
      { si el caracter es una letra o digito incrementa el contador en uno }
      letDigTotal := letDigTotal + 1;
  end;
  { guarda los porcentajes en variables }
  porcentajeConsonantes := calcularPorcentaje(consDiferentes, NUMERO_LETRAS);
  porcentajeLetrasDigitos := calcularPorcentaje(letDigTotal, LIMIT);
  { imprime los resultados }
  writeln('Cantidad de consonantes: ', consTotal);
  writeln('Consonantes sobre total del abecedario: ',porcentajeConsonantes:3:2,'%');
  writeln('Cantidad de digitos y letras: ',letDigTotal);
  writeln('Letras y digitos sobre total de caracteres: ',porcentajeLetrasDigitos:3:2,'%');
end.