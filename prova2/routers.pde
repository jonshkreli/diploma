class Router{
 String name;
 int interfaces_num; 
 int connection_num; 
 PVector position;
 table tab;
 ArrayList<Router> connected_routers;
 //Router[] connected_routers; 
  String msg ="";
  
Router(String name){
    this.name = name;
    interfaces_num = 4;
    connection_num = 0;
    position = new PVector(random(0+50,width-100),random(50,height-100));
    display();
    //print(name);
    tab = new table();
    connected_routers = new ArrayList<Router>();
    //connected_routers = new Router[4];
}

Router(String name,PVector poz){
    this.name = name;
    interfaces_num = 4;
    connection_num = 0;
    position = poz;
    display();
    //print(name);
    tab = new table();
    connected_routers = new ArrayList<Router>();
    //connected_routers = new Router[4];
}

void display(){
    pushStyle();
    fill(245);
    stroke(4);
    ellipse(position.x,position.y,40,40);
    line(position.x-20,position.y-20,position.x+20,position.y+20);
    line(position.x-20,position.y+20,position.x+20,position.y-20);
    fill(130,130,200);
    textSize(13);
    text(name,position.x,position.y-20);
    popStyle();
    //tab.display_table();
    //tab.printtab();
}

void connect(Router R,int distance){
  
  if(connected_routers.size()<=interfaces_num){
    if(R.connected_routers.size()<=interfaces_num){
      if(tab.findRow(R.name,"Destinacioni")!=null){
        msg = "Routerat jane lidhur me pare\n";
      }
      else{
      connected_routers.add(R);
      tab.insert_row(R.name,R.name,distance);
      R.tab.insert_row(name,name,distance);
      //display_lines(R);
      msg = "U lidh me sukses";
  }
    
}
  else { 
    msg = "Routeri "+R.name+" nuk ka porte te lire\n";
  }
}
  else{
    msg += "Routeri "+R.name+" nuk ka porte te lire\n";
  }
 //print(msg);
}

void display_lines(){
      pushStyle();
      stroke(34,200,123);
      strokeWeight(1.5);
      textSize(12);
      for(Router R: connected_routers){
       float Rx = R.position.x; float Ry = R.position.y;
       float x = position.x; float y = position.y;
      line(Rx,Ry,x,y);
      fill(233,4,6);
      int dist= tab.findRow(R.name,"Destinacioni").getInt("Distanca");
      text(dist,(abs(Rx)+abs(x))/2,(abs(Ry)+abs(y))/2);
      //print(R.name);
    }
      popStyle();
}

void update_table(){

    for(Router R: connected_routers){
        for(int i=0;i< R.tab.getRowCount();i++){
           TableRow tr = R.tab.getRow(i);
          String tr_dest = tr.getString("Destinacioni");
          int tr_dist = tr.getInt("Distanca"); //dist e R me ate router
           
           if(tab.findRow(tr_dest,"Destinacioni")==null){
             //nqs ky rresht nuk ekziston shtoje
             int dist_nga_R = tab.findRow(R.name,"Destinacioni")
             .getInt("Distanca");
             
           tab.insert_row(tr_dest,R.name,tr_dist+dist_nga_R);
           msg = "Rreshti u shtua";
           }
           
           else{
              // print("not null\n");
            TableRow thisrow = tab.findRow(tr_dest,"Destinacioni");
             int dist0 = thisrow.getInt("Distanca");
             int dist_nga_R = tab.findRow(R.name,"Destinacioni")
             .getInt("Distanca");
             /*dist0 eshte dist nga routeri ku jemi tek routeri qe
           qe gjendet dhe tek tabela tjeter*/
           if(dist_nga_R+tr_dist < dist0){
             println(name+" "+dist_nga_R+tr_dist+" < "+ dist0);
           /*nqs dist e R me destinacionit + dist midis routerave
           eshte me e vogel se dist aktuale modifiko rreshtin*/
             println(name+" "+" "+thisrow.getString("Destinacioni")+" "+thisrow.getString("Rruga")+" "+dist0);
             thisrow.setString("Rruga",R.name);
             thisrow.setInt("Distanca",dist_nga_R+tr_dist);
             msg = "Rreshti u modifikua";
           }
           else println(name+" "+dist_nga_R+tr_dist+" > "+ dist0);

         
         }
           
        //println(R.name+" "+tr_dest+" "+tr.getString("Rruga")+" "+tr_dist);
        }
       // println();
    }
}


  boolean mouseOver() {
    if (dist(mouseX, mouseY, position.x, position.y)<20) {
      return true;
    } else {
      return false;
    }
  }

}