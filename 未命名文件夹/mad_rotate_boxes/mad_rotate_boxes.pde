class Box {
  float rand;
  color c;
  Box(color c) {
    rand = random(100);
    this.c = c;
  }
 
  void render(int x, int y, int z) {
    fill(c);
    pushMatrix();
    fill(255, random(100) + 105, 255);
    translate(x, y, z);
    rotateX(cos(frameCount / rand));
    rotateY(sin(frameCount / rand));
    rotateZ(tan(frameCount / rand));
    scale(1,1,0.2);
    box(9);
    popMatrix();
  }
   
}
 
Box[][] boxes;
 
void setup() {
  size(1000,1000,P3D);
  boxes = new Box[21][21];
  for (int i = 0; i < 21; i++) {
    for (int j = 0; j < 21; j++) {
      boxes[i][j] = new Box(color(255,random(100)+105,random(100)+105));
    }
  }
}
 
void draw() {
  clear();
  stroke(255);
  strokeWeight(0.5);
  lights();
  //translate(250,250);
  scale(4.8);
  // far wall
  for (int i = 0; i < 21; i++) {
    for (int j = 0; j < 21; j++) {
      boxes[i][j].render(i * 10, j * 10, 50);
    }
  }
}
