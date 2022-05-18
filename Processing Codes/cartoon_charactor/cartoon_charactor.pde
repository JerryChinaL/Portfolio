void setup(){
  size(1280, 960);
}
void draw() {
  clear();
  fill(79,38,2);
  //translate(mouseX,mouseY);
  
  pushMatrix();
  //what youve done with the matrix in the middle of this code doesn't count
  popMatrix();
  
  ellipse(60, 15, 30, 30);
  quad(30, 30, 90, 30, 90, 80, 30, 80);
  triangle(4, 40, 30, 45, 10, 95);
  triangle(116, 40, 90, 45, 100, 95);
  strokeWeight(5);
  line(37, 37, 83, 73);
  line(83, 37, 37, 73);
  strokeWeight(5);
  rotate(atan2(mouseX,mouseY));
  rect(42, 80, 10, 15);
  rect(71, 80, 10, 15);
}
