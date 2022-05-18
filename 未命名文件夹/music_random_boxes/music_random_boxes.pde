import ddf.minim.analysis.*;
import ddf.minim.*;
Minim       minim;
AudioPlayer jingle;
FFT         fft;

int vision = 1000; //camera start z coordinate

//creating the x,y,z coordinates of each bass box
FloatList z1 = new FloatList(); 
FloatList x1 = new FloatList();
FloatList y1 = new FloatList();
//creating the x,y,z coordinates of each high box
FloatList z2 = new FloatList(); 
FloatList x2 = new FloatList();
FloatList y2 = new FloatList();

void setup()
{ 
  size(1920, 1080, P3D);
  minim = new Minim(this);
  jingle = minim.loadFile("easy love.mp3", 1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  colorMode(HSB, 100);
  
  //assigning values to the x,y,z coordinates of boxes
  for (int i = 0; i<500; i++) {
    z1.append(random(-3500, 0));
  }

  for (int i = 0; i<500; i++) {
    x1.append(random(-1500, 1500));
  }

  for (int i = 0; i<500; i++) {
    y1.append(random(-1500, 1500));
  }
  for (int i = 0; i<500; i++) {
    z2.append(random(-35000, 0));
  }

  for (int i = 0; i<500; i++) {
    x2.append(random(-1500, 1500));
  }

  for (int i = 0; i<500; i++) {
    y2.append(random(-1500, 1500));
  }
}

int c = 0;

void draw()
{ //basic stuff
  background(70,50,20);
  stroke(255); //white
  lights(); 
  fft.forward( jingle.mix );
  float bass = fft.calcAvg(100, 300);
  float high = fft.calcAvg(1200, 1700);
  
  for (int c = 0;c<500;c++){
    if (vision<z1.get(c)){
      z1.set(c,vision-3500);
    }
    if (vision<z2.get(c)){
      z2.set(c,vision-3500);
    }
  }
  
  //camera moving toward -z direction
  camera(250,250,vision,250,250,vision-500,0,-1,0);
  
  //boxes move with mouse
  translate(mouseX/2-00, mouseY/2-00, 0); 
  
  //making the bass music boxes using xyz coordinate lists
  for (int i = 0; i<500; i++) {
    float x = x1.get(i);
    float y = y1.get(i);
    float z = z1.get(i);
    pushMatrix();
    translate(x, y, z);
    fill(bass, 50, 60);
    box(5+bass/2);
    popMatrix();
  } 
  
  //making high music moxes with same technique
  for (int i = 0; i<500; i++) {
    float x = x2.get(i);
    float y = y2.get(i);
    float z = z2.get(i);
    pushMatrix();
    translate(x, y, z);
    fill(high*4, 80, 100);
    box(5+high*2);
    popMatrix();
  } 

  //decreasing the z coordinate of camera
  vision-=30;
}
