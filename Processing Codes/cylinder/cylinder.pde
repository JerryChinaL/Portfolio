void setup() {
  beginShape(TRIANGLES);
  size(500, 500, P3D);
 fill(80, 100, 230);
 //noFill();
  background(150, 60, 340);
  stroke(230,50,20);
  strokeWeight(0.5);
}

void draw(){
cylinder(16);
}
void cylinder(int level) {
  clear();
  lights();
  level = 360/level;  
  int r = 50;
  translate(250, 250, 0);
  rotateX(frameCount/50.);
  rotateY(frameCount/200.);
  rotateZ(frameCount/100.);
  for (int i = 0; i<360; i+=level) {
    vertex(cos(i*PI/180)*r, sin(i*PI/180)*r, -100);
    vertex(cos((i+level)*PI/180)*r, sin((i+level)*PI/180)*r, -100);
    vertex(cos((i+level)*PI/180)*r, sin((i+level)*PI/180)*r, 100);
  }
  for (int i = 0; i<360; i+=level) {
    vertex(cos(i*PI/180)*r, sin(i*PI/180)*r, 100);
    vertex(cos((i+level)*PI/180)*r, sin((i+level)*PI/180)*r, 100);
    vertex(cos((i)*PI/180)*r, sin((i)*PI/180)*r, -100);
  }
  
  for (int i = 0; i<360; i+=level) {
    vertex(0,0,-100);
    vertex(cos((i+level)*PI/180)*r, sin((i+level)*PI/180)*r,-100);
    vertex(cos((i)*PI/180)*r, sin((i)*PI/180)*r, -100);
  }
    for (int i = 0; i<360; i+=level) {
    vertex(0,0,100);
    vertex(cos((i+level)*PI/180)*r, sin((i+level)*PI/180)*r,100);
    vertex(cos((i)*PI/180)*r, sin((i)*PI/180)*r, 100);
  }
    
  endShape();
}
