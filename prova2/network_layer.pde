class DVR{
  ArrayList<Router> routers;
  int selected = -1;
  boolean hold = false;
  int c; 
  int nr_routerave;
  
  Tab simulatori,pershkrimi;
  Group simulatoriGg;

  Button next_step,new_router,reset;
  ControlGroup shtim_routeri;
  ScrollableList emri_r;
  CheckBox lidhjet;
  ArrayList<Slider>dist_lidhjes;
  ArrayList<Button>delete_buts;


  DVR(){    
   simulatori= cscene.getTab("default").setLabel("Simulatori");
    pershkrimi = cscene.addTab("Preshkrimi");
    simulatoriGg = cscene.addGroup("simulatoriGg");
    next_step = cscene.addButton("Meso").setPosition(width/2-100,10).setTab("default").setGroup(simulatoriGg);
    reset = cscene.addButton("Rivendos").setPosition(width/2-200,10).setTab("default").setGroup(simulatoriGg);
    //new_router = cscene.addButton("Shto router").setPosition(width/2+50,20);
   shtim_routeri = cscene.addGroup("Routeri i ri")
                .setPosition(width/2+100,20).setWidth(175)
                .setBackgroundColor(color(200,200,200,50))
                .setOpen(false).setTab("default").setGroup(simulatoriGg);
//cscene.addLabel("Emri routerit").setPosition(5,5).setGroup(shtim_routeri);
//cscene.add("yuty").setPosition(10,40).setGroup(shtim_routeri);
  new_router = cscene.addButton("Shto routerin").setGroup(shtim_routeri);
poziciono_butonat();
       
    emri_r= cscene.addScrollableList("Emri i routerit").setPosition(0,5).setGroup(shtim_routeri);
    emri_r.setOpen(false).setHeight(80).setItemHeight(15);
    emri_r.setColorBackground(color(100,100,230)).setColorActive(color(12));
    emri_r.setColorValue(color(240,240,4));
    print(emri_r.getValueLabel());

    
  
init_routers();  
}

void poziciono_butonat(){
          shtim_routeri .setBackgroundHeight(70+nr_routerave*12);
          new_router.setPosition(51,nr_routerave*12+50); 

}

    void init_routers(){
    lidhjet = cscene.addCheckBox("Lidh routerin").setGroup(shtim_routeri);
    lidhjet.setPosition(21,40).setItemHeight(11).setBarHeight(3);

    dist_lidhjes = new ArrayList<Slider>();
    delete_buts = new ArrayList<Button>();

          nr_routerave =4; c=97;
            poziciono_butonat();
         if(routers!=null) {
         if(routers.size()>0) {
           for(Router R: routers){
    print(R.name+" | ");
           }
         routers.clear();}
       }
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
    }

    for(Router R:routers){
    int nr_lidhjeve = (int)random(0,routers.size());
      for(int i=0;i<nr_lidhjeve;i++){
        int nr_routerit = (int)random(0,routers.size());
      R.connect(routers.get(nr_routerit),(int)random(1,30));
      }
    }

    lista_emrave();
    
  this.nr_routerave = routers.size();
  int j=0;
  for(Router R: routers){
     lidhjet.addItem(R.name,0).setLabel(R.name);
     
     Slider ds =cscene.addSlider("Distanca me "+R.name)
    .setGroup(shtim_routeri).setPosition(51,40+j*12).setHeight(12)
    .setColorActive(color(200,26,27)).setRange(1,30).setWidth(60);
    dist_lidhjes.add(ds);
    
   Button delete = cscene.addButton("del"+R.name).setLabel("X")
   .setGroup(shtim_routeri).setPosition(5,40+j*12).setHeight(12).setWidth(10);
   delete_buts.add(delete);
   
j++;  
}
}

void lista_emrave(){ 
for(int i=c;i<= c+26-routers.size()-1;i++){
  boolean exist= false;
  String kjo_shkronje = String.valueOf((char)i).toUpperCase();
    for(Router R: routers){
    if(kjo_shkronje==R.name){
      exist=true;
      break;
    }
    // if(!emri_r.getItem(R.name).isEmpty()) emri_r.removeItem(R.name);
  }
if(exist==false)
emri_r.addItem(kjo_shkronje,kjo_shkronje).setLabel(kjo_shkronje);
}

for(Toggle t:lidhjet.getItems()){
print(t.getLabel()+" L ");
}

}

