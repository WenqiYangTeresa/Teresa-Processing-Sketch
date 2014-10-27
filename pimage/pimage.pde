int w,h;
float s;
PImage rain, venice;

void setup(){
  size(620,388);
  background(255);
  rain= loadImage("Marisa_Halloween_Witch.png");
  venice= loadImage("Venice.jpg");
  w =rain.width;
  h =rain.height;
  s = 0.5; //scale resize
  println("the image is:"+ w +"by"+h);
}

void draw(){
  background(venice);
  blend(rain,0,0,w,h,mouseX,mouseY,int(w*s),int(h*s),HARD_LIGHT);
  //00wh is the coordinators of the rain pic
  //transfer the original size to my desirred size and blend!
  //image(rain,mouseX,mouseY,w*s,s*h); //last two parameters:size
}
