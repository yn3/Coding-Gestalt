
/*

 press ESCAPE to invert and reset
 press UP and DOWN to adjust detail
 press LEFT and RIGHT for "3Ding"
 press anykEYYY to update
 
 .af
 
 */

int x=200, y=200;
int derpx = 0, derpy = 0;
int delta=3, cnt=0, spike=20;
//define cycles
int coaster=0;
int bondx;
int bondy;
int speed=3;


boolean white;

PImage update;
void setup() {
  size(600, 600); 
  float coin = random(1, 2); 
  if (coin<1.5) {
    background(255);
    white=true;
  } else {
    background(0);
    white=false;
  }
  frameRate(30);
  bondx=width/2;
  bondy=height/2;
}

void draw() {
  cnt++;

  int x_=x+derpx, y_=y+derpy;

  float ran = random(0, 1); 
  float ran2 = random(0, 1); 
  if (ran>0.75 || x<20) {
    derpx=delta;
  } else if (ran>0.5 || x>bondx-20) {
    derpx=-delta;
  } else if (ran>0.25|| y<20) {
    derpy=delta;
  } else if (ran>0.0 || y>bondy-20) {
    derpy=-delta;
  } 

  if (x>bondx) {
    bondx=int(random(width/2));
    x_=0;
  } else if (y>bondy) {
    bondy=int(random(height/2));
    y_=0;
  }
  if (ran2>0.98) {
    //delta glitch
    delta=int(random(15, 25));
  } else {
    delta=speed;
  }


  if (white) {
    stroke(0);
  } else {
    stroke(255);
  };
  line(x, y, x_, y_);
  line(y, x, y_, x_);
  switch(coaster) {
    case 0:
    break;
    case 1:
    line(y, x, y, y_);
    break;
    case 2:
    line(x, x, x, y_);
    break;
    case 3:
    line(x, y, x, x_); 
    line(y, x, y, y_);
    break;

  }
  
  x=x_;
  y=y_;

  /*
  if(cnt%5==1){
   if(white){
   background(255);
   }else{
   background(0);
   }
   }
   */
}


void keyPressed() {

  if (keyCode == UP) {
    speed++;
    if (speed>10) {
      speed=10;
    }
  } else if (keyCode == DOWN) {
    speed--;
    if (speed<2) {
      speed=2;
    }
  } else if (keyCode==ENTER) {
    white=!white;
    if (white) {
      background(255);
    } else {
      background(0);
    }
  } else if(keyCode==LEFT){
    coaster--;
    if(coaster<1){
     coaster=0; 
     println(coaster);
    }
  } else if(keyCode==RIGHT){
    coaster++;
    coaster%=4;
    println(coaster);
  }else{

    saveImage();

    PImage temp_rle = loadImage("temp.png"); 
    temp_rle = rle(temp_rle);
    pushMatrix();
    scale(1, -1);
    image(temp_rle, 0, -height);
    popMatrix(); 
    PImage temp_mix = loadImage("temp.png"); 
    temp_mix = d_mix(temp_mix);
    pushMatrix();
    scale(-1, -1);
    image(temp_mix, -width, -height);
    popMatrix();
    PImage temp_delta = loadImage("temp.png"); 
    temp_delta = d_glitch(temp_delta); 
    pushMatrix();
    scale(-1, 1);
    image(temp_delta, -width, 0);
    popMatrix();
  }
}


void saveImage() { 
  save("temp.png");
}

