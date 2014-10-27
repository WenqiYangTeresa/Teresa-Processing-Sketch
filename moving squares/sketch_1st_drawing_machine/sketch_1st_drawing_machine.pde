//Hello, I am excited now...
//my first sketch: random rectangles following my mouse
 float r,g,b,w,h,c; //global variables
// hit play to run
void setup()
{
  size(600,400);  //size of canvas
  
  background(78,254,193); //BC color: indigo
  
  rectMode(CENTER); //rect starts from center
  
  
}

//run in every frame
void draw ()
{
  
  
  //set up range for variables
  r= random(0,255);
  g= random(0,255);
  b= random(0,255);
  c= random(0,400);
  w= random(5,100);
  h= random(5,100);
  
  fill(r,g,b,100); //red green blue alpha
  stroke(0,0,0,25); //r,g,b, alpha
  
 rect(mouseX,mouseY,w,h);//x=position on X-axis,y+position on Y-axis,w=width,h=height
}
  //erase everything when I press 'f'
  void keyPressed()
  {
    if(key=='f') background(78,254,193); //the key can be changed
  }

