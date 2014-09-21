//draw this
//x = 0.5 sin2(u) cos(2 v)
//y = 0.5 sin2(u) sin(2 v)

//z = sin(u) sin(v)

//0 <= u <= pi, 
//0 <= v <= 2 pi


import ddf.minim.*;

Minim minim;
AudioInput in;
float theamp;

int NUMPOINTS = 60;
float r = 0.;

PShape s;
PImage img;

void setup(){
  size (800,800,OPENGL);
  
  img = loadImage("gradient.jpg");
  textureMode(NORMAL);
  textureWrap(REPEAT);
  
  minim = new Minim (this);
  in = minim.getLineIn();
  
}

void draw()
{
  doaudiostuff();  //1
  
  background(0);
  lights();
  fill(255);
  noStroke();
  
  fillShape();  //2
  
  translate(mouseX, mouseY); //movement position
  rotate(r, -0.235, 0.3143, 0.451); //angle x y z
  scale(theamp*2.0+0.05);  //relate the size of the shape to volumn
  shape(s, 0, 0);  //s=creatShape x=0 y=0
  r= r+theamp;  //set the angle of rotation(r=0) relate to volumn
  
}

void fillShape(){
  
  s= createShape();
  s.beginShape();
  s.texture(img);
  
   for(int i = 0;i<NUMPOINTS;i++)
   {
      for(int j = 0;j<NUMPOINTS;j++)
     {
       float u = map(i, 0, NUMPOINTS, 0, PI);
       float v = map(j, 0, NUMPOINTS, 0, 2*PI);
       float x = 0.5*sq(sin(u))*cos(2.0*v);
       float y = 0.5*sq(sin(u))*sin(2.0*v);
       float z = sin(u)*sin(v);       

        // interpolate based on volume between plane and shape
        x = lerp(u, x, theamp*2.);
        y = lerp(v, y, theamp*2.);
        z = lerp(0, z, theamp*2.);
         s.vertex(x*width+width, y*width+width, z*width+width, float(i)/NUMPOINTS, float(j)/NUMPOINTS);
     } 
   }
   
     s.endShape(CLOSE);

}
  
  

  
  // make a smoothed value for "theamp"
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

  
