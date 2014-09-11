//my second sketch: learn to be drunk
 float w,h,r,g,b,y1,x1,y2,x2; //global variables
 
 
// hit play to run
void setup()
{
  size(600,400);  //size of canvas
  
  background(78,254,193); //BC color: indigo
  
  x1= width/2;
  y1= height/2;
  //let the doodle start from the center. width and height of canvas
  
}


//run in every frame
void draw ()
{
  
  //set up color range for variables
  r= 255;
  g= 101;
  b= 178;
  
  //set up range for movement (x1,x2,y1,y2)
  x2= x1+random(-20,20);
  y2= y1+random(-20,20);
  
  //make a trace
  noFill(); //dont draw a fill
  stroke(r,g,b,100); //set stroke to pink
  line(x1,y1,x2,y2); //must put the object under its seting of fill and stroke
  
  fill(13,147,255,100); //color of triangle:blue
  ellipse(x1,y1,6,6); // draw a circle
  
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
    if(key=='f') background(78,254,193); //the key can be changed
  }

