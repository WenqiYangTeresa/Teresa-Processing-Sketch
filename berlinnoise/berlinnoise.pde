void setup(){

size(500,500);
noLoop();
}

void draw(){

float xnoise = 0.0;
float ynoise = 0.0;
float inc1 = 5.5;
float inc2 = 0.04;
for (int y = 0; y< height; y++){
  for (int x = 0; x< width; x++){
    float gray = noise(xnoise, ynoise)* 200;
    stroke(gray, random(10,205), random(100,250));
    point(x,y);
    xnoise = xnoise +inc1;
  }
  xnoise = 0;
  ynoise = ynoise + inc2;
}

}

void mousePressed(){
  saveFrame("noise1.jpeg");
}
