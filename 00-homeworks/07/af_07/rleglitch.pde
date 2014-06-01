PImage rle(PImage input) {

  PImage output=createImage(width/2, height/2, RGB);
  output.copy(input, 0, 0, width/2, height/2, 0, 0, output.width, output.height);
  PImage out_encode= createImage(width/2, height/2, RGB);
  out_encode.loadPixels();

  for (int i = 0; i<output.pixels.length; i++) {
    if (brightness(output.pixels[i])>100) {
      output.pixels[i] = color(255);
    } else {
      output.pixels[i] = color(0);
    }
  }


  int cnt1=1, cnt2=0;
  for (int i = 0; i<output.pixels.length-1; i++) {
    if (output.pixels[i]==output.pixels[i+1]) {
      out_encode.pixels[cnt2]=output.pixels[i];
      out_encode.pixels[cnt2+1]=output.pixels[i+1];
      cnt1++;
    } else {
      out_encode.pixels[cnt2+2]=cnt1;
      cnt2+=3;
      //out_encode.pixels[cnt2+1]=output.pixels[i];
      cnt1=1;
    }
  }



  PImage out_decode= createImage(width/2, height/2, RGB);
  out_decode.loadPixels();
  int lastValue=0, cnt3=1, cnt4=1;

  for (int i = 0; i<out_encode.pixels.length-1; i++) {
    if (out_encode.pixels[i]==lastValue) {
      cnt3= out_encode.pixels[i+1];
      for (int j = 0; j<cnt3;j++) {        
        out_decode.pixels[cnt4+j-1]=out_encode.pixels[i];
      }
      cnt4+=cnt3;
    } else {
      out_decode.pixels[cnt2]=out_encode.pixels[i];
    }
    lastValue=out_encode.pixels[i];
  }

  out_decode.updatePixels();
  return out_decode;
}

