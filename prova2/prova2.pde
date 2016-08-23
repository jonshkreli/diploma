import controlP5.*;

ControlP5 kont;
ControlP5 back;
ControlP5 cscene;
//ScrollableList main_menu;

Textfield titulli;
String[] menus= {"ALOHA","Slotted ALOHA","DVR","Llogarit IP","ARP","wrss"};

Button menubut[] = new Button[10];
String EmriSkenes ="";

skena1 s1; 
skena2 s2;
DVR dvr;
IPcal ipcal;
ARP arp;

void setup(){
  //fullScreen(P2D);
  //noLoop();
  size(600,600);
kont = new ControlP5(this);
titulli = kont.addTextfield("Bazat e network-ut").setPosition(0,0).setSize(width,40);
titulli.setWidth(width);
titulli.setFont( createFont("Arial",24,true) );


cscene = new ControlP5(this); //kontrolli skenes

back = new ControlP5(this);
back.setVisible(false);
Button kthehu = back.addButton("Kthehu").setPosition(width-170,height-60).setSize(120,45).setFont(createFont("Arial",26,true));;

//main_menu = kont.addScrollableList("Menuja").setWidth(width)
//.setHeight(height-50).setOpen(true).setPosition(0,50);

int h = 95;
for(int i=0;i < menus.length;i++){
//println(menus[i]);
menubut[i] = kont.addButton(menus[i]).setPosition(0,h).setSize(width, 80).setFont(createFont("Arial",26,true));
//main_menu.addItem(menus[i],menubut[i]);
h+=80;
}

//boom = loadImage("aaa.png");
  

}


void draw() {
  background(14,12,12,20);

  //createScene(EmriSkenes);     
      String name=EmriSkenes;
      
        if(name=="ALOHA"){          
      s1.activateScene();
      kont.setVisible(false);
      back.setVisible(true);
      cscene.setVisible(true);     

             
    }
    
    
    
    else if(name=="Slotted ALOHA"){
            s2.activateScene();
    kont.setVisible(false);
    back.setVisible(true); 
    cscene.setVisible(true);     

    }
    
        else if(name=="DVR"){
       dvr.activateScene();
    kont.setVisible(false);     
    back.setVisible(true); 
    cscene.setVisible(true);     
    }
    
     else if(name=="Llogarit IP"){
      ipcal.activateScene();
    kont.setVisible(false);     
    back.setVisible(true); 
    cscene.setVisible(true);     
    }
    
     else if(name=="ARP"){
    arp.activateScene();
    kont.setVisible(false);     
    back.setVisible(true); 
    cscene.setVisible(true);     
    }

    
    else if(name=="kthehu"){
          kont.setVisible(true);
          back.setVisible(false);
          cscene.setVisible(false);          
          cscene.remove("Simulimi Slotted ALOHA");
          cscene.remove("Simulimi ALOHA");
          cscene.remove("Preshkrimi");
          cscene.remove("simulatoriGg");
          cscene.remove("IP buts");
  }
    
  
}
/*
public void createScene(String name){
    if(name=="skena1"){
      
      s = new skena1(35);
      //skena1 s = new skena1(5);
      //s.w= s.w+20;
      s.zoom();
      kont.setVisible(false);
      back.setVisible(true);
        //println(s.w);
    }
    else if(name=="skena2"){
    line(4,45,123,234);
    ellipse(200,200,100,200);
    kont.setVisible(false);
    back.setVisible(true);
    }
    else if(name=="kthehu"){
          kont.setVisible(true);
          back.setVisible(false);
    }
  
}*/

public void controlEvent(ControlEvent theEvent) {
 // print(theEvent);
if(theEvent.isFrom("ALOHA")) msimi1();
if(theEvent.isFrom("Slotted ALOHA")) msimi2();

 
 if(theEvent.isFrom( "Shto routerin"))
 dvr.new_router_click();
 
 if(theEvent.isFrom("Preshkrimi")){print("Preshkrimi");}
  if(theEvent.isFrom("Simulatori")) {print("simulatori");}
  
  int c=97;
for(int i=c;i<c+26-1;i++) {  
  String l = String.valueOf((char)i).toUpperCase();
  if(theEvent.isFrom("del"+l)) dvr.deleteX(l);
}

if(theEvent.isFrom("Llogarit IP")) msimi4();
if(theEvent.isFrom("mask 1")) print("dsgf");

if(theEvent.isFrom(arp.next)) arp.nextBut();
if(theEvent.isFrom(arp.prev)) arp.prevBut();


}


public void msimi1(){
EmriSkenes="ALOHA";
   s1 = new skena1(); 
redraw();
}

public void msimi2(){
  EmriSkenes="Slotted ALOHA";
   s2 = new skena2(); 
redraw();
}

public void DVR(){
  EmriSkenes="DVR";
   dvr = new DVR(); 
redraw();
}

public void msimi4(){
  EmriSkenes="Llogarit IP";
   ipcal = new IPcal(); 
redraw();
}

public void ARP(){
  EmriSkenes="ARP";
   arp = new ARP(); 
redraw();
}


public void Kthehu(){
  //print("sdfas");
EmriSkenes="kthehu";
//s1.plus.remove();
redraw();
}