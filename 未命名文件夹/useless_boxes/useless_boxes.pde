void setup() {
  size(1000, 1000, P3D);
  background(20,200,30);
  noStroke();
}

int i = 0; 
int r = 600;
int size = 10;
void draw() {
  clear();
  translate(150,150);
  float dx = r*cos(radians(i))+400;
  float dy = r*sin(radians(i))+400;
  camera(dx,dy,100*size,250,250,250,0,-1,0);
  boxes();
  i++;
}

int x = 100;
int y = 100;
int z = 100;

int level = 6;

void boxes() {
  for (int i = 0; i<level; i++) {
    for (int k = 0; k<level; k++) {
      for (int f = 0; f<level; f++) {
        pushMatrix();
        translate(i*x,k*y,f*z);
        rotateY(random(0,PI));
        rotateX(random(0,PI));
       // translate(i*x,k*y,f*z);
        fill(i*x,k*y,f*z);
        box(50);
        popMatrix();
      }
      }
  }
}
