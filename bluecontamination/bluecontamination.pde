int r = int(random(41,70));
int g = int(random(10,40));
int b = int(random(124,200));

void setup(){
  size(1200,500);
  background(#F2546F);
}

void draw(){
  fill(r,g,b,random(100,150));
  ellipse(mouseX,mouseY,20,20);
  
}
