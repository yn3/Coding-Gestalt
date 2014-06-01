
/* .rle is without header -> saveStrings
 
 press UP for manipulation, down for cycling
 anything else for switching images
 
 .af */

String[] png_files = {
  "bunny-1.png", 
  "deer.png", 
  "turing.png", 
  "genesis.png"
};

String[] rle_files = {
  "bunny-1.rle", 
  "deer.rle", 
  "turing.rle", 
  "genesis.rle"
};

int pick = 2, r_mode = 1;
PImage leftImage, rightImage;
int w = 400, h = 400;
int b = 6;
boolean cycle=false;



void setup() {
  size(2*w+3*b, h+2*b);
  pickImage();
}

void draw() {
  if (cycle==true) {
    r_mode++; 
    pickImage();  
    frameRate(random(2, 70));
  } else {
    frameRate(30);
  }
  background(255);
  image(leftImage, b, b, w, h);
  image(rightImage, w+2*b, b, w, h);
  r_mode%=7;
}

void keyPressed() {

  if (keyCode == UP) {
    r_mode++;

    println("mode # " + r_mode);
    pickImage();
  } else if (keyCode == DOWN) {
    cycle =!cycle;
    println("cycle # " + r_mode);
    pickImage();
  } else {
    pick = (pick + 1) % 4;
    pickImage();
  }
}

void pickImage() {


  // pick image and show it on the left side
  leftImage = loadImage(png_files[pick]);

  // save it as run-length-encoded image
  int[] rle = runLengthDecode(converted(leftImage));
  saveImage(rle, rle_files[pick]);

  // load the RLE image into the right side
  // skipped loading process
  rightImage = runLenthDecode(rle);
}




