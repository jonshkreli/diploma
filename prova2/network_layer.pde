class DVR{
  ArrayList<Router> routers;
  int selected = -1;
  boolean hold = false;
  
  Button next_step;
  
  DVR(){
    routers = new ArrayList<Router>();
    int c = 97; 
    
    for(int i=0;i<6;i++){
      
      boolean afer = false;
      PVector poz = new PVector(random(0+50,width-100),random(50,height-100));
      if(i>0)
      for(Router R: routers){
        float dist = poz.dist(R.position);
        if(dist<150) afer = true;
      }
      
      if(afer==true){i--; continue;}
      
      Router R =new Router(String.valueOf((char)c).toUpperCase(),poz);
    routers.add(R);
    R.tab.insert_row(R.name,R.name,0);
    c++;
    }

    for(Router R:routers){
    int nr_lidhjeve = (int)random(0,routers.size());
      for(int i=0;i<nr_lidhjeve;i++){
        int nr_routerit = (int)random(0,routers.size());
      R.connect(routers.get(nr_routerit),(int)random(0,30));
      }
    
    }
    
    next_step = cscene.addButton("next").setPosition(width/2,20);
    
  }
void activateScene(){
  pushStyle();
  fill(244);
  text("DVR",width/2,height/2);
  popStyle();

for(Router R: routers){
R.display();
R.tab.display_table(R.position);
R.display_lines();
display_msg(R.msg);

if(R.mouseOver()){
    R.tab.opacity = 200;
} else R.tab.opacity = 100;

}

 if (hold&&selected!=-1) {
    // 
    Router currentR = routers.get(selected);
    //currentRect.x+=mouseX-pmouseX;
    //currentRect.y+=mouseY-pmouseY;
    currentR.position.x = mouseX;
    currentR.position.y = mouseY;
    //print(selected);
  }
          mousePressed();
    mouseReleased();

}

void display_msg(String msg){
      pushStyle();
      fill(240,240,24,172);
      rect(width/2-100,height-20,200,20);
      fill(25);
      textSize(12);
      text(msg,width/2-100+2,height-5);
      popStyle();
     // print(msg);
}


void mousePressed() {
  selected = -1;
  hold = true;
    //print(selected);
    for (int i = routers.size()-1; i >= 0; i--) {
      Router currentR = routers.get(i);
      if (currentR.mouseOver() && mousePressed) {
        // mouse
        selected = i;
        //print(i);
        break;
      }
    }
}

void mouseReleased() {
  hold=false;
}
}


public void next(){
    dvr.routers.get(0).update_table();
}