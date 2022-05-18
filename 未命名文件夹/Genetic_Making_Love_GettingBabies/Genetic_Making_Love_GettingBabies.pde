//generating the correct list
int amount = 40, storage, storage2, l = 2500, 
size = 25, count = 0, time,counter= 0, scale = 8;
float[] answer = new float[l], similarity = new float[amount], 
  pixl = new float[l];

PImage img;
pixel[] pk = new pixel[amount];
void setup() {
  colorMode(RGB);
  img = loadImage("okoko.jpg");
  size(800, 460);
  image(img, 0, 0);  
  loadPixels();
  println(img.pixels.length);
  //making objects
  for (int i = 0; i<amount; i++) {
    pk[i] = new pixel();
  }
  for (int i = 0; i<amount; i++) {
    pk[i].randomize(); 
  }
  for (int pix = 0; pix<img.pixels.length; pix++) {
    float r = round(green(img.pixels[pix])/10);
    //float g = green(img.pixels[pix]);
    //float b = blue(img.pixels[pix]);
    pixl[pix] = r;
    //pixl[pix+1] = g;
    //pixl[pix+2] = b;
  }
  time = millis();
}

void draw() {
  scale(scale);
  clear();
  background(100, 150, 80);
  tint(0,255,0);
  image(img, 0, 0);
 
  for (int i = 0; i<amount; i++) {
    similarity[i] = pk[i].like(pixl);
  }
  if (max(similarity)==(round(l*0.99))) {
    noLoop(); 
    println(millis()-time);
  }

  //picking out the index of the biggest number
  for (int i = 0; i<amount; i++) {
    if (similarity[i] > similarity[storage] & similarity[i] < max(similarity)) {
      storage2 = i;
    } else if (similarity[i] == max(similarity)) {
      storage = i;
    }
  }
  
  //let the best and second best kids mate
  for (int i = 0; i<amount; i++) {
    pk[i] = pk[storage].mate(pk[round(random(pk.length-1))]);
  }

  //extracting some values of the current best child to make visualization
  translate(img.width+.5,0+.5);
  counter = 0;
  for (int i = 0; i<img.width; i++) {
    for (int j = 0; j<img.height; j++) {
      stroke(0,pk[storage].rgb[counter]*10,0);
      point(j,i);
      counter += 1;
    }
 }
  println("Generation: " + count);
  println(round(max(similarity)/l*100 )+ "%");
  count++;
  
}
