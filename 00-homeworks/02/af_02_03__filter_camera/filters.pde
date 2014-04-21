
// These are just dummy functions. 
// Please implement them.

// Hint:
// Use copy_pixels_easy and copy_pixels_fast for inspiration


PImage grayscale(PImage img) {
  Filter.begin(img);
  for(int i = 0; i < Filter.source.length; i++) {
    Filter.target[i] = color(brightness(Filter.source[i]));
  }
  return Filter.end();
}

PImage threshold(PImage img, int threshold) {
  Filter.begin(img);
  for(int i = 0; i < Filter.source.length; i++) {
    Filter.target[i] = color(brightness(Filter.source[i]) > threshold ? 255 : 0);
  }
  return Filter.end();
}

PImage dilate(PImage img, int steps) {
  int w = img.width;
  int h = img.height;
  PImage target = createImage(w, h, RGB);
  img.loadPixels();
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
     
      
   
      target.pixels[y * w + x ] = img.pixels[y * w + steps];
      target.pixels[y * h + x ] = img.pixels[y * h + steps];
    }
    
  }

  target.updatePixels();
  return target;
 
}

PImage erode(PImage img, int steps) {
   int w = img.width;
  int h = img.height;
  PImage target = createImage(w, h, RGB);
  img.loadPixels();
  for(int y = steps; y < h - steps; y++) {
    for(int x = steps; x < w - steps; x++) {
     
      
   
      target.pixels[y * w + x ] = img.pixels[y * w - steps];
      target.pixels[y * h + x ] = img.pixels[y * h - steps];
    }
    
  }

  target.updatePixels();
  return target;
}












