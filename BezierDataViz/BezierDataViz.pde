// made by Jack Murphy / emptyvezzel

import processing.pdf.*;
String [] lines;
String combined;
String [] words;

float beginning = 200;
float ending = 900;

void setup() {
  size(1100, 800);
  lines = loadStrings("originSpecies.txt");
  println(lines.length);
  combined = join(lines, " ");
  println(combined.length());
  words = splitTokens(combined, " ,.!?:;\"\'");
  println(words.length);
  fill(255);
  
  for(int i = 0; i < 200; i++){
    text(words[i], 200, i*10);
  }
  rectMode(CENTER);
  textAlign(CENTER);
  noLoop();
}



void draw() {
  background(36);
  
  //DRAW LINES
  for(int i = 0; i < words.length; i++){
    if(words[i].equals ("life") || words[i].equals ("Life")){
      stroke(#1634E8, 60);
      strokeWeight(.25);
      //line(400, 700, map(i, 0, words.length, 200, 900), 100);
      noFill();
      bezier(400, 700, 400, 300, map(i, 0, words.length, 200, 900), 500, map(i, 0, words.length, 200, 900), 100);
      //(start x, start y, handleA x, handleA y, handleB x, handleB y,
      //end x, end y)
    }
    if(words[i].equals ("death") || words[i].equals ("Death")){
      stroke(#9125FF, 60);
      strokeWeight(.25);
      //line(550, 700, map(i, 0, words.length, 200, 900), 100);
      bezier(550, 700, 550, 300, map(i, 0, words.length, 200, 900), 500, map(i, 0, words.length, 200, 900), 100);
    }
    if(words[i].equals ("sea") || words[i].equals ("Sea")){
      stroke(#E816B4, 60);
      strokeWeight(.25);
      //line(700, 700, map(i, 0, words.length, 200, 900), 100);
      bezier(700, 700, 700, 300, map(i, 0, words.length, 200, 900), 500, map(i, 0, words.length, 200, 900), 100);
    }
  }

  // BOTTOM
  fill(200);
  noStroke();
  rect(400, 700, 55, 5, 5);
  rect(550, 700, 55, 5, 5);
  rect(700, 700, 55, 5, 5);
  text("life", 400, 720);
  text("death", 550, 720);
  text("sea", 700, 720);

  // TOP
  for (int i=0; i<175; i++) {
    fill(100);
    ellipse(200+i*4, 100, 2, 2);

    ellipse(200+i*4, 60, 2, 2);
  }
  fill(230, 20, 50);
  ellipse(beginning, 100, 6, 6);
  ellipse(ending, 100, 6, 6);

  fill(255);
  textSize(26);
  text("\"On The Origin of Species\" by Charles Darwin", width/2, 90);
}