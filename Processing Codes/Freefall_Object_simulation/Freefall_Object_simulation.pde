int density = 400;
object block = new object();
object[] b = new object[density];
void setup() {
  size(1920,1080, P3D);
  fill(100,100,200);
  for (int i = 0; i<density; i++) {
    b[i] = new object();
    
  }
  frameRate(30);
}

void draw() {
  clear();
  background(200,200,200);
  translate(width/2, height/2);
  rotateX(PI/2);
  rotateZ(frameCount/30.);
  translate(0,0,-200);
  scale(0.5);
  box(50);
  for (int i = 0; i<density; i++) {
    b[i].move();
  }
}
