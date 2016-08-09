class DVR{
  ArrayList<Router> routers;
  int selected = -1;
  boolean hold = false;
  int c = 97; 
  
  Button next_step,new_router;
  ScrollableList emri_r;
  CheckBox lidhjet;
  ControlGroup shtim_routeri;
  
  DVR(){
    next_step = cscene.addButton("Meso").setPosition(width/2-100,20);
    //new_router = cscene.addButton("Shto router").setPosition(width/2+50,20);
     shtim_routeri = cscene.addGroup("Routeri i ri")
                .setPosition(width/2+100,20)
                .setBackgroundHeight(100)
                .setBackgroundColor(color(200,200,200,50));      
shtim_routeri.setOpen(false);
//cscene.addLabel("Emri routerit").setPosition(5,5).setGroup(shtim_routeri);
//cscene.add("yuty").setPosition(10,40).setGroup(shtim_routeri);
 emri_r= cscene.addScrollableList("Emri i routerit").setPosition(0,5).setGroup(shtim_routeri);
    emri_r.setOpen(false).setHeight(80).setItemHeight(15);
        emri_r.setColorBackground(color(100,100,230,100)).setColorActive(color(12));
    emri_r.setColorValue(color(240,240,4));
    print(emri_r.getValueLabel());

    lidhjet = cscene.addCheckBox("Lidh routerin").setGroup(shtim_routeri);
    lidhjet.setPosition(5,40);
   
    routers = new ArrayList<Router>(); 
    for(int i=0;i<4;i++){
      
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
    
    emri_r.addItem(R.name,R.name);
    lidhjet.addItem(R.name,97+i);
    }

    for(Router R:routers){
    int nr_lidhjeve = (int)random(0,routers.size());
      for(int i=0;i<nr_lidhjeve;i++){
        int nr_routerit = (int)random(0,routers.size());
      R.connect(routers.get(nr_routerit),(int)random(1,30));
      }
    
    }

}
void activateScene(){
  pushStyle();
  fill(244,15);
  text("DVR",width/2,height/2);
  popStyle();
    //print((int)emri_r.getValue());
    for(Toggle check_r: lidhjet.getItems()){
    print(check_r.isUpdate()+" ");
    }
    println();
    
for(Router R: routers){
R.display();
//R.tab.display_table(R.position,R.changed_rows);
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

public void new_router_click(){
    print("shtooooooooooooo");
    ControlGroup shtim_routeri = cscene.addGroup("Routeri i ri")
                .setPosition(width/2+100,50)
                .setBackgroundHeight(100)
                .setBackgroundColor(color(200,200,200,50));      
}
}


public void Meso(){
  for(Router R: dvr.routers)
    R.update_table();
}