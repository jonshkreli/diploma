class DVR{
  ArrayList<Router> routers;
  int selected = -1;
  boolean hold = false;
  int c = 97; 
  int nr_routerave;
  
  Button next_step,new_router;
  ControlGroup shtim_routeri;
  ScrollableList emri_r;
  CheckBox lidhjet;
  Slider dist_lidhjes[];

  DVR(){
    nr_routerave =4;
    next_step = cscene.addButton("Meso").setPosition(width/2-100,20);
    //new_router = cscene.addButton("Shto router").setPosition(width/2+50,20);
   shtim_routeri = cscene.addGroup("Routeri i ri")
                .setPosition(width/2+100,20)
                .setBackgroundHeight(70+nr_routerave*12)
                .setBackgroundColor(color(200,200,200,50))
                .setOpen(false);
//cscene.addLabel("Emri routerit").setPosition(5,5).setGroup(shtim_routeri);
//cscene.add("yuty").setPosition(10,40).setGroup(shtim_routeri);

    lidhjet = cscene.addCheckBox("Lidh routerin").setGroup(shtim_routeri);
    lidhjet.setPosition(5,40).setItemHeight(11).setBarHeight(3);
   
     //dist_lidhjes=cscene.addSlider("Distanca me ")
    //.setGroup(shtim_routeri).setPosition(20,40);
    dist_lidhjes = new Slider[nr_routerave];
 new_router = cscene.addButton("Shto routerin").setGroup(shtim_routeri);
  new_router.setPosition(20,nr_routerave*12+50); 
    routers = new ArrayList<Router>(); 
    for(int i=0;i<nr_routerave;i++){
      
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
    
    
    lidhjet.addItem(R.name,97+i);
    
     dist_lidhjes[i]=cscene.addSlider("Distanca me "+R.name)
    .setGroup(shtim_routeri).setPosition(30,40+i*12).setHeight(12)
    .setColorActive(color(200,26,27)).setRange(1,30).setWidth(60);
    }

    for(Router R:routers){
    int nr_lidhjeve = (int)random(0,routers.size());
      for(int i=0;i<nr_lidhjeve;i++){
        int nr_routerit = (int)random(0,routers.size());
      R.connect(routers.get(nr_routerit),(int)random(1,30));
      }
    
    }
     emri_r= cscene.addScrollableList("Emri i routerit").setPosition(0,5).setGroup(shtim_routeri);
    emri_r.setOpen(false).setHeight(80).setItemHeight(15);
    emri_r.setColorBackground(color(100,100,230,100)).setColorActive(color(12));
    emri_r.setColorValue(color(240,240,4));
    print(emri_r.getValueLabel());

    lista_emrave();

}

void lista_emrave(){
  StringList rnanes = new StringList();
  for(Router R: routers){
    rnanes.append(R.name);
  }
  
for(int i=c;i<= c+26-routers.size()-1;i++){
  boolean ekziston= false;
  String kjo_shkronje = String.valueOf((char)i).toUpperCase();
    for(Router R: routers){
    if(kjo_shkronje==R.name){
      ekziston=true;
      break;
    }
  }
if(ekziston==false)
emri_r.addItem(kjo_shkronje,kjo_shkronje);
}
}

void activateScene(){
  pushStyle();
  fill(244,15);
  text("DVR",width/2,height/2);
  popStyle();
    //print((int)emri_r.getValue());
   /* for(Toggle check_r: lidhjet.getItems()){
    print(check_r.isUpdate()+" ");
    }
    println();*/
    
     for (int i=0;i<lidhjet.getArrayValue().length;i++) {
      int n = (int)lidhjet.getArrayValue()[i];
      //print(n+" ");
  if(n==1){
    dist_lidhjes[i].setLock(false).setColorForeground(color(180,20,20));
     }
  else dist_lidhjes[i].setLock(true).setColorForeground(color(150,150,150));
    }//println();
    
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
  
    for(Slider dist_slider: dist_lidhjes){
      if(!dist_slider.isLock())
    println(dist_slider.getName()+" "+dist_slider.getValue());
  }
}


}


public void Meso(){
  for(Router R: dvr.routers)
    R.update_table();
}