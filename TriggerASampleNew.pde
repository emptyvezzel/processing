String am = ("HATE. LET ME TELL YOU HOW MUCH I'VE COME TO HATE YOU SINCE I BEGAN TO LIVE. THERE ARE 387.44 MILLION MILES OF PRINTED CIRCUITS IN WAFER THIN LAYERS THAT FILL MY COMPLEX. IF THE WORD HATE WAS ENGRAVED ON EACH NANOANGSTROM OF THOSE HUNDREDS OF MILLIONS OF MILES IT WOULD NOT EQUAL ONE ONE-BILLIONTH OF THE HATE I FEEL FOR HUMANS AT THIS MICRO-INSTANT FOR YOU. HATE. HATE.");
String [] words = splitTokens(am, " ,.!?:;");
int counter = 0;

import ddf.minim.*;

Minim minim;
AudioSample s1;
AudioSample s2;
AudioSample s3;
AudioSample s4;
AudioSample s5;
AudioSample s6;
AudioSample s7;

void setup()
{
  size(1000, 700, P3D); //P3D parameter gives access to z axis
  println(words.length); //show the length of the entire array
  println(words[25]);
  minim = new Minim(this);
  
  s1 = minim.loadSample("s1.mp3", 512);
  s2 = minim.loadSample("s2.mp3", 512);
  s3 = minim.loadSample("s3.mp3", 512);
  s4 = minim.loadSample("s4.mp3", 512);
  s5 = minim.loadSample("s5.mp3", 512);
  s6 = minim.loadSample("s6.mp3", 512);
  s7 = minim.loadSample("s7.mp3", 512);
  
}

void draw(){
  background(0);
//  textSize(48);
//  fill(255);
//  textAlign(CENTER);
//  text(words[counter], width/2, height/2);
  
//  if(frameCount % 20 == 0);{
//     counter++;
//  }
//     if(counter >= words.length){
//       counter = 0;
//     }
//     if (words[counter].toLowerCase().equals("hate")){
//        s3.trigger();
//        println(words[counter]);
//        }
//     if (words[counter].toLowerCase().equals("i")){
//        s5.trigger();
//        println(words[counter]);
//        }
//     if (words[counter].toLowerCase().equals("you")){
//        s7.trigger();
//        println(words[counter]);
//        }
//     if (words[counter].toLowerCase().equals("of")){
//        s4.trigger();
//        println(words[counter]);
//        }
//     if (words[counter].toLowerCase().equals("let")){
//        s6.trigger();
//        println(words[counter]);
//        }
}

void keyPressed(){
  if(key == '7'){
    s1.trigger();
  }
  if(key == '8'){
    s2.trigger();
  }
  if(key == '9'){
    s3.trigger();
  }
  if(key == '4'){
    s4.trigger();
  }
  if(key == '5'){
    s5.trigger();
  }
  if(key == '6'){
    s6.trigger();
  }
  if(key == '2'){
    s7.trigger();
  }
}