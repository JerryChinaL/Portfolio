void setup(){
size(1000,1000);
m(1,1,1000,1000,5);

}

void m(float x0, float x1,float y0,float y1,float level){
  float x = (random(x0+30,x1-30));
  float y = (random(y0+30,y1-30));
  noStroke();
  if (level > 0)  {
    fill(random(50,255),random(50,255),random(50,255));
    rect(x0,y0,x-x0,y-y0);
    m(x0,y0,x,y,level-1);
    fill(random(50,255),random(50,255),random(50,255));
    rect(x,y0,x1-x,y-y0);
    m(x,y0,x1,y,level-1);
    fill(random(50,255),random(50,255),random(50,255));
    rect(x0,y1,x-x0,y1-y);
    m(x0,y,x,y1,level-1);
    fill(random(50,255),random(50,255),random(50,255));
    rect(x,y,x1-x,y1-y);
    m(x,y,x1,y1,level-1);
    
  }
  
  
}
