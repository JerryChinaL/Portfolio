import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

void setup()
{
  size(512, 500, P3D);
  
  minim = new Minim(this);
  jingle = minim.loadFile("misery.mp3",1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  colorMode(HSB,100);
}

void draw()
{
  background(0);
  stroke(255);
  
  fft.forward( jingle.mix );
  
  float bass = fft.calcAvg(100,600);
  
  lights();
  
  pushMatrix();
  translate(250,250);
  
  rotateY(frameCount/100.);
  fill(bass,100,100);
  box(3*bass);
  popMatrix();
  for(int i = 0; i < fft.specSize(); i+=4)
  {
    stroke(random(1,255),random(1,255),random(1,255));
    line( i, height, i, height - fft.getBand(i)*16 );
    line( 512-i, 0, 512-i, fft.getBand(i)*16 );
  }
}
