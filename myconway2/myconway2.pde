//I merge your kernel convolution G sketch into this Conway.
//when you click on a random spot, pixels swipe over
//the canvas. Click again to change the pattern
//if you want to get rid of those pixels, move the mouse diagonally toward to 
//center. The canvas will be blanked with black.

PImage c[] = new PImage[2]; // input image
color[] p = new color[9];
float x_amp = 1.0;
float y_amp = 1.0;

float[] gx_kernel = {
 -4, 0, 4, -2, 0, 2, -1, 0, 1
 };
 float[] gy_kernel = {
 1, 2, 1, 0, 0, 0, -1, -2, -1
 };
 
int w, h; // width and height
int i, j; // counter variables


int which = 0; // which image are we working on

// 9 pixels for the neighborhood (p4 is center):
//  p0  p1  p2
//  p3 *p4* p5
//  p6  p7  p8


void setup()
{
  size(400, 400); // make the screen square
  noSmooth(); // turn off image and shape interpolation

  // create two blank images to work with for the game
  c[0] = createImage(50, 50, RGB);
  c[1] = createImage(50, 50, RGB);
  w = c[0].width; // width
  h = c[0].height; // height

    // fill our first image with random stuff:
  //fillRandom();
}

void draw()
{

  c[which].loadPixels(); // load up the pixels array for input
  x_amp = map(mouseX/2, 0, width, -4., 4.);
  y_amp = map(mouseY/2, 0, height, -4., 4.);
  // step 1 - add pixels where mouse is
  if (mousePressed)
  {
    int mx = constrain(int(mouseX/8.0), 0, width-1);
    int my = constrain(int(mouseY/8.0), 0, height-1);
    c[which].pixels[my*w + mx] = color(25, 25, 200);
  }
  

  
  // step 2 - get the values for the "neighborhood" around each pixel
  for (i=0; i<h; i++) // these pixels are the rows
  {
    for (j=0; j<w; j++) // thise pixels are the columns
    {

      // top row
      p[0] = c[which].pixels[((i-1+h)%h)*w + (j-1+w)%w]; // left pixel
      p[1] = c[which].pixels[((i-1+h)%h)*w + j]; // center pixel
      p[2] = c[which].pixels[((i-1+h)%h)*w + (j+1+w)%w]; // left pixel

      // center row
      p[3] = c[which].pixels[i*w + (j-1+w)%w]; // left pixel
      p[4] = c[which].pixels[i*w + j]; // center pixel
      p[5] = c[which].pixels[i*w + (j+1+w)%w]; // left pixel

      // bottom row
      p[6] = c[which].pixels[((i+1+h)%h)*w + (j-1+w)%w]; // left pixel
      p[7] = c[which].pixels[((i+1+h)%h)*w + j]; // center pixel
      p[8] = c[which].pixels[((i+1+h)%h)*w + (j+1+w)%w]; // left pixel

      
      
       float gx, gy;
      
      // RED
      gx = 0; // store some stuff
      gy = 0; // store some stuff
      for (int k = 0; k<p.length; k++)
      {
        gx+=red(p[k])*gx_kernel[k]*x_amp; 
        gy+=red(p[k])*gy_kernel[k]*y_amp;
      }
      float red = sqrt(gx*gx + gy*gy);

      // GREEN
      gx = 0; // store some stuff
      gy = 0; // store some stuff
      for (int k = 0; k<p.length; k++)
      {
        gx+=green(p[k])*gx_kernel[k]*x_amp; 
        gy+=green(p[k])*gy_kernel[k]*y_amp;
      }
      float green = sqrt(gx*gx + gy*gy);

      // BLUE
      gx = 0; // store some stuff
      gy = 0; // store some stuff
      for (int k = 0; k<p.length; k++)
      {
        gx+=blue(p[k])*gx_kernel[k]*x_amp; 
        gy+=blue(p[k])*gy_kernel[k]*y_amp;
      }
      float blue = sqrt(gx*gx + gy*gy);

    c[1-which].pixels[i*w + j] = color(red, green, blue);
      
    }
  }

  c[1-which].updatePixels(); // restore the pixels array

  image(c[1-which], 0, 0, width, height); // draw to screen

  which = 1-which; // swap image buffer
}
