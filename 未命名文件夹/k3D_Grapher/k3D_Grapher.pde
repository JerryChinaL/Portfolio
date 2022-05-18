float margin = -30;
float stepsize = 20;

void setup() {
  size(1000, 1000, P3D);
  background(0, 0, 0);
  fill(55, 220, 20);
  colorMode(HSB, 100);
}

void draw() {
  beginShape(QUADS);
  clear();
  translate(width/2, height/2, -500);
  rotateY(PI/2);
  rotateX(PI/2);
  rotateZ(mouseX/100.);
  rotateZ(frameCount/160.);
  translate(0, 0, -200);
  grid(margin);
  function(70, margin);
  endShape();
}

float c = 0;
void function(int zoom, float space) {
  
  fill(80, 80, 200);
  for (float cx = space-width/2; cx<width/2-space; cx+=stepsize) {
    for (float cy = space-height/2; cy<height/2-space; cy+=stepsize) {
      pushMatrix();
      float x = (cx)/zoom;
      float y = (cy)/zoom;
      float ss = stepsize/zoom;  //stepsize after zoom
      
      float f_of_xy1 = sin(x+c)*cos(y+c)/2;
      f_of_xy1 = f_of_xy1*zoom;
      float f_of_xy2 = sin(x+ss+c)*cos(y+c)/2;
      f_of_xy2 = f_of_xy2*zoom;
      float f_of_xy3 = sin(x+c)*cos(y+ss+c)/2;
      f_of_xy3 = f_of_xy3*zoom;
      float f_of_xy4 = sin(x+ss+c)*cos(y+ss+c)/2;
      f_of_xy4 = f_of_xy4*zoom;
      
      if (f_of_xy1<500 & f_of_xy1>-500) {
        fill((f_of_xy1+300)/5, 80, 100);
        stroke(255);
        vertex(cx,cy,f_of_xy1);
        vertex(cx+stepsize,cy,f_of_xy2);
        vertex(cx+stepsize,cy+stepsize,f_of_xy4);
        vertex(cx,cy+stepsize,f_of_xy3);
        
      }
      popMatrix();
    }
  }c+=0.05;
}

void grid(float space) {
  fill(200, 200, 20);
  pushMatrix();
  box(width-2*space, 5, 5);
  box(5, width-2*space, 5);
  box(5, 5, width-2*space);
  popMatrix();
}
