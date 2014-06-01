
  int cnt = 0;
void setup() {
  size(600, 600);
  stroke(200);

}


void draw() {
 
  background(0);
  randomSeed(0);
  cnt++;
  int boxsize = ((cnt % 1+ (mouseX/1)) + 6)/2+5;
  int ymax = width / boxsize + 1;
  int xmax = height / boxsize + 1;
  println(boxsize);
  noStroke();
  
  for(int y = 0; y < ymax; y++) {
    for(int x = 0; x < xmax; x++) {
      pushMatrix();
      translate(x * boxsize, y * boxsize);
      rotate(boxsize);
      element(boxsize, random(1));
      popMatrix();
    } 
  } 
}


void element(int boxsize, float val) {
   if(val > 0.5) {
   textSize(boxsize/5);
   if(boxsize>=width/2){
      text("NO",0,0,boxsize,boxsize);
   
   }else{
     text("YES",0,0,boxsize,boxsize);
   }
   } else {
      textSize(boxsize/12);

     triangle(0, boxsize, boxsize, 0, boxsize, 0);
   }
}

