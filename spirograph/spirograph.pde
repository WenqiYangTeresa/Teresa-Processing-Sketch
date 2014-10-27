// SPIROGRAPH
// http://en.wikipedia.org/wiki/Spirograph
// also (for inspiration):
// http://ensign.editme.com/t43dances
//
// this processing sketch uses simple OpenGL transformations to create a
// Spirograph-like effect with interlocking circles (called sines).  
// press the spacebar to switch between tracing and
// showing the underlying geometry.
//
// your tasks:
// (1) tweak the code to change the simulation so that it draws something you like.
// hint: you can change the underlying system, the way it gets traced when you hit the space bar,
// or both.  try to change *both*.  :)
// (2) use minim to make the simulation MAKE SOUND.  the full minim docs are here:
// http://code.compartmental.net/minim/
// hint: the website for the docs has three sections (core, ugens, analysis)... look at all three
// another hint: minim isn't super efficient with a large number of things playing at once.
// see if there's a simple way to get an effective sound, or limit the number of shapes
// you're working with.

int NUMSINES = 12; // how many of these things can we do at once?
float[] sines = new float[NUMSINES]; // lenght of array sines is 20; an array to hold all the current angles
float rad; // an initial radius for the central sine circle
int i; // a counter variable

// play with these to get a sense of what's going on:
float fund = 0.01;  // the speed of the central sine
float ratio = 1.;  // what multiplier for speed is each additional sine?
int alpha = 60;   // how opaque is the tracing system

boolean trace = false;   // are we tracing?

void setup()
{
  size(800, 600, P3D); // OpenGL mode

  rad = height/4.;   // compute radius for central circle
  background(255);  // clear the screen

  for (int i = 0; i<sines.length; i++)
  {
    sines[i] = PI; // start EVERYBODY facing NORTH 0~19th circles
  }
}

void draw()
{

  if (!trace) background(255,random(200,220),random(200,220)); // clear screen if showing geometry
  if (!trace) {
    stroke(20,10,50,255); // black pen
    noFill(); // don't fill
  }  

  
  // MAIN ACTION
  pushMatrix(); // start a transformation matrix
  translate(mouseX, height/2); // move the coordinate origin to middle of screen

  for (i = 0; i<sines.length; i++) // go through all the sines; length is 20
  {
    float erad = 0; // radius for small "point" that traces the circle... this is the 'pen' when tracing; the dust
    // setup tracing (the spirograph)
    if (trace) {
      stroke(0, 0, 255*(float(i)/sines.length), alpha); // blue
      fill(200, 0, 210, alpha/2); // also, um, blue
      erad = 2.0*(1.0-sines.length/(float(i)*7)); 
      // pen width will be related to which sine: 
      //19th circle has 0.25erad; 2nd circle has 4.5 erad; the circles closer to center have bigger pen.
    }
    
    float radius = rad/(i+1); // radius for big circle itself; rad is the radius of the biggest circle;( (height/4)/(i+1) )= the bigger the i the smaller the radius.
    rotateZ(sines[i]); // rotate all 0~19th circles around Z axis! Z axis pierces through the center of [0] circle!; ANIMATE IT!
    
    if (!trace) ellipse(0, 0, radius*2, radius*2); // if we're simulating, draw the sine [20 circles]
    
    pushMatrix(); // go up one level
    translate(0, radius*2); 
    rectMode(CENTER);// move to sine edge
    if (trace) rect(0, 0, erad/2, erad*4); // draw with erad if tracing; the size and position of each dust
    popMatrix(); // go down one level
    
    pushMatrix(); // go up one level
    translate(0, radius); 
    rectMode(CENTER);// move to sine edge
    if (!trace) rect(0,0,5,5); //ellipse(0, 0, 5, 5); // draw a little circle
    popMatrix(); // go down one level
    
    translate(0, radius); // move into position for next sine
    sines[i] = (sines[i]+(fund+(fund*i*ratio)))%TWO_PI; // update angle based on fundamental
  }
  popMatrix(); // pop down final transformation
}

void keyReleased()
{
  if (key==' ') {
    trace = !trace; 
    background(255,random(200,220),random(200,220));
  }
}

