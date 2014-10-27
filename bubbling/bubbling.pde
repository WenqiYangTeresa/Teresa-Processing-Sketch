//try a smooth movement with curve

 /*float w,h,r,g,b,y1,x1,y2,x2; //global variables*/
 
 color[] co = new color[7] ;
 color[0] =#FF0000;
 color[1] =#E86900;
 color[2] =#A50CE8;
 color[3] =#005CFF;
 color[4] =#00E8FF;
 color[5] =#00FF0E;
 color[6] =#FFD00D;
 
void setup()
{
  size(1000,800);  
  
  background(255);
  
  x1= width/2;
  y1= height/2;
  //let the doodle start from center. width and height of canvas
 //x1 and y1 are constant
 
}


//run in every frame
void draw ()
{

  // this fades out the previous stuff. add a "screen" on the top
  //noStroke();
  //fill(190, 254, 183, 0);
  //rect(0, 0, width, height); //this fades out the stroke of circles even it is completely transparent
  
  //distance the buggie is from the mouse
  float dx = (mouseX-x1)/10.; //the smaller the denominator the closer the buggie is
  float dy = (mouseY-y1)/10.;
  
  float drunkx = myDrunkenCurve(-20, 20, 30);
  float drunky = myDrunkenCurve(-20, 20, 30);
  
  
  // this "adds" the distance and some drunkness to the position(movement)
  x2 = x1+random(min(0, dx), max(0, dx))+drunkx;  //follow mouse horizontally
  y2 = y1+random(min(0, dy), max(0, dy))+drunky;  //follow mouse vertically
  
  float weight = sqrt((mouseX-pmouseX)*(mouseX-pmouseX)+(mouseY-pmouseY)*(mouseY-pmouseY));
  
  //set up range for movement (x1,x2,y1,y2)
  //x2= x1+random(-20,20);
  //y2= y1+random(-20,20);
  
  //draw a line
  //strokeWeight(max(5,weight/2));
  //noFill();
  //stroke(255,255,192,100);
  //line(x1,y1,x2,y2);
  
  //set up color range for variables
  /*r= random(100,180);
  g= random(30,255);
  b= random(130,240);
  */
  
  //make a trace
  //noFill(); //dont draw a fill
  //stroke(255,101,178,150); //set stroke to pink
  //line(x1,y1,x2,y2); //must put the object under its seting of fill and stroke
  //x1 and y1 are constant
  
  //float w= random(1,15);
  //float h= random(1,15);
  noStroke(); //i do this instead of doing the blocking screen
  fill(co[],g,b,weight); //color orange; alpha is depending on weight also
  ellipse(x2,y2,weight,weight); //make the none variables more random; has same movement as line (x2,y2)
  
  
  //stash new x and y for a new round. setting them equal we don't need to check the boundary twice
  x1=x2;
  y1=y2;
  
  //boundaries
  if (x1>width) x1=0;
  if (x1<0) x1=width;
  if (y1>height)  y1=0;
  if (y1<0) y1=height;
}
 
 
 
  //erase everything when I press 'f'
  void keyPressed()
  {
    if(key=='f') background(190,254,193); //the key can be changed
  }
 
 
 
 //this defines the drunkenCurve. dont understand this part
float myDrunkenCurve(float min, float max, int Q)
{
  
  float value = 0.;
  
  for(int i = 0; i < Q; i++) // i = i + 1
  {
    value+=random(min, max);
  }
 
  value = value / float(Q);
  
  return(value);
  
}

