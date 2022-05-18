//many codes similar to L system tree, just different algorithm.
//press "n" to add level
Tree st;

void setup() {
  size(700, 700);
  st = new Tree();
  strokeWeight(0.2);
}

void draw() {
  translate(150,500);
  rotate(PI/6);
}



void keyPressed() {
  if(key == 'n'){
    st.renew();
   st.grow();
  }
}


class Tree {
  String axiom;
  String rulef;
  String ruleg;

  float startLength;
  float go;
  float theta;

  String current;

  Tree() {
    axiom = "F-G-G";
    rulef = "F-G+F+G-F";
    ruleg = "GG";
    current = axiom;
    startLength = 400;
    go = startLength;

    theta = radians(120);
  }

  void grow() {
    for (int i = 0; i< current.length(); i++) {
      char now = current.charAt(i);

      if (now == 'F' || now == 'G') {
        line(0, 0, 0, -go);
        translate(0, -go);
      } else if (now == '+') {
        rotate(-theta);
      } else if (now == '-') {
        rotate(theta);
      } else if (now == '[') {
        pushMatrix();
      } else if (now == ']') {
        popMatrix();
      }
    }
  }

  void renew() {
    StringBuffer temp = new StringBuffer();
    for (int i = 0; i< current.length(); i++) {
      if (current.charAt(i)=='F') {
        temp.append(rulef);
      }else if(current.charAt(i)=='G'){
      temp.append(ruleg);
      }
      else {
        temp.append(current.charAt(i));
      }
    }
    current = temp.toString();
    go = go/2;
  }
}
