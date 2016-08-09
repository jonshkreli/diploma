import controlP5.*;

ControlP5 kont;
ControlP5 back;
ControlP5 cscene;


Textfield titulli;
String[] menus= {"msimi1","msimi2","DVR","adaad","hgdgd","wrss"};
Button menubut[] = new Button[10];
String EmriSkenes ="";

skena1 s1; 
skena2 s2;
DVR dvr;



void setup(){
  //fullScreen(P2D);
  //noLoop();
  size(600,400);
kont = new ControlP5(this);
titulli = kont.addTextfield("Bazat e network-ut").setPosition(0,0).setSize(width,40);
titulli.setWidth(width);
titulli.setFont( createFont("Arial",24,true) );


cscene = new ControlP5(this); //kontrolli skenes

back = new ControlP5(this);
back.setVisible(false);
Button kthehu = back.addButton("Kthehu").setPosition(width-170,height-60).setSize(120,45).setFont(createFont("Arial",26,true));;

int h = 95;
for(int i=0;i < menus.length;i++){
//println(menus[i]);
menubut[i] = kont.addButton(menus[i]).setPosition(0,h).setSize(width, 80).setFont(createFont("Arial",26,true));
h+=80;
}

//boom = loadImage("aaa.png");
  

}


void draw() {
  background(149,12,12);

  //createScene(EmriSkenes);     
      String name=EmriSkenes;
        if(name=="skena1"){          
      s1.activateScene();
      kont.setVisible(false);
      back.setVisible(true);
      cscene.setVisible(true);     

             
    }
    
    
    
    else if(name=="skena2"){
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
    
    
    else if(name=="kthehu"){
          kont.setVisible(true);
          back.setVisible(false);
          cscene.setVisible(false);          
          cscene.remove("ul");
          cscene.remove("shto");
          cscene.remove("Ndrysho sasine e hedhjes se paketave");
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
 
}



public void msimi1(){
EmriSkenes="skena1";
   s1 = new skena1(); 
redraw();
}

public void msimi2(){
  EmriSkenes="skena2";
   s2 = new skena2(); 
redraw();
}

public void DVR(){
  EmriSkenes="DVR";
   dvr = new DVR(); 
redraw();
}

public void Kthehu(){
  //print("sdfas");
EmriSkenes="kthehu";
//s1.plus.remove();
redraw();
}