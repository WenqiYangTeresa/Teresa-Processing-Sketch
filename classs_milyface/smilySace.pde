//smilyFace Function

void smilyFace(){
 noStroke();
 float px = random(width);
 float py = random(height);
 float size = random(10,150);
 
 fill(#f6b119);
 ellipse( random(px*1.2, px*1.6), py, size/2, size/2);

 
 fill(random(10,20), random(30,200), random(140,170));
 arc(px, py, size, size, PI*0.25, PI* 1.75);
 
 
}
