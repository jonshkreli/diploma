import java.util.regex.Matcher;
import java.util.regex.Pattern;

class IPcal{
Group ip_buts;
ScrollableList klasat,mask_list[];
RadioButton cal_type;
Textfield ip[];//,mask[];
Button llogarit;
logMsg log;

int startx, starty,tw,th; String tabtxt[][]; //col row
  int txth=15;

      IPcal(){
      ip_buts= cscene.addGroup("IP buts");
      klasat = cscene.addScrollableList("Klasa").setDefaultValue(2).setPosition(width/4-127,20).setGroup(ip_buts);
      String kl[]= {"A","B","C"}; klasat.addItems(kl);
     //vlerat i mer me getValue dhe jane 1.0 2.0 3.0
      cal_type = cscene.addRadioButton("Lloji llogaritjes").setValue(1).setPosition(width/2-133,20).setGroup(ip_buts);
      cal_type.addItem("Vetem rangun e IP",1);
      cal_type.addItem("Subnetet",2);
      cal_type.addItem("Subnetet dhe IP e secilit",3);
      ip = new Textfield[4];
    //  mask = new Textfield[4];
      mask_list = new ScrollableList[4];
       String mask_num[] = {"0","128","192","224","240","248","252","254","255"};
      for(int oktet=0; oktet < 4 ;oktet++){
   ip[oktet] = cscene.addTextfield("okteti "+(oktet+1)).setPosition(width/2+oktet*50,20).setGroup(ip_buts).setWidth(45);
  // mask[oktet] = cscene.addTextfield("mask "+(oktet+1)).setLabel("").setPosition(width/2+oktet*50,60).setGroup(ip_buts).setWidth(45).setLock(true);
   // print( ip[oktet].getName()+" ");
    mask_list[oktet] = cscene.addScrollableList("mask_list "+(oktet+1)).setLabel("255").setPosition(width/2+oktet*50,60).setGroup(ip_buts).setWidth(45);
    if(oktet==0) mask_list[0].addItem("255",255).setOpen(false);
    else mask_list[oktet].addItems(mask_num).setOpen(false); 
    mask_list[oktet].setDefaultValue(0);
   // println(mask_list[oktet].getLabel()+" "+mask_list[oktet].getValue());
    }
      llogarit = cscene.addButton("Llogarit").setPosition(width-50,20).setGroup(ip_buts).setWidth(45);
    
     startx=20;  starty=100; tw=49; th=19;
     tabtxt = new String[5][10];
     for(int i=0;i<10;i++){
         tabtxt[4][i]="-";tabtxt[1][i]="-";tabtxt[2][i]="-";tabtxt[3][i]="-";
if(i==0)  {tabtxt[0][i]="IP";}
if(i==1)  {tabtxt[0][i]="Mask"; }
if(i==2)  {tabtxt[0][i]="IP subnet-it"; }
if(i==3)  {tabtxt[0][i]="IP e pare"; }
if(i==4)  {tabtxt[0][i]="IP e fundit"; }
if(i==5)  {tabtxt[0][i]="IP broadcast"; }
if(i==6)  {tabtxt[0][i]="Subnet 1"; }
if(i==7)  {tabtxt[0][i]="Subnet 2"; }
if(i==8)  {tabtxt[0][i]="Subnet f-1"; }
if(i==9)  {tabtxt[0][i]="Subnet f"; }

     }
     
     log = new logMsg(startx+tw*5+50, starty,200,20);
}
      
