class object {
  float time = millis();
  float t, x, y, z, vx, vy, vz, end;
  float gravity = -0.6;
  float r,g,b,bright;
  object() {
    this.end = random(-3000,0);
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.vx = random(-7, 7);
    this.vy = random(-7, 7);
    this.vz = 30;
    this.r = random(0,255);
    this.g = random(0,255);
    this.b = random(0,255);
    this.bright = random(30,100);
  }
  void renew() {
    //this.end += 400;
    time = millis();
    this.x=0;
    this.y=0;
    this.z=0;
    this.vz = 30;
    gravity = -0.6;
  }
  void move() {
    this.vz = this.vz + (gravity)*t/1000;
    t = millis()-time;
    this.x = this.x + this.vx*t/1000;
    this.y = this.y + this.vy*t/1000;
    this.z = this.z + this.vz*t/1000;
    pushMatrix();
    translate(this.x, this.y, this.z);
    fill(r,g,b,bright);
    box(15);
    popMatrix();
    if (this.z<this.end) {
      this.renew();
    }
  }
}
