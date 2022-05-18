final int t1 = 558;//botton straight time
final int t2 = 880;//right curve time
final int t3 = 845;//left straight time
final int t4 = 458;//top straight time
float c=1;//basically the "t" value; when t reaches c, c adds 10 and waits for t to reach it again
float r = 100/PI;//radius of half circles
int time;
int cont = 0;
void setup() {
  size(850, 400, P3D);
  translate(50,0,0);
  frameRate(40);
  noStroke();
  textSize(30);
  text("Track?", 40, 40, 0);
  textSize(20);
  text("by- Jerry.L & Lisa.N", 40, 80, 0);
  textSize(30);
  colorMode(HSB,100);
}
//actual movement
void draw() {
  translate(width/2+50+97.5, 247.5, 0);//starting point
  fill(10,10,10);
  rect(0, -230, 90, 40);
  //timer (in milliseconds), subtract 150 because it takes that amount of time to set up track
  time = millis()/10-150-cont*2714;
  if(time>2741){
  cont++;
  c-=2741;
  }

//right curve
  if (c<t2) {
    if (time>=c) {
      fill(20*(cont+1),100,100);
      text(time, 0, -200, 0);
      translate(4*r*cos(map(time, 0, t2, -0.5*PI, 0.5*PI)),//x values 
        2*r*sin(map(time, 0, t2, -0.5*PI, 0.5*PI)+sin(map(time, 0, t2, -0.5*PI, 0.5*PI)))/0.54, 0);//y values

      c+= 10;
    }
  }
//bottom straight line
  if (time>t2 & time < t1+t2) {
    if (time>=c) {
      fill(10*(cont+1),100,100);
      text(time-(t2), 0, -200, 0);
      translate(map(time, t2, t1+t2, 0, -200), 
      2*r-10*sin(map(time, t2, t1+t2, 0, 10*PI)), 0);

      c+= 10;
    }
  }
//left curve
  if (time>t1+t2 & time< t1+t2+t3) {
    if (time>=c) {
      fill(30*(cont+1),100,100);
      text(time-(t1+t2), 0, -200, 0);
      translate(-200, 0, 0);
      translate(4*r*cos(map(time, t1+t2, t1+t2+t3, 0.5*PI, 1.5*PI)), 
        2*r*sin(map(time, t1+t2, t1+t2+t3, 0.5*PI, 1.5*PI)), 0);

      c+= 10;
    }
  }
//straight line
  if (time>t1+t2+t3 & time < t1+t2+t3+t4) {
    if (time>=c) {
      fill(40*(cont+1),100,100);
      text(time-(t1+t2+t3), 0, -200, 0);
      translate(map(time, t1+t2+t3, t1+t2+t3+t4, -200, 0), -2*r, 0);

      c+= 10;
    }
  }
  if (time > t1+t2+t3+t4) {
    fill(50,100,200);
  text("END", 0, -200, 0);
  }
  
  square(0, 0, 5);
  
}
