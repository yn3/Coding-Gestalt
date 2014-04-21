

import processing.video.Capture; 





///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 02      -   Excercise 01             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//            RED GREEN BLUE CAMERA              //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  Implement the functions inside               //
//  >>> red_green_blue.pde <<<                   //
//  so they show the RGB components              //
//  of the camera image                          //
//                                               //
///////////////////////////////////////////////////

// (c) Andre Faupel at Bauhaus-Uni Weimar


import processing.video.Capture;
PFont arial;

Capture cam;
PImage img;

// camera size + output zoom
int size = 2;
int zoom = 1;

// camera capture dimensions
int w = 160 * size, h = 120 * size;

public void setup() {

  // space for 2 x 2 images
  size(w * zoom * 2 + 1, h * zoom * 2 + 1); 

  cam = new Capture(this, w, h);
  cam.start();
  
  setupDisplay();
  
}

public void draw() {
  
  // get a snapshot from the camera
  PImage snap = cam.get();

  // top left
 tint(255,255,255);
  show(snap, "original", 0, 0);

  // top right
  show(red(snap), "red", 1, 0);

  // bottom left
  show(green(snap), "green", 0, 1);

  // bottom right
  show(blue(snap), "blue", 1, 1);
}


// read a new frame when it's available
public void captureEvent(Capture c) {
  c.read();
}



// this is how to copy pixels using get and put
public PImage copy_pixels_easy(PImage source) {
  

  
  // get image dimensions
  int w = source.width;
  int h = source.height;
  
  // create a target image
  PImage target = createImage(w, h, RGB);
  


  // let the pixel pushing begin!
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      
      // just copy the pixel from the source to the target
      // this is where you do all the crazy per pixel operations
      target.set(x, y, source.get(x, y));
      
    }
  }
  


  return target;
  
}


// this is how to copy pixels using the pixels array
public PImage copy_pixels_fast(PImage img) {
  

  
  // get image dimensions
  int w = img.width, h = img.height;
  
  // create a target image
  PImage img2 = createImage(w, h, RGB);
  
  // tell the source image you are about to read pixels
  img.loadPixels();
  
  // let the pixel pushing begin!
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      
      // just copy the pixel from the source to the target
      // this is where you do all the crazy per pixel operations
      img2.pixels[y * w + x] = img.pixels[y * w + x];
      
    }
  }
  
  // tell the target image you are done writing pixels 
  img2.updatePixels();
  

  
  return img2;
  
}


// make sure to rescale font size and strokeweight
public void setupDisplay() {
  textFont(createFont("", 10.0f / zoom));
  strokeWeight(1.0f / zoom);
}


// create a snapshot and display it
public void show(PImage img, String label, int px, int py) {  
  
  float ymargin = 4.0f / zoom;
  float xmargin = 4.0f / zoom;
  
  // show image
  image(img, px * w, py * h);
  
  // draw label
  label(label, px * w + xmargin, py * h + ymargin);
 
  // image outline
  noFill(); stroke(0); rect(px * w, py * h, w, h);

}


// nice transparent label (black text on a white box)
public void label(String txt, float x, float y) {
  
  int alpha = 200;
  float xpad = 16.0f / zoom;
  float ypad = 4.0f / zoom;
  float ta = textAscent();
  float th = textAscent() + textDescent();
  float tw = textWidth(txt);

  pushStyle();
  noStroke();
  fill(255, alpha); rect(x, y, tw + 2 * xpad, th + 2 * ypad);
  fill(0, alpha); text(txt, x + xpad, y + ypad + ta);
  popStyle();
  
}


// These are just dummy functions. 
// Please implement them.

// Hint:
// * Use copy_pixels_easy and copy_pixels_fast for inspiration
// * Use red() green() and blue() functions to get the pixel color components







public PImage red(PImage img) {


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

  return img2;
}

public PImage green(PImage img) {


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

  return img2;
}

public PImage blue(PImage img) {

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

  return img2;
}











