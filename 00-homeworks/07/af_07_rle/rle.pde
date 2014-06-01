
int[] converted(PImage input) {

  //convert img to 1D-array
  int[] output = new int[input.pixels.length]; 
  for (int i = 0; i<input.pixels.length;i++) {
    output[i]=input.pixels[i];
  }
  return output;
}

int[] runLengthDecode(int[] input) {
  int[] output = new int[input.length];
  int a_leng=0;
  int cnt1=1, cnt2=0;
  for (int i = 0; i<input.length-1; i++) {
    if (input[i]==input[i+1]) {
      output[cnt2]=input[i];
      output[cnt2+1]=input[i+1];
      cnt1++;
    } else {
      output[cnt2+2]=cnt1;
      cnt2+=3;
      switch(r_mode) {
      case 3:
        output[cnt2]=input[i+1];
        break;
      }
      cnt1=1;
    }
    a_leng=cnt2;
  }


  //trim array by putting it into a smaller one
  int[] out_trim = new int[a_leng];
  for (int i = 0; i<a_leng;i++) {
    out_trim[i]=output[i];
  }  
  return out_trim;
}


// Implement the runlength decoder here
PImage runLenthDecode(int[] input) {

  int[] output = new int[width*height];
  PImage out = createImage(400, 400, ARGB);
  out.loadPixels();
  int lastValue=0, cnt1=1, cnt2=1;

  for (int i = 0; i<input.length-1; i++) {
    if (input[i]==lastValue) {
      cnt1= r_mode==5? input[i+1]-1 : input[i+1];
      for (int j = r_mode==6? 5 : 0; j<cnt1;j++) {        
        if (r_mode>1&&r_mode<3) {
          output[cnt2+int(random(j))]=input[i];
        } else {
          output[cnt2+j]=input[i];
        }
      }
      cnt2+= r_mode==4? cnt1*2 : cnt1;
    } else {
      output[cnt2]=input[i];
    }
    lastValue=input[i];
  }

  //reconvert to PImage
  for (int i = 0; i<out.pixels.length; i++) {
    out.pixels[i]=output[i];
  }
  out.updatePixels();
  return out;
}






// doesn't work bc of missing header information
// or conversion String_file to array to PImage (<- no thanks)
PImage loadImage(String filename) {
  println("Loading image " + filename);
  PImage img = super.loadImage(filename);
  return img;
}


// If an image ends in .rle, pass it to the RLE decoder 
// Assume images are always 400x400 pixels and 256 levels of gray
void saveImage(int[] input, String filename) { 
  String[] out = str(input);

  println("Saving RLE " + filename );
  saveStrings(filename, out);
}

