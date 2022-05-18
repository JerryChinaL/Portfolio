PShape s;

float margin = 0;
float stepsize = 7;
float speedx = 0.02;
float speedy = 0.02;
PImage img = loadImage("http://www.sketchuptextureclub.com/public/texture/0046-sea-water-texture-seamless.jpg");
void setup() {
  size(1000, 1000, P3D); 
  noStroke();
  //s = loadShape("el_negro_fullSize_no_stand_mm.obj");
}
void draw() {
  clear();
  lights();
  translate(width/2, height/2, -500);
  rotateY(PI/2);
  rotateX(PI/2);
  rotateZ(mouseX/100.);
  //rotateZ(frameCount/160.);
  translate(0, 0, -400);
  edge();
  sea_function(30, margin);
  //shape(s);
}
float x = 0;
float y = 0;


void edge() {
  pushMatrix();
  translate(500, 0,15);
  box(30, 1030, 50);
  translate(-1000, 0, 0);
  box(30, 1030, 50);
  translate(500, 500, 0);
  box(1030, 30, 50);
  translate(0, -1000, 0);
  box(1030, 30, 50);
  translate(0,500,-35);
  box(1030,1030,30);
  popMatrix();
  
}

void sea_function(float zoom, float space) {

  for (float cx = space-width/2; cx<width/2-space; cx+=stepsize) {
    beginShape(TRIANGLE_STRIP);
    texture(img);
    for (float cy = space-height/2; cy<height/2-space; cy+=stepsize) {

      float f1 = noise((cx)/zoom+x, cy/zoom+y)*zoom;
      vertex(cx, cy, f1, cx+width/2, cy+height/2);

      float f2 = noise((cx+stepsize)/zoom+x, cy/zoom+y)*zoom;
      vertex(cx+stepsize, cy, f2, cx+width/2, cy+height/2);
    }
    endShape();
  }
  x+=speedx;
  y+=speedy;
}
