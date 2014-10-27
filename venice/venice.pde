int w,h;
float s;
PImage rain;
int whichway = 0; //make it wipe horizontally make an alternative

void setup(){
  size(620,388);
  background(0);
  rain= loadImage("Venice.jpg");
  w =rain.width;
  h =rain.height;
  s = 0.5; //scale resize
  println("the image is:"+ w +"by"+h);
}

void draw(){
  fill(0,0,0,20);
  rect(0,0,width,height);
  if (whichway==0){
    //int
    //constrain the movement that the weird thing doesnt happen
    blend(rain,mouseX,0,mouseY,height,mouseX,0,mouseY,height,BLEND);
  //mousex 0 mousey height let the pic stable in bg and mouse moves the camera
  //blend!
  //vertical
  }
  else if (whichway==1){
    blend(rain,0,mouseY,width,mouseX,0,mouseY,width,mouseX,BLEND);
} //horizontal
}

void keyReleased(){
  whichway = 1-whichway;
} //cont. the alternative 1or 0
