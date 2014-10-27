
import ddf.minim.*;

Minim minim;
AudioInput in;  //connect the sketch to volumn input
float theamp;  //volumn

int NUMPOINTS = 60;  //resolution of she shape, higher slower
float r = 0.; //angle of rotation




void setup(){
  size (800,600,OPENGL);
  


  
  minim = new Minim (this);
  in = minim.getLineIn();
  
}

void draw()
{
  doaudiostuff();
  
  background(23,0,61);
  lights();
  fill(255);
  noStroke();
  
  fill(255,107,151);
  pushMatrix();
  translate(mouseX, mouseY, -30);   //leftright updown backfront
  rotate(r, -0.235, 0.3143, 0.451);  //angle x y z
  scale(theamp*2.0+0.05);    //size
  box(400,100,400);
  fill(165,187,255);
  pushMatrix();
  popMatrix();
  translate(0,-200,0);
  scale(theamp*2.0+0.05);
  sphere(250);  //sphere(radius)
  pushMatrix();
  popMatrix();
  translate(0,1000,0);
  scale(theamp*2.0+0.05);
  sphere(250);
  popMatrix();
  r= r+theamp;
}
 
 





void doaudiostuff()
{
  float rawamp = 0.;

  for (int i = 0; i < in.bufferSize () - 1; i++)
  {
    rawamp = rawamp + abs(in.left.get(i)); // add the abs value of the current sample to the amp
  }
  rawamp = rawamp / in.bufferSize();

  theamp = mysmooth(rawamp, theamp, 0.25);

}

// y(n) = a*y(n-1) + (1.0-a)*x(n)
float mysmooth(float x, float y, float a)
{
  return(a*y + (1.0-a)*x);
}
  
