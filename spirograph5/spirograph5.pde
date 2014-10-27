int NUMSINES = 12; // how many of these things can we do at once?
float[] sines = new float[NUMSINES]; // lenght of array sines is 20; an array to hold all the current angles
float rad; // an initial radius for the central sine circle
int i; // a counter variable

// play with these to get a sense of what's going on:
float fund = 0.14;  // I speed up the central sine
float ratio = 1.;  // what multiplier for speed is each additional sine?
int alpha = 60;   // how opaque is the tracing system

boolean trace = false;   // are we tracing?

import ddf.minim.*; 
import ddf.minim.ugens.*;
 Minim minim; 
 AudioOutput out; 
 Oscil wave;

void setup()
{
  size(800, 600, P3D); 

  rad = height/4.;   // compute radius for central circle
  background(0);  // clear the screen

  for (int i = 0; i<sines.length; i++)
  {
    sines[i] = PI; // start EVERYBODY facing NORTH 0~11th circles
  }
  
 minim = new Minim(this); // I put in the sound stuff 
 out   = minim.getLineOut(); 
 wave = new Oscil( 440., 0.6, Waves.SINE ); 
 wave.patch( out );
}

void draw()
{
  //only hear it in the geometry screen
  if (!trace)wave.setFrequency( map(mouseX, 0, width, 100, 1000) );
  if (!trace)wave.setAmplitude( map(mouseX, 0, width, 0., 1.) );
  if (trace)wave.setAmplitude(0.);
  
  if (!trace) background(45,random(5,12),random(20,40)); // randomize the BG color
  if (!trace) {
    stroke(220,110,250,255); // light purple pen
    noFill(); // don't fill
  }  

  
  // I relate the position to mouseX.horizontal movement
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
       
      //I change the colors 
       if (i< sines.length/2)
    {
          stroke(205*(float(i)/sines.length), 100, 255, alpha/2); // blue
      fill(255, 100, 220, alpha/2); // also, um, blue
     
    } else{
       stroke(255, 100, 255*(float(i)/sines.length), alpha); // blue
      fill(220, 100, 220, alpha/2); // also, um, blue
    }
      
    
    }
    
  
    float radius = rad/(i+1); // radius for big circle itself; rad is the radius of the biggest circle;( (height/4)/(i+1) )= the bigger the i the smaller the radius.
    rotateZ(sines[i]); // rotate all 0~19th circles around Z axis! Z axis pierces through the center of [0] circle!; ANIMATE IT!
    
    if (!trace) ellipse(0, 0, radius*2, radius*2); // if we're simulating, draw the sine [20 circles]
    
    pushMatrix();
    translate(0, radius); // move to sine edge 
    rectMode(CENTER); //I use rect instead of circle
    if (trace) rect(0,radius, erad*6, erad/6); // draw with erad if tracing; the size and position of each dust
    popMatrix(); // go down one level
    
    pushMatrix();
    translate(0, radius); 
    rectMode(CENTER);
    if (!trace) rect(0,0,5,5); // I draw a little square
    popMatrix(); 
    
    translate(0, radius); // move into position for next sine
    sines[i] = (sines[i]+(fund+(fund*i*ratio)))%TWO_PI; // update angle based on fundamental
  }
  popMatrix(); // pop down final transformation
}

void keyReleased()
{
  if (key==' ') {
    trace = !trace; 
    background(45,random(5,12),random(20,40));
  }
}

