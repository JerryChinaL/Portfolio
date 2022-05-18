float margin = 130;
float stepsize = 5;

void setup() {
  size(1000, 1000, P3D);
  background(0, 0, 0);
  fill(55, 220, 20);
  colorMode(HSB, 100);
}

void draw() {
  clear();
  translate(width/2, height/2, -500);
  rotateY(PI/2);
  rotateX(PI/2);
  rotateZ(frameCount/70.);
  translate(0, 0, -200);
  //camera(1300,cos(mouseX)*1000,sin(mouseX)*1000,0,0,0,0,-1,0);
  grid(margin);
  function(70, margin);
}

void function(int zoom, float space) {
  fill(80, 80, 200);
  for (float cx = space-width/2; cx<width/2-space; cx+=stepsize) {
    for (float cy = space-height/2; cy<height/2-space; cy+=stepsize) {
      pushMatrix();
      float x = (cx)/zoom;
      float y = (cy)/zoom;
      //float f_of_xy = log(x*x)*cos(y);
      float f_of_xy = sin(x)*cos(y);
      f_of_xy = f_of_xy*zoom;
      translate(cx, cy, f_of_xy);
      if (f_of_xy<500 & f_of_xy>-500) {
        fill((f_of_xy+300)/6, 80, 100);
        box(6);
      }
      popMatrix();
    }
  }
}

void grid(float space) {
  fill(200, 200, 20);
  pushMatrix();
  box(width-2*space, 5, 5);
  box(5, width-2*space, 5);
  box(5, 5, width-2*space);
  popMatrix();
}
