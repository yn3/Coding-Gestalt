PImage d_mix(PImage input) {

  PImage output=createImage(width/2, height/2, RGB);
  output.copy(input, 0, 0, width/2, height/2, 0, 0, output.width, output.height);
  PImage out_glitch= createImage(width/2, height/2, RGB);
  int cnt = 0, dis=0;
  for (int i = 0;  i<output.pixels.length-3; i++) {
    if (output.pixels[i]==output.pixels[i+dis]) {
      cnt++; 
      out_glitch.pixels[i+1] =output.pixels[i];
      if (cnt>10 && i<output.pixels.length-6) {
        dis=5;
      } else {
        dis=1;
      }
    } else {
      cnt=max(cnt, 1);
      out_glitch.pixels[i] =output.pixels[i+2];
      out_glitch.pixels[i+1] =output.pixels[i+4];
      out_glitch.pixels[i+2] =output.pixels[i+5];
      cnt=2;
    }
  }
  out_glitch.updatePixels();
  return out_glitch;
}

