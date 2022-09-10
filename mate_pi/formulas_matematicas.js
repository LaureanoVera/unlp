class Square {
  constructor(side = 10) {
    this.side = side;
  }

  get perimeter() {
    return `${this.calcPerimeter(this.side)}cm`;
  }

  get area() {
    return `${this.calcArea(this.side)}cm2`;
  }

  calcPerimeter(side) {
    return side * 4;
  }

  calcArea(side) {
    return side * side;
  }
}

class Triangle {
  constructor(base, height, side2, side3) {
    this.base = base;
    this.height = height;
    this.side2 = side2;
    this.side3 = side3;
  }

  get perimeter() {
    return `${this.calcPerimeter(this.base, this.side2, this.side3)}cm`;
  }

  get area() {
    return `${this.calcArea(this.base, this.height)}cm2`;
  }

  calcPerimeter(side, side2, side3) {
    return side + side2 + side3;
  }

  calcArea(base, height) {
    return (base * height) / 2;
  }
}

class Rectangle {
  constructor(base, height) {
    this.base = base;
    this.height = height;
  }

  get perimeter() {
    return `${this.calcPerimeter(this.base, this.height)}cm`;
  }

  get area() {
    return `${this.calcArea(this.base, this.height)}cm2`;
  }

  calcPerimeter(base, height) {
    return base * 2 + height * 2;
  }

  calcArea(base, height) {
    return base * height;
  }
}

class Circle {
  constructor(radio) {
    this.radio = radio;
  }

  get perimeter() {
    return `${this.calcPerimeter(this.radio)}cm`;
  }

  get area() {
    return `${this.calcArea(this.radio)}cm2`;
  }

  calcPerimeter(radio) {
    return 2 * Math.PI * radio;
  }

  calcArea(radio) {
    return Math.PI * radio ** 2;
  }
}
