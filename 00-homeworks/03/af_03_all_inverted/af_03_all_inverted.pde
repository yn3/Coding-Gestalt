//homeworks_03//


import controlP5.*;
PImage pic;
float trip=70;

Grassfire scan;
ControlP5 cp5;

void setup(){

 size(500,500);
 smooth();
 gui();
 pic=loadImage("deer.jpeg") ;
 pic.resize(width,height);
 pic.loadPixels();
 for (int i=0; i<pic.pixels.length; i++){
     if(brightness(pic.pixels[i])>150){
       pic.pixels[i]=color(255,0);
     }else{
       pic.pixels[i]=color(0,0);
     }
 }
 pic.updatePixels();
 scan = new Grassfire(pic);
 
}


void draw(){

 pic = scan.display();
    image(pic,0,0);

}


//

void gui(){
  cp5 = new ControlP5(this);  
  cp5.addNumberbox("numberbox")
     .setPosition(0,height-30)
     .setSize(50,30)
     .setScrollSensitivity(0.01)
     .setValue(66)
     .setRange(1,66)
     .setLabel("Burning")
     .setDirection(Controller.HORIZONTAL)
     .setMultiplier(0.1);
  cp5.getController("numberbox").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE);   

}

void numberbox(float val){
  trip=val;      
}
