class Tree {
  int generation;
  String axiom;
  String rulef;

  float startLength;
  float go;
  float theta;

  String current;

  Tree() {
    axiom = "F";
    rulef = "FF+[-F+F}-F]-[-F-{F+F]";
    current = axiom;
    startLength = 200;
    go = startLength;
    generation = 0;
    theta = radians(30);
  }

  //read the current command string and follows instructions to draw tree
  void grow(float Pangle, float size) {
    Pangle = Pangle/(exp(generation)*2);
    for (int i = 0; i< current.length(); i++) {
      char now = current.charAt(i);

      if (now == 'F') {
        if (generation<5) {
          //strokeWeight(6-generation);
        }
        line(0, 0, 0, -go*size);
        translate(0, -go*size);
      } else if (now == 'X') {
        translate(0, -go*size);
      } else if (now == '+') {
        rotateZ(theta+Pangle);
      } else if (now == '-') {
        rotateZ(-theta+Pangle);
      } else if (now == '{') {
        rotateX(theta+Pangle);
      } else if (now == '}') {
        rotateX(-theta+Pangle);
      } else if (now == '[') {
        pushMatrix();
      } else if (now == ']') {
        popMatrix();
      }
    }
  }

  //update the command string to the next level
  void renew() {
    StringBuffer temp = new StringBuffer();
    for (int i = 0; i< current.length(); i++) {
      if (current.charAt(i)=='F') {
        temp.append(rulef);
      } else {
        temp.append(current.charAt(i));
      }
    }
    current = temp.toString();
    go = go/2;
    generation++;
  }
}
