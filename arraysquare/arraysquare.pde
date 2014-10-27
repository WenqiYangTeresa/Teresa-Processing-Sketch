void setup(){
  size(500,500);
  background(0);
}

void draw(){
fill(random(200,255),random(mouseX,240),random(100,150));
noStroke();
smooth();
for(int y = 0; y<=500; y += 50){
  for(int x = 0; x<=500; x += 50){
    rect(x, y, 45, 45);
  }
}

}

void keyPressed() {
  saveFrame("PS2_06image.jpeg");
}
 


