import ddf.minim.*; // this loads the minim library
import ddf.minim.ugens.*; // this loads more stuff out of the minim library

Minim minim; // this is the audio engine
AudioOutput out; // this represents the output (speakers)
Oscil wave1, wave2; // this is an oscillator

int[] scale = {70, 73, 75, 82, 58, 77, 78, 73, 70, 68, 80, 82, 77, 72, 73, 70};
int whichnote = 0;


void setup()
{
 size(400,400);
 smooth();
  
  // initialize the minim and out objects
  minim = new Minim(this); // start the audio engine
  out   = minim.getLineOut(); // sets the output to your laptop output

  wave1 = new Oscil( 440., 0.3, Waves.SINE ); // this sets up the oscillator
  wave2 = new Oscil( 440., 0.3, Waves.SINE ); // this sets up the oscillator
  wave1.patch( out ); // this plugs into the speakers
  wave2.patch( out ); // this plugs into the speakers
  //two waves two speakers
}

// draw is run many times
void draw()
{
  frameRate(4);
  background(200,100,100); //erase the previous face
  smilyFace();
  
  
  int pitch1 = scale[whichnote];
  int pitch2 = scale[int(random(scale.length))];
  wave1.setFrequency(mtof(pitch1));
  wave2.setFrequency(mtof(pitch2)*2.);
  //wave.setAmplitude
  //we dont control the amplitude anymore- volumn stays the same
  
  whichnote = (whichnote+1) % scale.length; 
  /* length is numbers of notes in the array:15 (0-15)
  the first whichnote is 0 [index]=70
  with this function, whichnote increases one index ec=ach frame*/
}



float mtof(int note) // customize function mtof
{
  return (440. * exp(0.057762265 * (note - 69.)));
  //return value
 
}

