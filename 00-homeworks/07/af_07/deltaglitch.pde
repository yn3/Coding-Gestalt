PImage d_glitch(PImage input) {

  PImage output=createImage(width/2, height/2, RGB);
  output.copy(input, 0, 0, width/2, height/2, 0, 0, output.width, output.height);
  PImage out_glitch= createImage(width/2, height/2, RGB);
  

  int cnt = 0;
  for (int i = 0;  i<output.pixels.length-3; i++) {
    if (output.pixels[i]==output.pixels[i+1]) {
      cnt++;
      if(white){out_glitch.pixels[i+1] =output.pixels[i];}
    } else {
      cnt=min(cnt, 1);
      out_glitch.pixels[i] =output.pixels[i+3];
      cnt=0;
    }
  }
  out_glitch.updatePixels();
  return out_glitch;
}