void activateScene(){
  pushStyle();
  fill(244,15);
  text("DVR",width/2,height/2);
  popStyle();
  if(simulatori.isActive()){
    
     for (int i=0;i<lidhjet.getArrayValue().length;i++) {
      int n = (int)lidhjet.getArrayValue()[i];
      //print(n+" ");
  if(n==1){
    dist_lidhjes.get(i).setLock(false).setColorForeground(color(180,20,20));
     }
  else {
  dist_lidhjes.get(i).setLock(true).setColorForeground(color(150,150,150));
  }
  }
  //println();
    
for(Router R: routers){
R.display();
//R.tab.display_table(R.position,R.changed_rows);
R.tab.display_table(R.position);

R.display_lines();
display_msg(R.msg);

if(R.mouseOver()){
    R.tab.opacity = 516;
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
 else if(simulatori.isActive()){print("DSfas");}


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
    //print(emri_r.getLabel()+" ");
    ArrayList<Router> new_connections= new ArrayList<Router>();
    String NewRname = emri_r.getLabel();
    Router NewR = new Router(NewRname);
    
      for(Toggle cr: lidhjet.getItems())
      if(cr.getValue()==1)        
      for(Router R: routers)
      if(R.name == cr.getLabel()) new_connections.add(R);
    //  println();

    
    for(Slider dist_slider: dist_lidhjes)
      //if(!dist_slider.isLock())
   // println(dist_slider.getName()+" "+dist_slider.getValue());
    for(Router R: new_connections){
     // println("["+R.name+"] ["+dist_slider.getName().substring(dist_slider.getName().length()-1)+"]");
      char s = dist_slider.getName().charAt(dist_slider.getName().length()-1);
      char rn = R.name.charAt(0);
      if(rn==s) NewR.connect(R,(int)dist_slider.getValue());
  }
 
          routers.add(NewR);
          this.nr_routerave = routers.size();
          poziciono_butonat();

/*
    for(Router n: NewR.connected_routers){
    print(n.name+" ");
    }*/
    
       try{ lidhjet.addItem(NewRname,0).setLabel(NewRname);}
       catch(NullPointerException n){ print(n); display_msg(n.toString()); } 
   finally{String err="Chackbox-i "+NewRname+" ekziston"; print(err); display_msg(err);}

     Slider Newds =cscene.addSlider("Distanca me "+NewRname)
    .setGroup(shtim_routeri).setPosition(51,40+(nr_routerave-1)*12).setHeight(12)
    .setColorActive(color(200,26,27)).setRange(1,30).setWidth(60);
    try{ dist_lidhjes.add(Newds);}
    catch(ArrayIndexOutOfBoundsException n){ print(n); display_msg(n.toString()); }
    finally{String err="Slideri "+NewRname+" ekziston"; print(err); display_msg(err);}

   Button delete = cscene.addButton("del"+NewRname).setLabel("X")
   .setGroup(shtim_routeri).setPosition(5,40+(nr_routerave-1)*12).setHeight(12).setWidth(10);
   delete_buts.add(delete);


    emri_r.removeItem((String)NewRname);
   // lista_emrave();
   print("dsafdsafasd");
   for(Router R: routers) print(R.name+" ");
}

 void deleteX(String Rname){
//print("del" +Rname);
emri_r.addItem(Rname,Rname).setLabel(Rname);
char rn = Rname.charAt(0);

for(Toggle t: lidhjet.getItems()){
  //println("=="+t.getLabel().toString()+"=="+t.getName().toString()+"=="+(String)Rname+"==");
char tn = t.getName().charAt(0);
if(tn==rn) t.remove();
}

for(Slider s: dist_lidhjes){
char tn = s.getName().charAt(s.getName().length()-1);
if(tn==rn) s.remove();
}

for(Button d: delete_buts){ 
  char tn = d.getName().charAt(3);
  if(tn==rn) d.remove();
}

for(Router R:routers) {
char Rn = R.name.charAt(0);
if(Rn==rn){
  R.connected_routers.clear();
  routers.remove(R);
}}

poziciono_butonat();
}


}

public void Meso(){
  for(Router R: dvr.routers)
    R.update_table();
}

public void Rivendos(){
    dvr.emri_r.clear();
    dvr.lidhjet.remove();
    for(Slider sr: dvr.dist_lidhjes){ sr.remove(); }
    for(Button d: dvr.delete_buts){
    println(d.getName()+" "+d.getArrayValue()+" "+d.getValue()+" "+d.getValueLabel()+" "+d.getLabel());
  d.remove();  
  }
  dvr.init_routers();
}