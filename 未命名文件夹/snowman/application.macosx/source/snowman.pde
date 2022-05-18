void setup() {
  size(500, 500, P3D);
  noStroke();
  frameRate(80);
}

void draw() {
  lights();   //light effect
  background(0, 120, 240);   //background
  translate(250, 250, 0);  //centering
  rotateY(-0.8);
  rotateY(frameCount/60.);
  
  //platform
  pushMatrix();
  translate(0, 40, 0); 
  fill(300,230,70);
  box(300,7,300);  
  popMatrix();
  
  //main body
  fill(300,300,300); //color
  sphere(40);  //big sphere
  translate(0,-60, 0);
  rotateX(0.25*sin(frameCount/22.)-0.2);
  pushMatrix();
  translate(0,0,28);
  box(15,15,5);
  popMatrix();
  sphere(30);   //middle sphere
  translate(0,-43, 0);
  sphere(20);  //small sphere
  
  //hat
  pushMatrix();
  fill(1);  //hat color
  translate(0,-15,0);
  box(50,3,50);
  translate(0,-8,0);
  box(30,15,30);
  popMatrix();
  
  //facial organs
  pushMatrix();
  translate(0,0,20);
  fill(200,20,30);   //nose color
  box(5,5,10);  //nose
  translate(-7,-5,-4);
  fill(40,150,200);  //eye color
  sphere(4);  //left eye
  translate(14,0,0);
  sphere(4);  //right eye
  popMatrix();
  //drawing the main body, color orange   
  
  //a little error made before due to move of code
  //tired of doing calculations
  //so here's a translation
  translate(0, 147, 0); 
  
  //right arm
  float n =sin(frameCount/22.); 
  pushMatrix();
  translate(28,-115,0);
  rotateZ(1.15*n+0.27);
  rotateY(3./5*n-1);
  rotateX(-1.3*n);
  translate(12,0,0);
  box(25,5,5); 
  //small arm
  translate(13,0,0);
  rotateY(0.5*n+1);
  //box(5,5,25);
  translate(0,0,12);
  box(5,5,25);
  popMatrix();
  
  //left arm
  translate(-24,-115,0);
  rotateZ(4./5*sin(frameCount/22.+3.5)-0.4);
  translate(-30,0,0);
  box(50,5,5);
  
}
