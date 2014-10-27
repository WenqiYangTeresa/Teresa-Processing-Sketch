int NUMSINES = 12; // how many of these things can we do at once?
float[] sines = new float[NUMSINES]; // lenght of array sines is 20; an array to hold all the current angles
float rad; // an initial radius for the central sine circle
int i; // a counter variable

// play with these to get a sense of what's going on:
float fund = 0.04;  // the speed of the central sine
float ratio = 1.;  // what multiplier for speed is each additional sine?
int alpha = 60;   // how opaque is the tracing system

boolean trace = false;   // are we tracing?


import ddf.minim.*; // this loads the minim library
import ddf.minim.ugens.*; // this loads more stuff out of the minim library
 Minim minim; // this is the audio engine
 AudioOutput out; // this represents the output (speakers)
 Oscil wave;



void setup()
{
  size(800, 600, P3D); // OpenGL mode

  rad = height/4.;   // compute radius for central circle
  background(255);  // clear the screen

  for (int i = 0; i<sines.length; i++)
  {
    sines[i] = PI; // start EVERYBODY facing NORTH 0~11th circles
  }
 
 minim = new Minim(this); // start the audio engine
 out   = minim.getLineOut(); // sets the output to your laptop output
 wave = new Oscil( 440., 0.6, Waves.SINE ); // this sets up the oscillator
 wave.patch( out );
 
 
}

void draw()
{
  if (!trace)wave.setFrequency( map(mouseX, 0, width, 100, 1000) );
  if (!trace)wave.setAmplitude( map(mouseX, 0, width, 0., 1.) );
  if (trace)wave.setAmplitude(0.);
  
  if (!trace) background(255,random(200,220),random(200,220)); // clear screen if showing geometry
  if (!trace) {
    stroke(20,10,50,255); // black pen
    noFill(); // don't fill
  }  

  
  // MAIN ACTION
  pushMatrix(); // start a transformation matrix
  translate(mouseX, height/2); // move the coordinate origin to middle of screen
  rotate(radians(90));
  
  for (i = 0; i<sines.length; i++) // go through all the sines; length is 20
  {
    float erad = 0; // radius for small "point" that traces the circle... this is the 'pen' when tracing; the dust
    // setup tracing (the spirograph)
    if (trace) {
      erad = 2.0*(1-float(i)/sines.length); 
      // pen width will be related to which sine: 
      //19th circle has 0.25erad; 2nd circle has 4.5 erad; the circles closer to center have bigger pen.
       if (i< sines.length/3)
    {
      stroke(255, 0, 255*(float(i)/sines.length), alpha); // blue
      fill(120, 0, 20, alpha/2); // also, um, blue
    } else if (i> sines.length/3 && i< (sines.length*2)/3){
      stroke(205*(float(i)/sines.length), 15, 20, alpha/3); // blue
      fill(20, 40, 10, alpha/2); // also, um, blue
    } else {
      stroke(205*(float(i)/sines.length), 15, 255, (alpha*2)/3); // blue
      fill(50, 160, 255, alpha/2);
    }
      
    
    }
    
  
    float radius = rad/(i+1); // radius for big circle itself; rad is the radius of the biggest circle;( (height/4)/(i+1) )= the bigger the i the smaller the radius.
    rotateZ(sines[i]); // rotate all 0~19th circles around Z axis! Z axis pierces through the center of [0] circle!; ANIMATE IT!
    
    if (!trace) ellipse(0, 0, radius*2, radius*2); // if we're simulating, draw the sine [20 circles]
    
    pushMatrix(); // go up one level
    translate(0, radius); 
    rectMode(CENTER);// move to sine edge
    if (trace) rect(0, radius/2, erad*6, 1); // draw with erad if tracing; the size and position of each dust
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
    background(255,random(100,220),random(100,220));
  }
}


