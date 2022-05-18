/*
Welcome to the fantastic dramatic fabulous project by Jerry and Lydia
 All the codes are learned rather than directly copied
 Enjoy the mixing of { Tesselation, L-system, Controlable Camera, import 3D model, Java stuff}
 
 "Press key" instructions:
 W,A,S,D keys = move around
 Space = go up
 z = go down
 n = trees grow denser
 b = trees be bigger
 v = trees be smaller
 o = trees fit the sea
 f = get inside plane
 g = get off plane
 */


Boolean on  = false;
PShape cloud;
PShape p;
int treex = 4;
int treey = 4;
float ko = 0;
Tree[] trees = new Tree[treex*treey];
Tree[] treeb = new Tree[treex*treey];

//defining variables for sea
float margin = -2000;
float wave_stepsize = 20;
float wave_speedx = 0.02;
float wave_speedy = 0.02;
float wave_x = 0;
float wave_y = 0;

//move around with wasd keys
float cameraX;
float cameraY = -500;
float cameraZ = 0;
float dx;
float dy;
float dz;
float v = 20;

//defining variables for tree
float tree_shake;
int camera_rotate_radius = 1600;
float size = 0.8;
float counter = 0;
PImage img = loadImage("https://www.oneseaecosystem.net/wp-content/uploads/sites/2/2017/03/onesea_banner_3-1-2000x1339.jpg");

void setup() {
  size(1900, 1080, P3D);

  background(100, 180, 200);
  frameRate(50);
  for (int i=0; i<trees.length; i++) { 
    trees[i] = new Tree();
    treeb[i] = new Tree();
  }
  cloud=loadShape("cloud.obj");
  p=loadShape("p.obj");
  colorMode(HSB, 100);
}

void draw() {
  clear();
  background(50, 100, 100);
  pointLight(abs(cos(counter))*70, 100, 100, 0, -500, 0);

  //import 3D models
  pushMatrix();
  translate(counter*10, -2000, 0);
  scale(0.1);
  shape(cloud);
  scale(10);
  popMatrix();

  pushMatrix();
  translate(-counter*35, -900, 0);
  rotateX(PI);
  if (sqrt(sq(cameraX+counter*35)+sq(cameraZ+900))<1000) {
  if (key=='f') {
    on = true;
  }
  if (key=='g') {
    on = false;
  }
  }

  //camera move around
  cameraMove();
  if (on == true) {
    cameraX = -counter*35;
    cameraY = -900;
    cameraZ = 0;
    PImage c = loadImage("cross.png");
    set(width/2-60,height/2-56,c);
  } else {
    shape(p);
  }
  popMatrix();
  camera(cameraX, cameraY, cameraZ, 
    cameraX+ dx, cameraY+dy, cameraZ+ dz, 
    0, 1, 0);

  //center point
  if (on == false) {
    pushMatrix();
    translate(cameraX+ dx, cameraY+dy, cameraZ+ dz);
    stroke(255);
    sphere(1);
    popMatrix();
  }

  //draw sea
  pushMatrix();
  rotateY(PI/2);
  rotateX(PI/2); 
  sea_function(60, margin);
  popMatrix();

  tree_shake = cos(counter/3)/10;

  //drawing tree
  for (int i = 0; i<treex; i++) {
    for (int j = 0; j<treey; j++) {
      pushMatrix();
      float kongx = (width-margin*1.5) / treex;
      float kongy = (width-margin*1.5) / treey;
      translate(margin-width/2+1000+ko, 0, margin-width/2+1000+ko);
      translate(i*kongx+int(cameraX/kongx)*kongx, 0, j*kongy+int(cameraZ/kongy)*kongy);
      pushMatrix();
      stroke(0);
      strokeWeight(7);
      treeb[i*j].grow(tree_shake, size);
      popMatrix();
      stroke(50, 250, 50, 70);
      strokeWeight(2);
      trees[i*j].grow(tree_shake, size);
      popMatrix();
    }
  }

  //growing until trees reach certain level

  for (int i = 0; i<treex*treey; i++) {
    if (trees[i].generation<2) {
      trees[i].renew();
    }
    if (treeb[i].generation<1) {
      treeb[i].renew();
    }
  }

  //center point
  noStroke();
  translate(counter*30, -2000, 0);
  fill(100, 100, 100, 50);
  sphere(1);
  counter+=0.2;
}


void keyPressed() {
  // keys to make tree grow(mutate)
  if (trees[1].generation<4) {
    if (key=='n') {
      for (int i=0; i<treex*treey; i++) { 
        trees[i].renew();
        treeb[i].renew();
      }
    } else if (key=='b') {
      size+=0.2;
    } else if (key=='v') {
      size-=0.2;
    } else if (key=='o') {
      ko+=200;
    }
  }
}

void keyReleased() {
  key = SHIFT;
}


void cameraMove() {
  dx = cos(map(mouseX, 0, width, 0, 2*PI))*300;
  dz = sin(map(mouseX, 0, width, 0, 2*PI))*300;
  dy = sin(map(mouseY, 0, height, -PI, PI))*300;
  if (key=='w') {
    cameraX += cos(map(mouseX, 0, width, 0, 2*PI))*v;
    cameraZ += sin(map(mouseX, 0, width, 0, 2*PI))*v;
  } 
  if (key=='s') {
    cameraX -= cos(map(mouseX, 0, width, 0, 2*PI))*v;
    cameraZ -= sin(map(mouseX, 0, width, 0, 2*PI))*v;
  } 
  if (key=='a') {
    cameraX -= cos(map(mouseX, 0, width, 0, 2*PI)+PI/2)*v;
    cameraZ -= sin(map(mouseX, 0, width, 0, 2*PI)+PI/2)*v;
  } 
  if (key=='d') {
    cameraX += cos(map(mouseX, 0, width, 0, 2*PI)+PI/2)*v;
    cameraZ += sin(map(mouseX, 0, width, 0, 2*PI)+PI/2)*v;
  }
  if (cameraY<-30) {
    if (key== 'z') {
      cameraY+=10;
    }
  }
  if (key==' ') {
    cameraY-=10;
  }
}

void sea_function(float zoom, float space) {
  noStroke();
  for (float cx = space-width/2 - cameraZ; cx<width/2-space- cameraZ; cx+=wave_stepsize) {
    beginShape(TRIANGLE_STRIP);
    texture(img);
    for (float cy = space-height/2+ cameraX; cy<height/2-space+ cameraX; cy+=wave_stepsize) {

      float f1 = noise((cx- cameraZ)/zoom+wave_x, (cy+ cameraX)/zoom+wave_y)*zoom;
      vertex(cx, cy, f1, cx+width/2, cy+height/2);

      float f2 = noise((cx+wave_stepsize- cameraZ)/zoom+wave_x, (cy+ cameraX)/zoom+wave_y)*zoom;
      vertex(cx+wave_stepsize, cy, f2, cx+width/2, cy+height/2);
    }
    endShape();
  }
  wave_x+=wave_speedx;
  wave_y+=wave_speedy;
}
