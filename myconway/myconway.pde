//I merge one of your kernel convolution sketch into this Conway.
//when you click on either of the four conners, pixels swipe over
//the canvas toward the center
//if you want to get rid of those pixels, move the mouse diagonally toward to 
//center. The canvas will be blanked with black.

PImage c[] = new PImage[2]; // input image

color[] p = new color[9];
float amp = 1.0;
float[] gx_kernel = {
 -1, 0, 1, -2, 0, 2, -1, 0, 1
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

  // step 1 - add pixels where mouse is
  if (mousePressed)
  {
    int mx = constrain(int(mouseX/8.0), 0, width-1);
    int my = constrain(int(mouseY/8.0), 0, height-1);
    c[which].pixels[my*w + mx] = color(255, 255, 255);
  }
  
  amp = map(mouseX, 0, width, -4., 4.);
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

      // compute the sum: use the green channel for simplicity
      float gx = 0; // store some stuff
      float gy = 0; // store some stuff
      for (int k = 0; k<p.length; k++)
      {
        gx+=green(p[k])*gx_kernel[k]*amp; 
        gy+=green(p[k])*gy_kernel[k]*amp;
      }
      float output = sqrt(gx*gx + gy*gy);

    c[1-which].pixels[i*w + j] = color(output, output, output);
      
    }
  }

  c[1-which].updatePixels(); // restore the pixels array

  image(c[1-which], 0, 0, width, height); // draw to screen

  which = 1-which; // swap image buffer
}

/*void keyPressed()
{
 // fillRandom(); // add random noise to image when you press any key
}

/*void fillRandom()
{
  // fill our current image with random stuff
  c[which].loadPixels();
  for (i=0; i<c[which].pixels.length; i++)
  {
    float rand = random(1000);
    if (rand>900) // 10% alive
    {
      c[which].pixels[i] = color(255, 255, 255);
    }
  }
  c[which].updatePixels();
}
*/
