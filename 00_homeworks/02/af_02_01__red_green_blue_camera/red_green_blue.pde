
// These are just dummy functions. 
// Please implement them.

// Hint:
// * Use copy_pixels_easy and copy_pixels_fast for inspiration
// * Use red() green() and blue() functions to get the pixel color components







PImage red(PImage img) {

  Timer.start();
  int w = img.width, h = img.height;
  PImage img2 = createImage(w, h, RGB);
  img.loadPixels();
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      img2.pixels[y * w + x] = img.pixels[y * w + x];     
    }
  } 
  tint(255,0,0);  
  img2.updatePixels();
  Timer.stop("copy pixels fast");
  return img2;
}

PImage green(PImage img) {

  Timer.start();
  int w = img.width, h = img.height;
  PImage img2 = createImage(w, h, RGB);
  img.loadPixels();
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      img2.pixels[y * w + x] = img.pixels[y * w + x];     
    }
  }  
  tint(0,255,0);
  img2.updatePixels();
  Timer.stop("copy pixels fast");
  return img2;
}

PImage blue(PImage img) {
  Timer.start();
  int w = img.width, h = img.height;
  PImage img2 = createImage(w, h, RGB);
  img.loadPixels();
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      img2.pixels[y * w + x] = img.pixels[y * w + x];     
    }
  } 
  tint(0,0,255);  
  img2.updatePixels();
  Timer.stop("copy pixels fast");
  return img2;
}






