// made by Jack Murphy / emptyvezzel
// scrobbles are the number of music tracks
// counted by last.fm over the course of 2016/2017

PFont font;
Table scrobbles;
int page = 0;

void setup() {
  size(900, 900);
  scrobbles = loadTable("scrobbles.csv", "header");
  font = createFont("Helvetica", 32);
  textFont(font);
}

void draw() {
  background(#F2F2F2);
  fill(255, 0, 0);
  textSize(14);
  text("Scrobbles", 66, 57);
  fill(255, 0, 0);
  textSize(14);
  text("Steps", 54, 31);
  fill(#2384D9, 120);
  rect(20, 34, 20, 20);
  fill(#031373, 120);
  rect(20, 60, 20, 20);
    // Draw something good here
    translate(width/2, height/2);

    // START HERE //

    for (int i = 0; i < 12; i++) {
      pushMatrix();
      rotate(radians(i*360/12));
      stroke(#DE0D0D);
      strokeWeight(1);
      line(50, 0, 350, 0);
      fill(#031373, 120);
      rect(scrobbles.getFloat(i, 1)/12.5, 0, 20, 20);
      rectMode(CENTER);
      fill(#2384D9, 120);
      rect(scrobbles.getFloat(i, 2)/28, 0, 20, 20);
      fill(0);
      textAlign(LEFT, CENTER);
      textSize(14);
      text(scrobbles.getString(i, 0), 355, 0);
      popMatrix();
    }
  textAlign(CENTER, CENTER);
  text("Scrobbles", 0, -10);
  text("vs. Steps", 0, 10);

  // END HERE //
  endRecord();
    }