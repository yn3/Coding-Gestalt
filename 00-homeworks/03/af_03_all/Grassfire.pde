//grassfire sortof//



class Grassfire{
  
  PImage in;
  int w = pic.width, h = pic.height;
  PImage out = createImage(w, h, RGB);
  
  
  Grassfire(PImage pic){
       in = pic;
       in.loadPixels();
       out.loadPixels();
  }


  void scanL(){
       
    for(int x=1; x<w-3; x++){
       for(int y=0; y<h-3; y++){
          if(in.pixels[x*w+y]>0){          
             out.pixels[x*w+y]=color(brightness(int(trip + northwest(x*w+y))));
             }else{
             out.pixels[x*w+y]=color(0);
             }
       }
    }

  }
    

  void scanR(){
     
   for(int x = w-2; x>1; x--){
       for(int y = h-2; y>1; y--){
          if(brightness(in.pixels[x*w+y])>0){
             out.pixels[x*w+y]=color(brightness(int(min(in.pixels[x*w+y],(trip + southeast(x*w+y))))));            
             }else{
             out.pixels[x*w+y]=color(0);
             }             
       }        
    }
   
  }
  
 
   float northwest(int index){
     float b,c,d,e,min;
     
       //northwest_alg:
       /*
       b=out.pixels[index-w];
       c=out.pixels[index+1];
       d=out.pixels[index+1+w];
       e=out.pixels[index-w+1];
       */
       //Neumann_alg:
     
     
       b=out.pixels[index+w];
       c=out.pixels[index-1];
       d=out.pixels[index-w];
       e=out.pixels[index+1];  
     
     
       min=min(b,c);
       min=min(min,d,e);
    return min; 
    
   }

   
   float southeast(int index){
     float b,c,d,e,min;
     
       //southeast_alg
       /*
       b=out.pixels[index+w];
       c=out.pixels[index-1];
       d=out.pixels[index-w-1];
       e=out.pixels[index+w-1];
       */
       //Neumann_alg

       b=out.pixels[index+w];
       c=out.pixels[index-1];
       d=out.pixels[index-w];
       e=out.pixels[index+1];  
     
       min=min(b,c);
       min=min(min,d,e);
    return min; 
     
   }
   
 
  PImage display(){
    scanL();
    scanR();
    out.updatePixels();
    return out ;
  }
 
}
