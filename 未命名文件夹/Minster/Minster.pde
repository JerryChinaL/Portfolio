PImage img;

void setup(){
  size(1280,720);
  img = loadImage("https://cs.stab.org/1.png");
  image(img,0,0);
  k();
}

void k(){
loadPixels();
for(int p = 0; p<pixels.length;p++){
  float r = red(pixels[p])*6;
  float g = green(pixels[p])*0.6;
  float b = blue(pixels[p])*0.6;
  color n = color(r,g,b);
  pixels[p] = n;
}

updatePixels();}
