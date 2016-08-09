enum status{fresh,modified,old}
class table extends Table{
  float opacity;
   //ArrayList<status> rowstatus;
   FloatList changed_rows;
   float r,g,b;
  table(){
    super();
    this.addColumn("Destinacioni");
  this.addColumn("Rruga");
  this.addColumn("Distanca");
  opacity = 100;
  r= 240;g= 240;b= 240;
   changed_rows = new FloatList();
  }

  void insert_row(String destination,String way, int distance){ 
  TableRow newRow = this.addRow();
    newRow.setString("Destinacioni",destination);
    newRow.setString("Rruga",way);
    newRow.setInt("Distanca",distance);
    //println(this.getString(0,"Destinacioni"));
    
  }
  void display_table(PVector rpoz/*,FloatList ch_rows*/){
   float x= rpoz.x;
   float y= rpoz.y;
  for(TableRow rresht: this.rows()){
      pushStyle();
      stroke(4);
      
     fill(r,g,b,opacity);
      rect(x,y,30,20);rect(x+30,y,30,20);rect(x+60,y,30,20);
      fill(25);
      textSize(12);
      text(rresht.getString("Destinacioni"),x+2,y+15);
      text(rresht.getString("Rruga"),x+32,y+15);
      text(rresht.getInt("Distanca"),x+62,y+15);

     // println(rresht.getString("Destinacioni")+"\t"+ rresht.getString("Rruga")+"\t"+rresht.getInt("Distanca"));
      popStyle();
      y+=20;
  }
  if(changed_rows.size()>0)
  {
    println(changed_rows);
    
  for(float y_poz: changed_rows){
    
    println("y_poz "+y_poz+" ");
             pushStyle();
             fill(200,200,100,50);
             rect(x,y_poz,90,20);
             popStyle();
  }}
 // else println("cr size: "+changed_rows.size());
  }
void printtab(){
println("sdfaasd");
}



}