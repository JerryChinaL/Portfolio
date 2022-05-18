int density = 40;
ball block = new ball();
ball[] b = new ball[density];
void setup() {
  size(500, 500);
  stroke(10,200,30);
  for (int i = 0; i<density; i++) {
    b[i] = new ball();
  }
}

void draw() {
  clear();
  for (int i = 0; i<density; i++) {
    b[i].move();
  }
}
