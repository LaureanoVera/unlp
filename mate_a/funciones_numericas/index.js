const funcionNumerica = (x) => {
  // Una funcion es una relacion entre dos magnitudes x e y
  // talque a cada valor de x le corresponde un valor de y
  let y;
  // y: variable dependiente

  if (x > 0) {
    // x: variable independiente
    y = x ** 2 + 144 / x;
  } else {
    y = 0;
  }
  return y;
};
