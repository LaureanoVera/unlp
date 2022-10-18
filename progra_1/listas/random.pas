program practicaRandomListas;
type
  texto = string[20];
  rangoLanzamientos = 1800..2022;
  tRegistroFramework = record
    nombre: texto;
    lenguaje: texto;
    lanzamiento: rangoLanzamientos;
  end;
  tLista = ^tNodo;
  tNodo = record
    info: tRegistroFramework;
    sig: tLista;
  end;
procedure CrearLista(var l: tLista);
begin
  l := nil;
end;
begin
  readln;
end.