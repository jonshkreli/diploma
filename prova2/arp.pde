class ARP{
Group arpGR;
Button next,prev;
short stepNum=1;
short steps_number=6;

int colenable = color(0,0,150);
int coldisenable = color(150,150,150);

Router r1,r2;
 
 PImage PC;

ARP(){
arpGR = cscene.addGroup("arpGR");
prev = cscene.addButton("Pas").setPosition(width/2-width/10-width/20,height-height/10).setGroup(arpGR).setSize(width/10,height/10-height/50);
next = cscene.addButton("Para").setPosition(width/2+width/20,height-height/10).setGroup(arpGR).setSize(width/10,height/10-height/50);
   prev.setColorBackground(colenable);
   next.setColorBackground(colenable);

r1 = new Router("r1",new PVector(itemW,itemH*2));
r2 = new Router("r2",new PVector(itemW,itemH*2+itemH*5));
PC = loadImage("pc.png");
PC.resize(itemW,itemH);


}
  
  void activateScene(){
//    print(stepNum);
r1.display(); r2.display();
image(PC,width-itemW*2,itemH*2); image(PC,width-itemW*2,itemH*2+itemH*5);

pushStyle();
stroke(14,200,80);
line(itemW,itemH*2,width-itemW*2,itemH*2); //-
line(width-itemW*2,itemH*2,width-itemW*2,itemH*2+itemH*5); // |
line(itemW,itemH*2+itemH*5,width-itemW*2,itemH*2+itemH*5); // _
popStyle();

packet(itemW+20,itemH*2,new String[] {"AAA","DDD","10.1.1.7/8","172.18.0.4/18"});

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