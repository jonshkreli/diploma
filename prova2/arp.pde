class ARP{
Group arpGR;
Button next,prev;
short stepNum=1;
short steps_number=6;

int colenable = color(0,0,150);
int coldisenable = color(150,150,150);

Router r1,r2;
 
 int ndarjaW = width/10;
 int ndarjaH = height/10;
PImage PC;

ARP(){
arpGR = cscene.addGroup("arpGR");
prev = cscene.addButton("Pas").setPosition(width/2-width/10-width/20,height-height/10).setGroup(arpGR).setSize(width/10,height/10-height/50);
next = cscene.addButton("Para").setPosition(width/2+width/20,height-height/10).setGroup(arpGR).setSize(width/10,height/10-height/50);
   prev.setColorBackground(colenable);
   next.setColorBackground(colenable);

r1 = new Router("r1",new PVector(ndarjaW,ndarjaH*2));
r2 = new Router("r2",new PVector(ndarjaW,ndarjaH*2+ndarjaH*5));
PC = loadImage("pc.png");
PC.resize(ndarjaW,ndarjaH);


}
  
  void activateScene(){
//    print(stepNum);
r1.display(); r2.display();
image(PC,width-ndarjaW*2,ndarjaH*2); image(PC,width-ndarjaW*2,ndarjaH*2+ndarjaH*5);

pushStyle();
stroke(14,200,80);
line(ndarjaW,ndarjaH*2,width-ndarjaW*2,ndarjaH*2); //-
line(width-ndarjaW*2,ndarjaH*2,width-ndarjaW*2,ndarjaH*2+ndarjaH*5); // |
line(ndarjaW,ndarjaH*2+ndarjaH*5,width-ndarjaW*2,ndarjaH*2+ndarjaH*5); // _
popStyle();

packet(ndarjaW+20,ndarjaH*2);

    if(stepNum==1) step1();
    if(stepNum==2) step2();
    if(stepNum==3) step3();
    if(stepNum==4) step4();
    if(stepNum==5) step5();
    if(stepNum==6) step6();
    
  }
  void step1(){
    
  }
    void step2(){
  
  }
    void step3(){
  
  }
    void step4(){
  
  }
    void step5(){
  
  }
    void step6(){
  
  }
  
  void packet(int pozX,int pozY){
  pushStyle();
  fill(255);
  rectMode(CORNER);
  rect(pozX,pozY,ndarjaW*2,ndarjaH);
  fill(0);
  line(pozX+ndarjaW,pozY,pozX+ndarjaW,pozY+ndarjaH);
  
  line(pozX,pozY+ndarjaH*0.33,pozX+ndarjaW*2,pozY+ndarjaH*0.33);
  line(pozX,pozY+ndarjaH*0.66,pozX+ndarjaW*2,pozY+ndarjaH*0.66);
textSize(ndarjaH/4); 
 text("MAC",pozX+3,pozY+(ndarjaH/3) - 5);  text("IP",pozX+(ndarjaW)+3,pozY+ndarjaH/3 - 5);

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