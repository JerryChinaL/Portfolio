/*
  
 press "n" to upgrade the tree to a new level,
 don't make it too big, or the tree will be too heavy, and dense...
 
 press "b" to make the tree bigger; press "s" to make the tree smaller...
 
 so please enjoy this fantastic tree generator
 
 Note: The author Jerry didn't copy code from any resources, all 
 codes used in this document are learned and understood by Jerry 
 The Great Imaginator.
 */

//making the tree from tree classes
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim       minim;
AudioPlayer jingle;
FFT         fft;
Tree tree;
Tree2 tree2;
Tree3 tree3;

//defining variables for sea
float margin = -300;
float wave_stepsize = 10;
float wave_speedx = 0.02;
float wave_speedy = 0.02;
float wave_x = 0;
float wave_y = 0;


//great !!!!! idea !!!! music tree!


//defining variables for tree
float tree_shake;
float i = 0; 
int camera_rotate_radius = 1600;
float size = 1;
float counter = 0;
PImage img = loadImage("https://www.oneseaecosystem.net/wp-content/uploads/sites/2/2017/03/onesea_banner_3-1-2000x1339.jpg");

void setup() {
  print("welcome to see the first three trees with sea I made!");
  size(1000, 1000, P3D);
  
  //music
  minim = new Minim(this);
  jingle = minim.loadFile("misery.mp3", 1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );

  tree = new Tree();
  tree2 = new Tree2();
  tree3 = new Tree3();
  background(100, 180, 100);
  frameRate(50);
}

void draw() {
  fft.forward( jingle.mix );
  float bass = fft.calcAvg(100, 300);
  lights();
  clear();
  pushMatrix();
  rotateY(PI/2);
  rotateX(PI/2); 
  sea_function(60, margin);
  popMatrix();

  translate(width/2-80, height);
  float dx = camera_rotate_radius*cos(radians(i));
  float dz = camera_rotate_radius*sin(radians(i));
  camera(dx, -800, dz, 0, -150, 0, 0, 1, 0);

  //stroke green for tree
  stroke(20, 200, 20);

  tree_shake = //cos(counter)/10;
  bass/15;
  //drawing tree
  pushMatrix();
  translate(-200, 0, -400);
  tree.grow(tree_shake, size);
  popMatrix();

  //drawing tree2
  pushMatrix();
  translate(400, 0, 500);
  tree2.grow(tree_shake, size);
  popMatrix();

  //drawing tree3
  tree3.grow(tree_shake, size);

  //growing until trees reach certain level
  if (tree2.generation<0) {
    tree3.renew();
    tree2.renew();
    tree.renew();
  }

  counter+=0.05;
  i+=0.3;
}


void keyPressed() {

  // keys to make tree grow(mutate)
  if (tree.generation<5) {
    if (key=='n') {
      tree.renew();
      tree2.renew();
      tree3.renew();
    }
    if (key=='b') {
      size+=0.2;
    }
    if (key=='s') {
      size-=0.2;
    }
  }
}


void sea_function(float zoom, float space) {
  noStroke();
  for (float cx = space-width/2; cx<width/2-space; cx+=wave_stepsize) {
    beginShape(TRIANGLE_STRIP);
    texture(img);
    for (float cy = space-height/2; cy<height/2-space; cy+=wave_stepsize) {

      float f1 = noise((cx)/zoom+wave_x, cy/zoom+wave_y)*zoom;
      vertex(cx, cy, f1, cx+width/2, cy+height/2);

      float f2 = noise((cx+wave_stepsize)/zoom+wave_x, cy/zoom+wave_y)*zoom;
      vertex(cx+wave_stepsize, cy, f2, cx+width/2, cy+height/2);
    }
    endShape();
  }
  wave_x+=wave_speedx;
  wave_y+=wave_speedy;
}
