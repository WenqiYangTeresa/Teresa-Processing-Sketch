void setup(){
  size(500,500);
}

void draw(){
background(100,120,240);
fill(random(220,255),random(100,240),random(150,200),300);
noStroke();
smooth();
for(int y = 0; y<=500; y += 50){
  for(int x = 0; x<=500; x += 50){
    ellipse(x+y/50.0, y+x/50.0, 15+x/12, 40);
  }
}

}


