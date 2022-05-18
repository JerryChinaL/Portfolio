import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class snowman extends PApplet {

public void setup() {
  
  noStroke();
  frameRate(80);
}

public void draw() {
  lights();   //light effect
  background(0, 120, 240);   //background
  translate(250, 250, 0);  //centering
  rotateY(-0.8f);
  rotateY(frameCount/60.f);
  
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
  rotateX(0.25f*sin(frameCount/22.f)-0.2f);
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
  float n =sin(frameCount/22.f); 
  pushMatrix();
  translate(28,-115,0);
  rotateZ(1.15f*n+0.27f);
  rotateY(3.f/5*n-1);
  rotateX(-1.3f*n);
  translate(12,0,0);
  box(25,5,5); 
  //small arm
  translate(13,0,0);
  rotateY(0.5f*n+1);
  //box(5,5,25);
  translate(0,0,12);
  box(5,5,25);
  popMatrix();
  
  //left arm
  translate(-24,-115,0);
  rotateZ(4.f/5*sin(frameCount/22.f+3.5f)-0.4f);
  translate(-30,0,0);
  box(50,5,5);
  
}
  public void settings() {  size(500, 500, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "snowman" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
