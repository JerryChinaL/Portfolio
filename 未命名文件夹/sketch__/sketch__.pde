void setup() {
  size(500, 500,P3D);
  noStroke();
  background(200,20,200);
  colorMode(HSB,255);
}

float i = 0;
float speed = 3;
float k = 100;
void draw() {
  clear();
  if (i>360){
    i = 0;
  }
  zhuan(k, 200, 200);
  i+= speed;
  if (k>0){
  k-=0.1;
  }
}

void zhuan(float r, float x, float y ) {
  lights();
  fill(i,255,255);
  translate(x, y);
  translate(cos(i*PI/180)*r, sin(i*PI/180)*r,0);
  translate(0, sin(i*PI/180)*r,cos(i*PI/180)*r);
  sphere(15);
}
