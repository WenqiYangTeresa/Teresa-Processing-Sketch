//my second sketch: learn to be drunk
//the buggie follows my mouse while leaves out a drunken trace behind
 float w,h,r,g,b,y1,x1,y2,x2; //global variables
 
 //DrunkCurve is adopted from Luke's sketch, B_yetmoredrawing
 
 
// hit play to run
void setup()
{
  size(800,600);  //size of canvas
  
  background(254,228,225); //BC color: indigo
  
  x1= width/2;
  y1= height/2;
  //let the doodle start from XXX location. width and height of canvas
  
}


//run in every frame
void draw ()
{

  // this fades out the previous stuff. add a "screen" on the top
  noStroke();
  fill(254, 228, 225, 0);
  rect(0, 0, width, height);
  
  //distance the buggie is from the mouse
  float dx = (mouseX-x1)/10.; //the smaller the denominator the closer the buggie is
  float dy = (mouseY-y1)/10.;
  
  float drunkx = myDrunkenCurve(-20, 20, 30);
  float drunky = myDrunkenCurve(-20, 20, 30);
  
  
  // this "adds" the distance and some drunkness to the position(movement)
  x2 = x1+random(min(0, dx), max(0, dx))+drunkx;  //follow mouse horizontally
  y2 = y1+random(min(0, dy), max(0, dy))+drunky;  //follow mouse vertically
  
  
  // this adds the distance and some drunkness to the position(movement)
  //x2 = x1+random(min(0, dx), max(0, dx))+drunkx;  //follow mouse horizontally
  //y2 = y1+random(min(0, dy), max(0, dy))+drunky;  //follow mouse vertically
  
  //set up range for movement (x1,x2,y1,y2)
  //x2= x1+random(-20,20);
  //y2= y1+random(-20,20);
  
  //set up color range for variables
  r= random(180,255);
  g= random(120,255);
  b= random(120,200);
  
  
  //make a trace
  noFill(); //dont draw a fill
  stroke(255,101,178,150); //set stroke to pink
  line(x1,y1,x2,y2); //must put the object under its seting of fill and stroke
  
  float w= random(10,15);
  float h= random(10,15);
  fill(r,g,b,70); //color orange
  ellipse(x2,y2,w,h); //make the none variables more random
  
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
    if(key=='f') background(254,228,225); //the key can be changed
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
