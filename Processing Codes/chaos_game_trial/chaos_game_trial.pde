void setup() {
  point(x, y);
  size(1000, 800, P3D);
  strokeWeight(30);
  translate(0, -200, 0);
  point(x1, y1, z1);
  point(x2, y2, z2);
  point(x3, y3, z3);
  point(x4, y4, z4);
  strokeWeight(5);
  frameRate(120);
  colorMode(HSB,100);
}

void draw() {
  translate(0, -200, 0);
  c = random(4);
  stroke(x/10+10, 100, 100);
  if (c >= 0 & c<1 ) {
    x = x+(x1-x)/2;
    y = y+(y1-y)/2;
    z = z+(z1-z)/2;
  } else if (c >= 1 & c<2) {
    x = x+(x2-x)/2;
    y = y+(y2-y)/2;
    z = z+(z2-z)/2;
  } else if (c>= 3 & c<4) {
    x = x+(x4-x)/2;
    y = y+(y4-y)/2;
    z = z+(z4-z)/2;
  } else {
    x = x+(x3-x)/2;
    y = y+(y3-y)/2;
    z = z+(z3-z)/2;
  }
  point(x, y, z);
}

float widt = 1920;
float heigh = 1080;
float c;

float x1 = 300;
float x2 = 700;
float x3 = 500;
float x4 = 500;

float y1 = 700;
float y2 = 700;
float y3 = 700;
float y4 = 354;

float z1 = 0;
float z2 = 0;
float z3 = -346;
float z4 = -115;

float x = random(700);
float y = random(700);
float z = -random(700);
