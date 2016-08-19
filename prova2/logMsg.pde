class logMsg{
  int lx,ly,lw,lh;
  String messages[];
  boolean plot= false; //tregon nqs array me msg esht plot
  logMsg(int x,int y,int w){
    lx=x; ly=y; lw=w;
  lh = 30;
  messages = new String[lh];
  }
 logMsg(int x,int y,int w,int sasia){
 lx=x; ly=y; lw=w; lh = sasia;
  messages = new String[sasia];
   // for(int i=0;i<lh;i++) messages[i]="";

  }
  void display(){
  pushStyle();
  fill(45);
  rect(lx,ly,lw,lh*20);
  fill(255); textSize(12);
  for(int i=0;i<lh;i++){
    if(messages[i]!=null)
  text(messages[i],lx+5,ly+i*20);
}
popStyle();
  }
  void receivemsg(String msg){
    if(plot == false)
     for(int i=0;i<lh;i++){
    if(messages[i]==null){
    messages[i] = msg; break;
    }
    if(i==lh-1 && messages[i]!=null){
    plot = true;
    }
}
else if(plot==true){
for(int i=0;i<lh;i++){
  if(i<lh-1)
messages[i]=messages[i+1];
else messages[i]=msg;
}
}

  }
  
  
}