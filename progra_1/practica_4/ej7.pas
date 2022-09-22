program practica4_ej7;
const
  PAISES = 20;
  REPRESENTANTES = 7;
  INGREDIENTE = 'Pollo';
type
  texto = string[30];
  typePlato = record
    tipo: 1..2;
    nombre: texto;
    ingrediente: texto;
  end;
  typeRepresentante = record
    nombre: texto;
    apellido: texto;
    pais: texto;
    plato: typePlato;
    sexo: 1..2;
    edad: integer;
  end;
procedure informar(r: representante);
begin
  writeln('Plato caliente con ingrediente principal pollo');
  writeln(r.nombre, ' ',r.apellido);
  writeln(r.pais);
end;
var
  platoFrio, femenino, esIngrediente: boolean;
  representante: typeRepresentante;
  cantFem: integer;
  i, j: integer;
  max, numMax: integer;
  edadTotal: integer;
  edadPromedio: real;
begin
  max := -1;
  edadTotal := 0;
  for i := 1 to PAISES do
  begin
    cantFem := 0;
    for j := 1 to REPRESENTANTES do
    begin
      leerRepresentante(representante);
      edadTotal := edadTotal + representante.edad;
      platoFrio := representante.plato.tipo = 1;
      femenino := representante.tipo = 1;
      if (femenino and platoFrio) then
        cantFem := cantFem + 1;
      esIngrediente := representante.plato.ingrediente = INGREDIENTE;
      if (esIngrediente and not(platoFrio)) then
        informar(representante);
    end;
    if (cantFem > max) then
    begin
      numMax := i;
      max := cantFem;
    end;
  end;
  edadPromedio := edadTotal / (PAISES * REPRESENTANTES);
end.