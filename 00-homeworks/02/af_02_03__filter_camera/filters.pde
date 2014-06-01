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

PImage dilate(PImage in, int steps) {

  PImage out = in.get();
   int w = out.width;
  int h = out.height;
    
  for(int i = 0; i<steps;i++){
    Filter.begin(out);
    
    for(int c = 0; c < Filter.source.length; c++) {
      int x = c%w;
      int y = c/w;
      int xmin=max(0,x-1);
      int xmax=min(w-1,x+1);
      int ymin=max(0,y-1);
      int ymax=min(h-1,y+1);
      float maxi=0;
      
      for(int yy=ymin;yy<ymax;yy++){
         for(int xx=xmin;xx<xmax;xx++){
          maxi=max(maxi,brightness(Filter.source[yy*w+xx]));
           
         }
       
        
      }
       Filter.target[c]=color(maxi); 

    }
      out=Filter.end();
  }

 
  return out;
}








PImage erode(PImage in, int steps) {

  PImage out = in.get();
   int w = out.width;
  int h = out.height;
    
  for(int i = 0; i<steps;i++){
    Filter.begin(out);
    
    for(int c = 0; c < Filter.source.length; c++) {
      int x = c%w;
      int y = c/w;
      int xmin=max(0,x-1);
      int xmax=min(w-1,x+1);
      int ymin=max(0,y-1);
      int ymax=min(h-1,y+1);
      float mini=255;
      
      for(int yy=ymin;yy<ymax;yy++){
         for(int xx=xmin;xx<xmax;xx++){
          mini=min(mini,brightness(Filter.source[yy*w+xx]));
           
         }
       
        
      }
       Filter.target[c]=color(mini); 

    }
      out=Filter.end();
  }

 
  return out;
}



int[]neighbs(int x, int y, int steps){
    int[][]nbs = new int[4][];
    int[] nb = {x,y};
    nbs[0] = new int[] { x - steps, y };
    nbs[1] = new int[] { x, y - steps };
    nbs[2] = new int[] { x + steps, y };
    nbs[3] = new int[] { x, y + steps }; 
  for (int i = 0; i<4;i++){
  nb = nbs[i]; 
   
  }
   return nb;
  
}








