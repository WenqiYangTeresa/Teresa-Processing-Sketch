void setup(){
  size(900,600);
  background(255);
}

void draw(){
  frameRate(8);
  colorMode(HSB,360,100,100);
  for(int x =0; x<900;x+=30){
    //for(int i= 0; i<900; i+=30)
    for(int y=0; y<700; y+=30){
    //strokeWeight(20);
    fill(random(0,360),70,100);
    rect(x,y,20,20);
    //line(i,0,i,600);
    }
  }
}

void keyPressed(){
  saveFrame("Rainbow3.jpeg");
}
