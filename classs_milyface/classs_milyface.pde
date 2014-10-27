//play class

//Import library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim soundCode; //Minim is a kind of vriable, decalare it soundCode
AudioPlayer lostStar; //the output of song


void setup(){
 size(400,400);
 smooth();
 frameRate(2);
 
 //sound
 soundCode = new Minim(this);
 lostStar = soundCode.loadFile("jack.wav"); // variable soundCode is loaded with file
 lostStar.play(); //.order the sound to play
  
}


void draw(){
  background(200,100,100);
  smilyFace();
}

void stop(){
  lostStar.close();
  soundCode.stop();
  super.stop();
}

