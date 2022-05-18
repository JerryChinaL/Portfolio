class Tree3 extends Tree {
  Tree3() {
    axiom = "F";
    rulef = "FF+[+F-F+}FX]-[-F-{+F-+F}]";
    current = axiom;
    startLength = 200;
    go = startLength;
    generation = 0;
    theta = radians(30);
  }
}
