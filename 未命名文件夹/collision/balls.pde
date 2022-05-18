class ball {
  float temp;
  float X, Y, vx, vy;
  float radius = 15;
  ball() {
    this.X=random(50, width-50);
    this.Y=random(50, height-50);
    this.vx = random(1, 3);
    this.vy = random(1, 3);
  }
  void move() {
    this.X += this.vx;
    this.Y += this.vy;
    pushMatrix();
    translate(this.X, this.Y);
    fill(200, 10, 10);
    ellipse(radius,radius,radius,radius);
    popMatrix();
    touch();
    bounce();
  }
  void touch() {
    for (int k = 0; k<density; k++) {
      if (this.X!=b[k].X & this.Y!=b[k].Y) {
        if (dist(this.X, this.Y, b[k].X, b[k].Y)<50) {
          if (dist(this.X, this.Y, b[k].X, b[k].Y)<=radius) {
            temp = this.vx;
            this.vx = b[k].vx;
            b[k].vx=temp;
            temp = this.vy;
            this.vy = b[k].vy;
            b[k].vy=temp;
          }
          line(this.X+radius, this.Y+radius, 
          b[k].X+radius, b[k].Y+radius);
        }
      }
    }
  }
  void bounce() {
    if (X>(width-10-radius) || X<10-radius) {
      this.vx = -this.vx;
    }
    if (Y<10-radius || Y>(height-radius)) {
      this.vy=-this.vy;
    }
  }
}
