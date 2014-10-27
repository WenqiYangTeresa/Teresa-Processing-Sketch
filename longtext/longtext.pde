import ddf.minim.*; 
import ddf.minim.ugens.*; 
Minim minim; 
AudioOutput out; 
Oscil wave1, wave2;

int[] scale = {60, 63, 65, 62, 48, 67, 68, 63, 60, 58, 70, 72, 67, 62, 63, 60};
int whichnote = 0;

float ny = 0; // perlin noise
int whichline = 0; // which line are we showing
int whichframe = 0;

PFont f1; 

String[] loststarlines;

void setup()
{
 size(800,400);
 smooth();
 //text stuff
 f1 = loadFont("FranklinGothic-Book-255.vlw");
 textFont(f1);
 textAlign(LEFT);
 
  loststarlines = loadStrings("lost start.txt");
  println(loststarlines.length); //how many lines of the text:57
  
 //sound stuff
  minim = new Minim(this); 
  out   = minim.getLineOut(); 
  
  wave1 = new Oscil( 550., 0.4, Waves.SINE ); 
  wave2 = new Oscil( 550., 0.4, Waves.SINE ); 
  wave1.patch( out ); 
  wave2.patch( out ); 
}


void draw()
{ frameRate(20);
  background(220,random(70,130),random(100,150));
  fill(random(50,100),random(50,240),random(140,240));
  stroke(255);
  
  //sound
  int pitch1 = scale[whichnote];
  int pitch2 = scale[int(random(scale.length))];
  wave1.setFrequency(mtof(pitch1));
  wave2.setFrequency(mtof(pitch2)*2.);
  
  whichnote = (whichnote+1) % scale.length; 
 
 //text
  float y = height/2;
  float nx = 55.5;


  textFont(f1);

  float[] charsize = new float[loststarlines[whichline].length()];

  float x = 0;
  for (int i = 0; i<loststarlines[whichline].length (); i++)
  {
    float n = map(noise(nx, ny), 0.0, 1.0, 9., 48.);
    textSize(n);
    charsize[i] = n;
    // text(alicelines[whichline].charAt(i), x, y);
    x+= textWidth(loststarlines[whichline].charAt(i));
    nx+= 1;
  }
  float thescale = width/x;
  x = 0;
  for (int i = 0; i<loststarlines[whichline].length (); i++)
  {
    textSize(charsize[i]*thescale);
    text(loststarlines[whichline].charAt(i), x, y);
    x+= textWidth(loststarlines[whichline].charAt(i));
  }



  whichframe++;
  if (whichframe > 60)
  {
    whichline = picknewline();

    while (loststarlines[whichline].length ()<1)
    {
      whichline = picknewline();
    }

    whichframe = 0;
  }
}

int picknewline()
{
  return(int(random(0, loststarlines.length)));
}



//sound
float mtof(int note) 
{
  return (550. * exp(0.037762265 * (note - 50.)));
 }

