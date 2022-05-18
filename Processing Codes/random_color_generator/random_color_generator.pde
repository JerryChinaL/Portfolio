color[] colors;  // will contain the "current generation" of colors
int count;
int len = 10;
void setup() {
  colors = makeNewColors();  // create the first generation of colors
}

void draw() {
  // TASK: make sure to draw the "current" color every time
  background(colors[count]);
  fill(random(255),random(255),random(255));
  ellipse(50,50,20,20);  // just a fun circle for you to deal with
}

void keyPressed() {
  // TASK: make it so when a key is pressed, the next color in the array will be shown
  // TASK: what happens when you "run out" of colors in the color array?
  count++;
  if (count == len){
    count=0;
    colors = makeNewColors();
  }
  print(count);
  
}

// returns a brand new array with exactly 5 colors

color[] makeNewColors() {
  color[] someNewColors = new color[len];
  for (int pos = 0; pos < len; pos++) {
    someNewColors[pos] = color(random(255),random(255),random(255));
  }
  return someNewColors;
}
