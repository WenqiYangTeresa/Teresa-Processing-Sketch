
// geometric array


// GLOBAL variables
int NUMGNATS = 300; //the number of shapes
float[] x1 = new float[NUMGNATS]; //create an array of x1 that has 300 (NUMGNAT=300) different floating values
float[] y1 = new float[NUMGNATS]; 
float[] x2 = new float[NUMGNATS];
float[] y2 = new float[NUMGNATS]; 
float[] rad = new float[NUMGNATS]; //radius
float[] r = new float[NUMGNATS];
float[] g = new float[NUMGNATS]; 
float[] b = new float[NUMGNATS];


float p1x = 0;
float p1y = -10;
float p2x = -10;
float p2y = 10;
float p3x = 10;
float p3y = 10; //coordinate for triangle


// this runs when i hit play
void setup()
{
  frameRate(60); // how many frames a second do we aspire to? how fast the previous frame is gone

  size(800, 600); // sets up the size of the canvas

  background(155,20,70);

  for (int i=0; i<NUMGNATS; i++) //set a range for i
  {
    x1[i] = random(0, width-1);
    y1[i] = random(0, height-1);
    rad[i] = random(5, 30);
    r[i] = random(10, 255);  
    g[i] = random(10, 255);  
    b[i] = random(10, 255);  //input the variables' change within the range i
  }
}



// this runs every frame
void draw()
{
  // this fades out the previous stuff
  noStroke();
  fill(155, 20, 70, 100);
  rect(0, 0, width, height);


  float weight = sqrt((mouseX-pmouseX)*(mouseX-pmouseX)+(mouseY-pmouseY)*(mouseY-pmouseY));
  float aa = max(0.01, min(weight/50., 1.0));  //0.01<aa<1
  float bb = 1.0-aa; //biggest possible aa is 1.0 and smallest possible is 0.01, which means 0.99=>bb>=0
   //aa and bb: the movement of mouse affects the collective movement of objects
  
  // THIS IS THE MAIN LOOP
  for (int i = 0; i<NUMGNATS; i++)
  {
    // this is how far away the thingie is from the mouse
    float dx = (mouseX-x1[i])/20.; //x1 and y1 have 0-300 variations of positions (which 300 objects)
    float dy = (mouseY-y1[i])/20.; //set dy to the distances for 300 objects
    float drunkx = myDrunkenCurve(-50, 50, 3);
    float drunky = myDrunkenCurve(-50, 50, 3);
    
    // this adds the distance and some drunkness to the position
    float shiftx = x1[i]+random(min(0, dx), max(0, dx))+drunkx;
    float shifty = y1[i]+random(min(0, dy), max(0, dy))+drunky;
    x2[i] = aa*shiftx + bb*x1[i];
    y2[i] = aa*shifty + bb*y1[i];
    //one more step for x2 and y2

    // draw the line no big deal with line in this case since we cant really see it
    noFill(); // don't draw a fill
    
    line(x1[i], y1[i], x2[i], y2[i]); // x1, y1, x2, y2

    // draw the circle and triangle
    fill(r[i], g[i], b[i], 200); // set the fill to yellow
    stroke(255, 255, 192, 100); 
    triangle(x2[i]+p1x, y2[i]+p1y, x2[i]+p2x, y2[i]+p2y, x2[i]+p3x, y2[i]+p3y); // draw a circle
    fill(r[i]*2, g[i]*2, b[i]*2, 100); // bigger rgb pasteler the color is
    ellipse(x2[i], y2[i], rad[i], rad[i]);  
    fill(r[i]/2,g[i]/2,b[i]/2,30); //smaller rgb darker the color is
    rect(x2[i]-15,y2[i]-15,20,20); 


    // cycle and boundary; stash our new x and y for the next round
    x1[i] = x2[i];
    y1[i] = y2[i];
    // checking the boundaries
    if (x1[i]>width) x1[i] = 0;
    if (x1[i]<0) x1[i] = width;
    if (y1[i]>height) y1[i] = 0;
    if (y1[i]<0) y1[i] = height;
  }
}




// this runs when i pick up a key on the keyboard
void keyReleased()
{
  if (key==' ') background(155,20,70);
}



//enable the DrunkenCurve
float myDrunkenCurve(float min, float max, int Q)
{

  float value = 0.;

  for (int i = 0; i < Q; i++) // i = i + 1
  {
    value+=random(min, max);
  }

  value = value / float(Q);

  return(value);
}

