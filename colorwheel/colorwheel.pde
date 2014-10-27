void setup() {
  size(800,200);
  background(255);
  smooth();
}
void draw() {
 if (mousePressed) {
    /*brush(mouseX, mouseY);
      
  }
}
void brush(int x, int y) { */

stroke(mouseX, mouseY, 40, 110);

arc(mouseX, mouseY,50, 50, 0, PI/2);
noFill();
arc(mouseX, mouseY, 60, 60, PI/2, PI);
arc(mouseX, mouseY, 70, 70, PI, TWO_PI-PI/2);
arc(mouseX, mouseY, 80, 80, TWO_PI-PI/2, TWO_PI);}
}
void keyPressed() {
  saveFrame("PS2_03image.jpeg");
}

