//import java.util.*;

class hostALOHA{
  PVector location;
    int packets_num =0;
    ArrayList<packet> packetlist;
    String name;
    int lastSend;
    float rand_range = 50;
    int hostcolor;
    
  hostALOHA(int h){
    location = new PVector(4,h);
    packetlist = new  ArrayList<packet>();
    hostcolor = color(10,200,10);        
  }
  
  void clickevent(){
        if(mousePressed && lastSend !=second()){
          
 if(mouseX<location.x+40 && mouseX >location.x && 
 mouseY>location.y && mouseY< location.y+40 )
      {   
        this.createpacket();
      //print("this");
      }
    }
  }
  
  void display(){
    pushStyle();
      fill(hostcolor);
  rect(location.x,location.y,40,30); //print("[ "+location+" ]");
     fill(10,20,200);
     text(name,location.x,location.y+25);
    popStyle();
}
  
  void createpacket(){
         packet p = new packet(location);
        packetlist.add(p);
        lastSend = second();
  }
  
  void run(){
    this.display();
    this.clickevent();
    //print(rand_range);
    if( random(0,100-rand_range)<0.4){ this.createpacket(); }
    
    for(int i= packetlist.size()-1;i>=0;i--)
  {  packet paket = packetlist.get(i);
    paket.display(); paket.update();
    if(paket.jashte()==true) {
    packetlist.remove(paket);
    }
}
  }
}


class hostSlottedALOHA extends hostALOHA{
  
  long frekuenca;
  long startTime;

      hostSlottedALOHA(int h){
      super(h);
      frekuenca = (long)(random(2,5)*1000);
       startTime = System.currentTimeMillis();
     // print(startTime);
      }
        void run(){
    this.display();
    this.clickevent();
    pushStyle();
    textSize(14);
    fill(152,150,250,163);
    textFont(createFont("AndreHeavySFBoldItalic.vlw", 32),14);
    text("Pushimi: "+frekuenca+" ms",location.x+40,location.y+30); 
    popStyle();
    //print(rand_range);
        if(startTime+frekuenca < System.currentTimeMillis()){
          hostcolor = color(10,200,10);
        if( random(0,100-rand_range)<30.4){ createpacket(); }
          startTime = System.currentTimeMillis();
          print(" "+startTime);
      }
      else hostcolor = color(200,10,10);
  
    
    for(int i= packetlist.size()-1;i>=0;i--)
  {  packet paket = packetlist.get(i);
    paket.display(); paket.update();
    if(paket.jashte()==true) {
    packetlist.remove(paket);
    }
}
  }
      
}