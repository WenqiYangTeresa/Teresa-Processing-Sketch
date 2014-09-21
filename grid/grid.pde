
float r,g,b,al,x,y,z,all,k,h,j,alll;
int c;

void setup()
{size(1000,800);
 background(255);
 smooth();
}




void draw() {
 
  for (int i = 0; i < 25; i = i + 1) 
  { // so here we draw from y = 0 to y = height
    stroke(100,0,0);
    strokeWeight(1.);
    line(i * 40, 0, i * 40, 240);   // incrementing along the x axis every 50
   // println("i is equal to:  " + i);   // pixels
   

   r=random(150,255);
   g=random(63,100);
   b=random(46,70);
   al= random(50,150);
   fill(r,g,b,al);
   rect(i*40,200,40,40);
   
   
   x=random(132,242);
   y=random(140,232);
   z=random(100,211);
   all=random(30,130);
   fill(x,y,z,all);
   rect(i*40,120,40,20);
   
   
   k=random(125,160);
   h=random(170,224);
   j=random(200,255);
   alll=random(100,200);
   fill(k,h,j,alll);
   rect(i*40,40,40,10);
  
   fill(k,h,j,all);
   rect(i*40,400,40,30);
  }
 
  for (int i =0 ; i < 25; i = i + 1) { // and here we draw from (wi
    stroke(200,244,240);
    strokeWeight(1.5);
    line(0, i * 40, width, i * 40);
 
    println("i is equal to:  " + i);
  }
   
  //notice we can use the iterator variable 'i' over again, as it is declared in
  //the forLoop, it is only local to the specific forLoop it is created in
   

}

void keyPressed()
{ if(key==' ')
  stroke(0,0,60);
  strokeWeight(1.2);
 line(mouseX,mouseY,width,mouseY);}


  
 



