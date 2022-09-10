program practica4_ej1;
type
  areas = record
    a1: integer;
    a2: integer;
  end;
  prisma = record
    alto: integer;
    ancho: integer;
    profundidad: integer;
    volumen: integer;
    area: integer;
  end;
function calcularArea (alto, ancho: integer): integer;
begin 
  calcularArea := alto * ancho;
end;
function calcularVolumen (area, profundidad: integer): integer;
begin
  calcularVolumen := area * profundidad;
end;
procedure leerPrisma (var p: prisma);
begin
  writeln('Alto:');
  readln(p.alto);
  writeln('Ancho:');
  readln(p.ancho);
  writeln('Profundidad:');
  readln(p.profundidad);
end;
procedure areaPrismaTotal (var area: integer; a: areas);
begin
  writeln(a.a1);
  area := a.a1 * 4 + a.a2 * 2;
end;
var
  p: prisma;
  a: areas;
begin
  leerPrisma(p);
  p.area := calcularArea(p.alto, p.ancho);
  p.volumen := 0;
  a.a1 := calcularArea(p.alto, p.ancho);
  a.a2 := calcularArea(p.area, p.profundidad);
  areaPrismaTotal(p.area, a);
  p.volumen := calcularVolumen(p.area, p.profundidad);
  writeln('Area Total: ',p.area, 'mts2');
  writeln('volumen: ',p.volumen, 'mts3');
end.