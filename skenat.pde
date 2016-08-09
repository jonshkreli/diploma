class skena1{
     int w;
     ArrayList<hostALOHA> hostlist;
     ControlP5 opsionet;
Button plus,minus;
//Slider frekuenca;
    skena1(){
      fill(3,234,34);
      hostlist = new  ArrayList<hostALOHA>();
      
 for(int i=0;i<5;i++){
    hostALOHA host = new hostALOHA(i*100+20);
    host.name = "H"+i;
    hostlist.add(host);        
     //krijon 5 hoste me ne pozicione 0,100,200,300,400
  }
 
 plus= cscene.addButton("shto").setPosition(width/2,height-40);
//print(plus);
minus=cscene.addButton("ul").setPosition(width/2,height-20);
cscene.addLabel("Ndrysho sasine e hedhjes se paketave",60,height-40)
.setFont(createFont("Veranda",12,true));

//frekuenca= back.addSlider("Sasia",0,100).setDefaultValue(50).setPosition(width/2,height-30);
//print(frekuenca.getValue());
}  
   
    void activateScene(){
          for(hostALOHA ha: hostlist){
          ha.run(); //aktivizon te gjithe hostet          
       }
       checkpackets();
    }
    
    void checkpackets(){
        ArrayList<packet> totalpackets = new  ArrayList<packet>();

                 for(hostALOHA ha: hostlist){
               totalpackets.addAll(ha.packetlist);
                 }
          for(int i=0;i<totalpackets.size();i++){
          for(int j=i+1;j<totalpackets.size();j++){
          int x1 = (int)totalpackets.get(i).origin.x;
          int x2 = (int)totalpackets.get(j).origin.x;
          if(x2 >= x1 && x2 <= x1+30){
         //print("collision");
          totalpackets.get(i).collision();  totalpackets.get(j).collision();
          }
          }
          }

       }
    
    void zoom(){
  
    }
}
 public void shto(){
   for(hostALOHA ha: s1.hostlist)
  ha.rand_range--;
}
  public void ul(){
       for(hostALOHA ha: s1.hostlist)
  ha.rand_range++;
}



class skena2 extends skena1{
ArrayList <hostSlottedALOHA> hostlist;
  
      skena2(){
      fill(3,234,34);
      hostlist = new  ArrayList<hostSlottedALOHA>();
      
 for(int i=0;i<5;i++){
    hostSlottedALOHA host = new hostSlottedALOHA(i*100+20);
    host.name = "H"+i;
    hostlist.add(host);        
     //krijon 5 hoste me ne pozicione 0,100,200,300,400
  }
 plus= cscene.addButton("shto").setPosition(width/2,height-40);
//print(plus);
minus=cscene.addButton("ul").setPosition(width/2,height-20);
cscene.addLabel("Ndrysho sasine e hedhjes se paketave",60,height-40)
.setFont(createFont("Veranda",12,true));

//frekuenca= back.addSlider("Sasia",0,100).setDefaultValue(50).setPosition(width/2,height-30);
//print(frekuenca.getValue());
}  
  
    void activateScene(){
          for(hostSlottedALOHA ha: hostlist){
          ha.run(); //aktivizon te gjithe hostet          
       }
       checkpackets();
    }
    
        void checkpackets(){
        ArrayList<packet> totalpackets = new  ArrayList<packet>();

                 for(hostSlottedALOHA ha: hostlist){
               totalpackets.addAll(ha.packetlist);
                 }
          for(int i=0;i<totalpackets.size();i++){
          for(int j=i+1;j<totalpackets.size();j++){
          int x1 = (int)totalpackets.get(i).origin.x;
          int x2 = (int)totalpackets.get(j).origin.x;
          if(x2>=x1 && x2<=x1+30){
          //print("collision");
          totalpackets.get(i).collision();  totalpackets.get(j).collision();
          }
          }
          }

       }
  
}
 