class table extends Table{
  float opacity;
  
  table(){
    super();
    this.addColumn("Destinacioni");
  this.addColumn("Rruga");
  this.addColumn("Distanca");
  opacity = 100;
  }

  void insert_row(String destination,String way, int distance){ 
  TableRow newRow = this.addRow();
  newRow.setString("Destinacioni",destination);
    newRow.setString("Rruga",way);
    newRow.setInt("Distanca",distance);
    println(this.getString(0,"Destinacioni"));
  }
  void display_table(PVector rpoz){
   float x= rpoz.x;
   float y= rpoz.y;
  for(TableRow rresht: this.rows()){
      pushStyle();
      stroke(4);
     fill(240,240,240,opacity);
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
  }
void printtab(){
println("sdfaasd");
}
}