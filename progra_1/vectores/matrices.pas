program matrices;
const
 FIL = 4;
 COL = 6;
type
  tipoMatriz = array[1..FIL, 1..COL] of integer;
procedure iniciarMatriz (var mtrz: tipoMatriz; fil, col: integer);  
var
  i, j: integer;
begin
  for i:=1 to fil do
    for j:=1 to col do
      mtrz[i, j] := 0;
end;
procedure cargarMatriz (var mtrz: tipoMatriz; fil, col: integer);  
var
  i, j: integer;
begin
  randomize;
  for i:=1 to fil do
    for j:=1 to col do
      mtrz[i, j] := random(10);
end;
procedure mostrarMatriz (var mtrz: tipoMatriz; fil, col: integer);  
var
  i, j: integer;
begin
  writeln('===== Matriz =====');
  for i:=1 to fil do
  begin 
    write('.   ');
    for j:=1 to col do
      write(mtrz[i, j], ' ');
    writeln;
  end;
end;
var
  matriz: tipoMatriz;
begin
  iniciarMatriz(matriz, FIL, COL);
  cargarMatriz(matriz, FIL, COL);
  mostrarMatriz(matriz, FIL, COL);
end.