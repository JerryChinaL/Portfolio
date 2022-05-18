
//important
float level = 600;//from 1-255 or beyond
  //change the brightness with above variable
  
  float rmin = 255;
  float gmin = 255;
  float bmin = 255;

  float rmax = 0;
  float gmax = 0;
  float bmax = 0;
PImage img;
void setup() {
  size(880,800);
  img = loadImage("https://icdn3.digitaltrends.com/image/volcano-flyover-featured-image-fortnite-season-8-patch-8-0-7133-1920x1080.jpg");
  image(img, 0, 0);  
  loadPixels();
  for (int pix = 0; pix<pixels.length; pix++) {
    float r = red(pixels[pix]);
    if (r > rmax) {
      rmax = r;
    }
    if (r<rmin) {
      rmin = r;
    }
    float g = green(pixels[pix]);
    if (g > gmax) {
      gmax = g;
    }
    if (g<gmin) {
      gmin = g;
    }
    float b = blue(pixels[pix]);
    if (b > bmax) {
      bmax = b;
    }
    if (b<bmin) {
      bmin = b;
    }
  }

  for (int pix = 0; pix<pixels.length; pix++) {
    float re = red(pixels[pix]);
    float gr = green(pixels[pix]);
    float bl = blue(pixels[pix]);
    re = (re-rmin)/(rmax-rmin)*level;
    gr = (gr-gmin)/(gmax-gmin)*level;
    bl = (bl-bmin)/(bmax-bmin)*level;
    color n = color(re,gr,bl);
    pixels[pix] = n;
  }

  updatePixels();
}
