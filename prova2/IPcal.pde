class IPcal{
Group ip_buts;
ScrollableList klasat;
RadioButton cal_type;
Textfield ip[];
      IPcal(){
      ip_buts= cscene.addGroup("IP buts");
      klasat = cscene.addScrollableList("Klasa").setPosition(width/4-100,20).setGroup(ip_buts);
      String kl[]= {"A","B","C","D"}; klasat.addItems(kl);
     //vlerat i mer me getValue dhe jane 1.0 2.0 3.0 4.0
      cal_type = cscene.addRadioButton("Lloji llogaritjes").setPosition(width/2-100,20).setGroup(ip_buts);
      cal_type.addItem("Vetem rangun e IP",1);
      cal_type.addItem("Subnetet",2);
      cal_type.addItem("Subnetet dhe IP e secilit",3);
      ip = new Textfield[4];
      int oktet=0;
      for(Textfield t: ip){
    cscene.addTextfield("okteti "+oktet).setPosition(width/2+oktet*50,20).setGroup(ip_buts).setWidth(45);
    oktet++;
      }
      
    }
      
     void activateScene(){
      }
      
  
}