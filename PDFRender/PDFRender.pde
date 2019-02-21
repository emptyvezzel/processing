// made by Jack Murphy / emptyvezzel

import processing.pdf.*;

PFont font;
Table who;

void setup(){
  size(900, 900);
  who = loadTable("who.csv", "header");
  String[] fontList = PFont.list();
  printArray(fontList);
  font = createFont("Helvetica", 32);
  noLoop();
  beginRecord(PDF, "filename.pdf");
  textFont(font);
}

void draw(){
  // Draw something good here
  translate(width/2, height/2);
  
  // START HERE //
  background(#F2F2F2);
  fill(255, 0, 0);
  
 for(int i = 0; i < 40; i++){
   pushMatrix();
   rotate(radians(i*360/40));
   stroke(0, 100);
   strokeWeight(.75);
   line(50, 0, 350, 0);
   fill(#031373, 120);
   ellipse(who.getFloat(i, 9)*100 + 150, 0, 20, 20);
   rectMode(CENTER);
   fill(#2384D9, 120);
   rect(who.getFloat(i, 13) * 5 + 150, 0, 20, 20);
   fill(#796868, 120);
   rect(who.getFloat(i, 14) * 5 + 150, 0, 20, 20);
   fill(0);
   textAlign(LEFT, CENTER);
   textSize(14);
   text(who.getString(i, 0), 355, 0);
   popMatrix();
 }
 
 textAlign(CENTER, CENTER);
 text("POPULATION", 0, 0);
 
  // END HERE //
  endRecord();
}

//EXPAND THIS FOR HOMEWORK FOR TUESDAY