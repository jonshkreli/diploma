PImage boom;
 
 class packet{
    String sender;
    PVector origin;
    PVector vel;
    packet(PVector loc){
      origin = new PVector(loc.x+40,loc.y+10);
    // origin = loc;
          //origin.y = 100.0;
         // origin.x = 50;
         // print("origin: "+origin+" ");
        vel = new PVector(4,0);
    }
    
    void display(){
      fill(78,98,150);
        rect(origin.x,origin.y,30,20);
    }
   void update(){
     origin.add(vel);
    //this.origin.x++;
   //  print("o2: "+origin+" ");
   
    }
    
    boolean jashte(){
    if(origin.x<width && origin.x >0 && origin.y<height && origin.y >0) return false;
    else return true;
    }
    
    void collision(){
    fill(255,4,4);
     rect(origin.x,origin.y,30,20);
     
    //image(boom,origin.x,origin.y);
    }
    
}