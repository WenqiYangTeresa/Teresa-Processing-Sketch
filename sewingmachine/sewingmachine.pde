int s = 255;
float sw = 1.0;
void setup(){
  size(500,500);
  background(#322030);
  frameRate(18);
}

void draw(){
  //background(#322030);
  for (int i = 5; i < 500; i += 5) {
  s = (i < 250) ? int(random(#bb0000,#FCFDEB)) : int(random(#322030,#FCFDEB));
  stroke(s);
  sw = (150<i) ? 1.0:1.23;
  strokeWeight(sw);
  line(0, i, width, i);
  
  if(i>300){ 
    if(i<350){
    s=int(random(#415ab9,#FCFDEB));
    stroke(s);
    strokeWeight(2);
    line(0, i, width, i);
    }
  }
    
  }
  
  //strokeWeight(2);
  //line(mouseX,0,mouseX,height);
  fill(int(random(#bb0000,#FCFDEB)));
  rectMode(CORNERS);
  rect(mouseX-2,0,mouseX+2,height);
}

void keyPressed(){
    background(#322030);  
  }
 
void mousePressed(){
  saveFrame("sawingmachine2.jpeg");
}
