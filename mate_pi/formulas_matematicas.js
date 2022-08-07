class Square {
  constructor(size = 10) {
    this.size = size;
  }

  get perimeter() {
    return `${this.calcPerimeter(this.size)}cm`;
  }

  get area() {
    return `${this.calcArea(this.size)}cm2`;
  }

  calcPerimeter(size) {
    return size * 4;
  }

  calcArea(size) {
    return size * size;
  }
}

class Triangle {
  constructor(base, height, size2, size3) {
    this.base = base;
    this.height = height;
    this.size2 = size2;
    this.size3 = size3;
  }

  get perimeter() {
    return `${this.calcPerimeter(this.base, this.size2, this.size3)}cm`;
  }

  get area() {
    return `${this.calcArea(this.base, this.height)}cm2`;
  }

  calcPerimeter(size, size2, size3) {
    return size + size2 + size3;
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
