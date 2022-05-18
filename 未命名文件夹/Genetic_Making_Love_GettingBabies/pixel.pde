class pixel {
  float mutationRate = 9.999;
  float[] rgb = new float[l];
  float sum = 0, partialSquare1 = 0, partialSquare2 = 0, dotProduct;
  pixel() {
  }

  pixel mate(pixel pi) {
    pixel n = new pixel();
    for (int i = 0; i<this.rgb.length; i++) {
      if (random(0, 10)<mutationRate) {
        n.rgb[i] = (round(random(0, 1)) == 0)? this.rgb[i]:pi.rgb[i] ; //choose one parent's DNA
      }
       else {
        n.rgb[i] = random(size);
      }
    }
    return n;
  }

  float like(float[] answer) {
    dotProduct = 0;
    for (int i = 0; i<this.rgb.length; i++) {
      
    if(round(this.rgb[i]) == round(answer[i])){
      //dotProduct+=0.1/(1+(round(this.rgb[i])-round(answer[i]))^2);
      dotProduct++;
    }
  }
  if (mousePressed == true){
    mutationRate -= 0.005;
    print("changes");
  }
    return dotProduct;
  }


  void randomize() {
    for (int i = 0; i<l; i++) {
      this.rgb[i] = random(size);
    }
  }
}
