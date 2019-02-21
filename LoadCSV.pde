// made by Jack Murphy / emptyvezzel

import ddf.minim.*;

Minim minim;
AudioSample [] piano = new AudioSample[36];
int counter = 0;
Table table;

void setup() {
  size(1000, 700);
  minim = new Minim(this);

  for (int i = 0; i<36; i++) {
    piano [i] = minim.loadSample(nf(i, 2) + "Piano.wav", 512);
  }

  piano[5].trigger();

  table = loadTable("quakes5_30.csv", "header");
  println(table.getRowCount());
  //table.getRowCount()
  //table.getColumnCount()
  //table.getFloat()
  //table.getString()
  //table.getInt()
  println(table.getFloat(0, 4));
}

void draw() {

  if (frameCount % 10 == 0) {
    counter++;
    if (counter >= table.getRowCount()) {
      counter = 0;
    }
  }

  int num = floor(map(table.getFloat(counter, 4), 5.0, 7.9, 35, 0));
  piano[num].trigger();
  int num2 = floor(map(table.getFloat(counter, 4), 5.0, 7.9, 0, 20));
  piano[num2].trigger();

  background(255);
  noStroke();
  rectMode(CENTER);

  for (int i = 0; i < table.getRowCount(); i++) {
    if (i == counter) fill(random(0, 255), random (0, 255), random(0, 255));
    else {
      fill(0);
    }
    rect(100+i*6, height/2, 4, table.getFloat(i, 4)*30);
  }
}