     void activateScene(){
       display_tab();
       log.display();
      }
      
      
  void llogarit_action(){
   // println("Lloji llogaritjes"+cal_type.getValue());
   // println("Klasa "+klasat.getLabel());
    boolean ok= true;
    boolean mask0 = false;
    int okteti_interesant=4;
    boolean okt_bool=false;
    for(int i=0;i<4;i++){
      String iptxt = ip[i].getText();
     // String masktxt = mask[i].getText();
   // println(mask_list[i].getLabel());
      int masknum = Integer.parseInt(mask_list[i].getLabel());
      String errmsg = "Duhen 3 numra te vlefshem nga 0-255. Kujdes ne oktetin "+(i+1);
     // String errmsg2 = "Duhen vetem numra nga keto: 0,128,192,224,240,248,252,254,255 tek maska.Kujdes oktetin "+(i+1);
      if(mask0==true && masknum!=0) {
        display_msg("Maska duhet 0 ne oktetin "+(i+1)); ok=false;}
      else if(mask0==true && masknum==0 && okt_bool==false) {okteti_interesant=i; okt_bool=true;}
    Pattern IPpattern = Pattern.compile("[0-9]{1,3}");
      Matcher m = IPpattern.matcher(iptxt);
      if(m.find()) { 
       /* if(masktxt.toString()=="0" || masktxt.toString()=="128" || masktxt.toString()=="192" ||
      masktxt.toString()=="224" || masktxt.toString()=="240" || masktxt.toString()=="248" || masktxt.toString()=="252"
      || masktxt.toString()=="254" || masktxt.toString()=="255"){*/
      int ipnum = Integer.parseInt(iptxt);
      if(ipnum>=0 && ipnum<256){
      //kontrollo oktetin I
      String klasa = klasat.getLabel();
      if(i==0){
      switch(klasa){
      case "A": if(!(ipnum>=1 && ipnum<=126)) 
      {display_msg("Klasa A eshte nga 1.0.0.0 ne 126.255.255.255"); ok=false;} break;
      case "B": if(!(ipnum>=128 && ipnum<=191)) 
      {display_msg("Klasa B eshte nga 128.0.0.0 ne 191.255.255.255");ok=false;} break;
      case "C":  if(!(ipnum>=192 && ipnum<=223))
      {display_msg("Klasa C eshte nga 192.0.0.0 ne 223.255.255.255xxx");ok=false;} break;
     // default: display_msg("Jep nje vlere per masken"); break;  
    }
              }
      if(i==1){
      switch(klasa){
      case "B": if(masknum!=255) 
      {display_msg("Klasa B ka maske 255.255.0.0");ok=false;} break;
      case "C":  if(masknum!=255) 
      {display_msg("Klasa C ka maske 255.255.255.0");ok=false;} break;
     // default: display_msg("Jep nje vlere per masken"); break;    
    }
      if(masknum!=255) {mask0=true;  }
               }
            if(i==2){
      switch(klasa){
      case "C":  if(masknum!=255)
      {display_msg("Klasa C ka maske 255.255.255.0"); ok=false;} break;
     // default: display_msg("Jep nje vlere per masken"); break;  
      }
      if(masknum!=255) {mask0=true; }
               }


      } else {display_msg(errmsg); ok=false; }
            //print("not find "+ip[i].getText()+".");
    //}else {display_msg(errmsg2); ok=false; }
    }else {display_msg(errmsg); ok=false; }



}//mbaron for
      if(ok) {
        println("ok");
        
        
  int magic_nr=1, firstIP=0,oktetIP=0,lastIP=0,bIP=255,subnetIP=0,firstsub=0,lastsub=255;
  String short_mask="",binary_ip="";
  for(int i=0;i<4;i++){
      String iptxt = (ip[i].getText());
     String masktxt = (mask_list[i].getLabel());
     int ipnum = Integer.parseInt(ip[i].getText());
     int masknum = Integer.parseInt(mask_list[i].getLabel());
     tabtxt[i+1][0] = iptxt;      tabtxt[i+1][1] = masktxt;
     if(i+1==okteti_interesant){
     magic_nr=256-masknum; display_msg("nr magjik=256-mask ne oktetin interesant="+magic_nr);
     oktetIP= ipnum; 
 }
 //short_mask<<=3;
 short_mask+=Integer.toBinaryString(masknum);
 binary_ip+=Integer.toBinaryString(masknum);
}
display_msg("IP ne binare: "+binary_ip);
int mask_counter = 0;
for( int i=0; i<short_mask.length(); i++ ) {
    if( short_mask.charAt(i) == '1' ) {
        mask_counter++;
    } 
}
   display_msg("Maska binare: "+short_mask+". Maska shkurt: /"+mask_counter);
   for(int i=0;i*magic_nr<oktetIP;i++){
   subnetIP=i*magic_nr;
   }
   firstIP=subnetIP+1;
   
   bIP=subnetIP+magic_nr-1;
   if(okteti_interesant==4){lastIP=bIP-1;  firstIP=subnetIP+1;}
   else {lastIP=bIP;  firstIP=subnetIP;}
    
    if(cal_type.getValue()==1){
    display_msg("x*"+magic_nr+"<"+oktetIP+" IP e subnet-it = "+subnetIP);
   // display_msg("Ip e pare ne oktetin interesant= IP e subnetit +1 = "+firstIP);
   // display_msg("IP e fundit ne oktetin interesant= IP e subnetit+nr-magjik-2 ="+lastIP);
    display_msg("Broadcast IP ne oktetin interesant = IP e subnetit+nr-magjik-1 = "+bIP);
    for(int rr=3;rr<=6;rr++){
    for(int j=1;j<okteti_interesant;j++){
    tabtxt[j][rr-1]=ip[j-1].getText();
    }
    
    if(rr==3)
    tabtxt[okteti_interesant][rr-1]=subnetIP+"";
    if(rr==4)
    tabtxt[okteti_interesant][rr-1]=firstIP+"";
    if(rr==5)
    tabtxt[okteti_interesant][rr-1]=lastIP+"";
    if(rr==6)
    tabtxt[okteti_interesant][rr-1]=bIP+"";

    for(int j=okteti_interesant+1;j<5;j++){
       if(rr==3 && okteti_interesant!=4) tabtxt[j][rr-1]="0";
      else if(rr==3 && okteti_interesant==4) tabtxt[j][rr-1]=subnetIP+"";

      
      if(rr==4 && j!=4) tabtxt[j][rr-1]="0";
      else if(rr==4 && j==4 && okteti_interesant!=4) tabtxt[j][rr-1]="1";
      else if(rr==4 && j==4 && okteti_interesant==4) tabtxt[j][rr-1]=firstIP+"";
    

      if(rr==5 && j!=4) tabtxt[j][rr-1]="255";
      else if(rr==5 && j==4 && okteti_interesant!=4) tabtxt[j][rr-1]="254";
      else if(rr==5 && j==4 && okteti_interesant==4) tabtxt[j][rr-1]=lastIP+"";
      
      if(rr==6 && okteti_interesant!=4)tabtxt[j][rr-1]="255";
      if(rr==6 && okteti_interesant==4)tabtxt[j][rr-1]=bIP+"";      
    }
    
    }//for rr
    }//if 
    else if(cal_type.getValue()==2){
      
    String klasa = klasat.getLabel();
    int okteteKlase = 1;
    if(klasa=="B") okteteKlase = 2; 
    else if(klasa=="C") okteteKlase = 3;
    
    tabtxt[okteti_interesant][2]=subnetIP+"";

      
      tabtxt[okteti_interesant][3]=subnetIP+"";
      for(int j=1;j<6;j++){
        
        tabtxt[j][2]=ip[j-1].getText(); //subnet id

        
        if(j<=okteteKlase){//pjesa para maskes se klases
        for(int rr=6;rr<10;rr++)
      tabtxt[j][rr]=tabtxt[j][0];
        }
        else if(j>okteteKlase){
        tabtxt[j][6]="0"; tabtxt[j][7]="0";
        tabtxt[j][8]="0"; tabtxt[j][9]="0";
        
        if(j<okteti_interesant){
        tabtxt[j][8]="255"; tabtxt[j][9]="255";
        }
        }
        
         if(j==okteti_interesant){
       // tabtxt[j][6]="0"; //subneti i pare
        tabtxt[j][7]=magic_nr+""; //subneti i dyte
        tabtxt[j][8]=(255-magic_nr*2)+""; //subneti i parafundit
       tabtxt[j][9]=(255-magic_nr*1)+""; //subneti i fundit
        }
      }    
    }
    
  }
  
    }
  
  void display_msg(String msg){
        println(msg);
        log.receivemsg(msg);
  }
    
  void display_tab(){
  for(int i=0;i<10;i++){
    int temp=starty;
    if(i>5) starty+=80;
  pushStyle();
  fill(100,100,255);
  rect(startx+80,starty+i*20,tw,th); rect(startx+130,starty+i*20,tw,th);
  rect(startx+180,starty+i*20,tw,th); rect(startx+230,starty+i*20,tw,th);
  fill(50,50,150);
  rect(startx,starty+i*20,tw+30,th);  
    //pushStyle();
  textSize(12); fill(3);
  text(tabtxt[1][i],startx+85,starty+txth+i*20);text(tabtxt[2][i],startx+135,starty+txth+i*20);
  text(tabtxt[3][i],startx+185,starty+txth+i*20); text(tabtxt[4][i],startx+235,starty+txth+i*20);
fill(244);
//if(i==0 || i==1 || i==2 || i==3 || i==4 || i==5 || i==6 || i==7 || i==8 || i==9)
{ text(tabtxt[0][i],startx+5,starty+txth+i*20);}

popStyle();
starty=temp;
}
  }
  
  
}

void Llogarit(){
ipcal.llogarit_action();
}