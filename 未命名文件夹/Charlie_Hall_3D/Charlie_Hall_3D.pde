PImage img;
void setup() {
  size(600, 800, P3D);
  img = loadImage("http://thelounge.sx/charlie.jpg");
  noStroke();
}

void draw() {
  clear();
  
  translate(width/2, 0);
  rotateY(frameCount/10.);
  beginShape(QUADS);

  for (int l=0; l<img.pixels.length; l++) {
    color index = img.pixels[l];
    float k= brightness(index)*4/5;
    fill(red(index), green(index), blue(index));
    vertex(l%600-300,l/600,k);
    vertex((l%600)+1-300,l/600,k);
    vertex(l%600-300,(l/600)+1,k);
    vertex((l%600)+1-300,(l/600)+1,k);
    vertex(l%600-300,l/600,k-10);
    vertex((l%600)+1-300,l/600,k-10);
    vertex(l%600-300,(l/600)+1,k-10);
    vertex((l%600)+1-300,(l/600)+1,k-10);
    
  }
  endShape();
}
