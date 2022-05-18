import ddf.minim.analysis.*;
import ddf.minim.*;
Minim       minim;
AudioPlayer jingle;
FFT         fft;
void setup()
{
  size(1920, 1080, P3D);
  minim = new Minim(this);
  jingle = minim.loadFile("misery.mp3", 1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  colorMode(HSB, 100);
  beginShape(TRIANGLES);
}

float n = 0;
int c = 0;

void draw()
{
  background(20,200,20);
  stroke(255);
  lights();
  fft.forward( jingle.mix );
  float bass = fft.calcAvg(100, 300);
  float high = fft.calcAvg(1200, 1700);

  camera((mouseX-1000)*2, (mouseY-500)*8,550, 250, 250,-99999, 0, -1, 0);
  rotateY(-PI/2);
  
  
  for (int i=0; i<500; i++) {
    pushMatrix();
    translate(-i*16,sin(c)*300, cos(c)*300);
    fill(bass,100,100);
    box(20+4*bass);
    popMatrix();
    c+=1;
  }
  for (int i=0; i<500; i++) {
    pushMatrix();
    translate(-i*16,sin(c)*700, cos(c)*700);
    fill(high*2,50,100);
    box(20+3*high);
    popMatrix();
    c+=1;
  }
  rotateY(PI/2);
  for (int i=0; i<500; i++) {
    pushMatrix();
    translate(sin(c)*500,cos(c)*500, -4000);
    fill(high*2,50,80);
    box(20+10*high);
    popMatrix();
    c+=1;
  }
  
  n+=1;
}
