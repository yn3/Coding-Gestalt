///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 02      -   Excercise 04             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//                FILLING SHAPES                 //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  Implement a filling function in              //
//  >>> moore_fill.pde <<<                       //
//  that uses a moore neighborhood for filling   //
//  a region                                     //
//                                               //
///////////////////////////////////////////////////

import java.util.Stack;

color fg_color = #000000;
color bg_color = #ffffff;
color fill_color = #ff6666;
color track_color = #6666ff;
color fill_color2 = #ffff66;
color track_color2 = #66ffff;
int speed = 100;
final int FALSE = 0, TRUE = 1, MAYBE = -1;
boolean sw = false;

NeumannFill fl;  
MooreFill fl2;

void setup() {
  size(500, 500);
  reset();
}

void reset() {
  
  // draw something to be filled
  background(bg_color);
  for(int i = 0; i < 20; i++) {
    
    float r = random(40, 100);
    float x = random(r, width - r);
    float y = random(r, height - r);
    
    fill(fg_color); noStroke();
    ellipse(x, y, r, r);
    fill(bg_color);
    ellipse(x, y, r/2, r/2);
    
  }
  
  // reset our fill tool
  
  fl = new NeumannFill();
  fl2 = new MooreFill();
}

void draw() {
  
  
  if(sw) {
     
  
      for(int i = 0; i < speed; i++) {
    
        int next = fl2.hasNext();
    
        switch(next) {
      
          case TRUE:
           label("MOORE  -  filling ");
            int[] v = fl2.getNext();
            set(v, fill_color2);
          break;
      
          case MAYBE:
            label("MOORE  -  backtracing");
            set(fl2.pos, track_color2);
            break;
        
          case FALSE:
            label("MOORE  -  finished");
            break;
      
        }
      }
    }else{
  
       for(int i = 0; i < speed; i++) {
    
        int next = fl.hasNext();
    
        switch(next) {
      
          case TRUE:
           label("NEUMANN  -  filling");
            int[] v = fl.getNext();
            set(v, fill_color);
          break;
      
          case MAYBE:
            label("NEUMANN  -  backtracing");
            set(fl.pos, track_color);
            break;
        
          case FALSE:
            label("NEUMANN  -  finished");
            break;
      
        }
      }
  
  
   }
}

// modifying get + set to accomodate for vectors ( implemented as int[] arrays ) 
color get(int[] v) {
  return get(v[0], v[1]); 
}

void set(int[] v, color c) {
  set(v[0], v[1], c);
}


// draw a label
void label(String txt) {
  fill(bg_color); rect(0, 0, width, 22);
  fill(fg_color); text(txt, 20, 20); 
  fill(bg_color); rect(20, height-20, width, 22);
  fill(fg_color); text("Press M to switch modes / anything else to redraw shapes", 20, height-10); 
}




////////////////// interaction  ////////////////// 

void keyPressed() {
  if(key == 'm' || key == 'M') {
   sw = !sw;
  }else{
  reset();
  } 
}
void mousePressed() {
  if(sw) {
      fl2.setStart(mouseX, mouseY);
  }else{
      fl.setStart(mouseX, mouseY);
  }  
}

