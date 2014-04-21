
// These are just dummy functions. 
// Please implement them.

// Hint:
// Use copy_pixels_easy and copy_pixels_fast for inspiration

PImage flip(PImage img) {
   
 Timer.start();
 int w = img.width;
 int h = img.height;
 PImage img2 = createImage(w, h, RGB);
 img.loadPixels();
 for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      img2.pixels[y * w + x] = img.pixels[y * w + (w-x-1)];     
    }
  }
 
  img2.updatePixels();
  Timer.stop("copy pixels fast");
  return img2;
}

PImage flop(PImage img) {
  
 Timer.start();
 int w = img.width;
 int h = img.height;
 PImage img2 = createImage(w, h, RGB);
 img.loadPixels();
 for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      img2.pixels[y * w + x] = img.pixels[(h-y-1) * w + x];   
    }
  }
  img2.updatePixels();
  Timer.stop("copy pixels fast");
  return img2;
}






