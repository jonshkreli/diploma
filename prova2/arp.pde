class ARP{
Group arpGR;
Button next,prev;
short stepNum=1;
short steps_number=12;

int colenable = color(0,0,150);
int coldisenable = color(150,150,150);


Router r1,r2;
 
PImage PC;

/*pozicionet e paketave*/
int x1 = itemW+itemW/6,y1 = itemH*2; //poz te h1
int x2 = width-itemW*12,y2 = itemH*2; //tek r1
int x3 = width-itemW*12,y3 = itemH*9; //tek r2
int x4 = itemW+itemW/6,y4 = itemH*9; //tek h2
int x5 = width-itemW*6,y5 = itemH*5; //mes routerave



ARP(){
arpGR = cscene.addGroup("arpGR");
prev = cscene.addButton("Pas").setPosition(width/2-width/10-width/20,height-height/10).setGroup(arpGR).setSize(width/10,height/10-height/50);
next = cscene.addButton("Para").setPosition(width/2+width/20,height-height/10).setGroup(arpGR).setSize(width/10,height/10-height/50);
   prev.setColorBackground(colenable);
   next.setColorBackground(colenable);

r1 = new Router("r1",new PVector( width-itemW*2,itemH*2));
r2 = new Router("r2",new PVector( width-itemW*2,itemH*2+itemH*9));
PC = loadImage("pc.png");
PC.resize(itemW,itemH);


}
  
  void activateScene(){
//    print(stepNum);
r1.display(); r2.display();
image(PC,itemW,itemH*2); image(PC,itemW,itemH*2+itemH*9);


pushStyle();
stroke(14,200,80);
line(itemW,itemH*2,width-itemW*2,itemH*2); //-
line(width-itemW*2,itemH*2,width-itemW*2,itemH*2+itemH*9); // |
line(itemW,itemH*2+itemH*9,width-itemW*2,itemH*2+itemH*9); // _
popStyle();


pushStyle();
textSize(itemH/2);
text("AAA  10.1.1.7/8",itemW,r1.position.y - itemH*2/3); //H1
text("DDD  192.56.231.17/28",itemW,r2.position.y - itemH*2/3); //H2

text("BBB  10.1.1.4/8",width-itemW*10/2,itemH*2-itemH*2/3); //R1 interface1
text("BBB  172.23.26.11/18",width-itemW*10/2,itemH*2+itemH*2); //R1 interface2

text("CCC  172.23.26.12/18",width-itemW*10/2,itemH*11-itemH*2/3); //R2 
text("CCC  192.56.231.3/28",width-itemW*10/2,itemH*11+itemH*2); //R2

popStyle();
    if(stepNum==1) step1();
    if(stepNum==2) step2();
    if(stepNum==3) step3();
    if(stepNum==4) step4();
    if(stepNum==5) step5();
    if(stepNum==6) step6();
    if(stepNum==7) step7();
    if(stepNum==8) step8();
    if(stepNum==9) step9();
    if(stepNum==10) step10();
    if(stepNum==11) step11();
    if(stepNum==12) step12();
  }
  
  
  
  
  void step1(){
    packet(x1,y1,new String[] {"AAA","???","10.1.1.7/8","172.18.0.4/18"});
  }
    void step2(){
    packet(x2,y2,new String[] {"AAA","???","10.1.1.7/8","172.18.0.4/18"});
  }

    void step3(){
  packet(x5,y5,new String[] {"AAA","???","172.23.26.11/18","172.23.26.12/18"});

  }
    void step4(){
  packet(x5,y5,new String[] {"AAA","???","172.23.26.11/18","172.23.26.12/18"});
  }
    void step5(){
    packet(x3,y3,new String[] {"AAA","???","192.56.231.3/28","192.56.231.5/28"});

  }
    void step6(){
      packet(x4,y4,new String[] {"AAA","???","192.56.231.3/28","192.56.231.5/28"});
  }
    void step7(){
      packet(x4,y4,new String[] {"DDD","AAA","192.56.231.5/28","192.56.231.3/28"});
  }
      void step8(){
      packet(x3,y3,new String[] {"DDD","AAA","192.56.231.5/28","192.56.231.3/28"});
  }
      void step9(){
  packet(x5,y5,new String[] {"DDD","AAA","172.23.26.12/18","172.23.26.11/18"});

  }
    void step10(){
  packet(x5,y5,new String[] {"DDD","AAA","172.23.26.12/18","172.23.26.11/18"});
  }
  
    void step11(){
    packet(x2,y2,new String[] {"DDD","AAA","10.1.1.4/8","10.1.1.7/8"});
  }
    void step12(){
    packet(x1,y1,new String[] {"DDD","AAA","10.1.1.4/8","10.1.1.7/8"});
  }
  
  void packet(int pozX,int pozY,String[] adresat){
    /* adresat[0] -> MAC derguesi    adresat[2] -> IP derguesi
       adresat[1] -> MAC marresi     adresat[3] -> IP marresi
    */
  pushStyle();
  int globalitemH = itemH; itemH = (int) (itemH*2);
  int globalitemW = itemW; itemW = (int) (itemW*1.5);
  fill(255);
  rectMode(CORNER);
  rect(pozX,pozY,itemW*4,itemH);  //drejtkendeshi tabeles
  fill(0);
  line(pozX+itemW*1,pozY,pozX+itemW*1,pozY+itemH); //vija ndarese vertikale
  
  line(pozX,pozY+itemH*0.33,pozX+itemW*4,pozY+itemH*0.33);  //vija horiz
  line(pozX,pozY+itemH*0.66,pozX+itemW*4,pozY+itemH*0.66);  //vija horiz
  textSize(itemH/4); 
 text("MAC",pozX+3,pozY+(itemH/3) -2);  text("IP",pozX+(itemW*1)+3,pozY+itemH/3 - 2);
 text(adresat[0],pozX+3,pozY+(itemH/3)*2 -2);  text(adresat[2],pozX+(itemW*1)+3,pozY+2*itemH/3 - 2);
 text(adresat[1],pozX+3,pozY+(itemH/3)*3 -2);  text(adresat[3],pozX+(itemW*1)+3,pozY+3*itemH/3 - 2);
 itemH = globalitemH; itemW = globalitemW;
  popStyle();
  }

void nextBut(){
  if(stepNum<steps_number){
    stepNum++;
       next.setColorBackground(colenable);
       prev.setColorBackground(colenable);
 }
    else{
      next.setColorBackground(coldisenable);
      prev.setColorBackground(colenable);  
  }

}
void prevBut(){
  if(stepNum>1)
   { stepNum--;
   prev.setColorBackground(colenable);
   next.setColorBackground(colenable);
 }
    else {prev.setColorBackground(coldisenable);
  next.setColorBackground(colenable);}
}


}