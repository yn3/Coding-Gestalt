//import processing.opengl.*;
import java.text.*;
import lsystem.*;  // My custom LSystem library available at Kenai version 0.5.0
// http://kenai.com/projects/l-system-utilities/downloads
import peasy.*;    // PeasyCam custom library v0.8.1 available at 
// http://mrfeinberg.com/peasycam/#download
PeasyCam cam;
Grammar grammar;

float distance = 420;
int depth = 3,error=1;
float theta = radians(90);
float phi = radians(90);
String production = "";
float cnt = 0,div = 120,val = TWO_PI/149.5,avar=0.01,fac=1,trig=1,error2=1;

boolean bool = false;
void setup() {
 
  size(700, 700, P3D);  
  cam = new PeasyCam(this, 1400);  
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(2200);
  setupGrammar();
  noStroke();  
}



void setupGrammar(){
  grammar = new SimpleGrammar(this, "X");   // this only required to allow applet to call dispose()
  grammar.addRule('X', "^<XF^<XFX-F^>>XFX&F+>>XFX-F>X->");
  production = grammar.createGrammar(depth);
  distance *= pow(0.5, depth);
  fill(random(255), random(255), random(255));
  
}

void draw() {
 
  lights();
  render();
}

void render() {
  
  

  cnt=abs(cnt+pow(val,1.907));
  
  translate(-40, 40, -40);  // center the hilbert empirically set looks good to me
  if(pow(sin(cnt*12),3)>1-avar || pow(sin(cnt*12),3)<-(1-avar)){
  fill(random(255), random(255), random(255));
   error=1;
   error2=0.001;
   avar=random(0.001,0.01);
   fac=random(0.5,3);
   trig=random(0.3,2);
 
  }else{
    background(66);error=1;error2=1;
  }
  

  lightSpecular(204, 204, 204); 
  specular(255, 255, 255); 
  shininess(fac); 
  CharacterIterator it = new StringCharacterIterator(production);
  for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()) {
    switch (ch) {
    case 'F': 
     
      translate(pow(sin(cnt/fac),3)*cos(cnt*5)-1, distance*(1+pow(sin(cnt*2*fac),12))*cos(cnt*12)/fac, pow(cos(cnt*error2),3*error2));
      box(distance/7, distance/(1+pow(sin(cnt),12))/fac*trig, distance/(9*error/fac)/fac*trig);    
      translate(pow(sin(cnt/fac),3)*cos(cnt*5)-1, distance*(1+pow(sin(cnt*2*fac),12))*cos(cnt*12)/fac, pow(cos(cnt*error2),3*error2));
      
      
       
      
      break;
    case '-':
      rotateX(theta);
      break;
    case '+':
      rotateX(-theta); 
      break;
    case '>':
      rotateY(theta-pow(sin(cnt*5*(fac/3)),3));
      break;
    case '<':
      rotateY(-theta-pow(sin(cnt*5*(fac/3)),3));
      break;
    case '&':
      rotateZ(-phi);
      break;
    case '^':
      rotateZ(phi);
      break;
    case 'X':
      break;  
    default:
      System.err.println("character " + ch + " not in grammar");
    }
  }
}


