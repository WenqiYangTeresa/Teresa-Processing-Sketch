PImage c[] = new PImage[2]; // input image

int w, h; // width and height

int i, j; // counter variables

int center; // is the pixel alive or dead?
int sum; // how many neighbors are alive?

int which = 0; // which image are we working on

// 9 pixels for the neighborhood (p4 is center):
//  p0  p1  p2
//  p3 *p4* p5
//  p6  p7  p8
color p0, p1, p2, p3, p4, p5, p6, p7, p8; 

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
  fillRandom();
}

void draw()
{
  c[which].loadPixels(); // load up the pixels array for input

  // step 1 - add pixels where mouse is
  if (mousePressed)
  {
    int mx = constrain(int(mouseX/8.0), 0, width-1);
    int my = constrain(int(mouseY/8.0), 0, height-1);
    c[which].pixels[my*w + mx] = color(50, 50, 255);
  }

  // step 2 - get the values for the "neighborhood" around each pixel
  for (i=0; i<h; i++) // these pixels are the rows
  {
    for (j=0; j<w; j++) // thise pixels are the columns
    {

      // top row
      p0 = c[which].pixels[((i-1+h)%h)*w + (j-1+w)%w]; // left pixel
      p1 = c[which].pixels[((i-1+h)%h)*w + j]; // center pixel
      p2 = c[which].pixels[((i-1+h)%h)*w + (j+1+w)%w]; // left pixel

      // center row
      p3 = c[which].pixels[i*w + (j-1+w)%w]; // left pixel
      p4 = c[which].pixels[i*w + j]; // center pixel
      p5 = c[which].pixels[i*w + (j+1+w)%w]; // left pixel

      // bottom row
      p6 = c[which].pixels[((i+1+h)%h)*w + (j-1+w)%w]; // left pixel
      p7 = c[which].pixels[((i+1+h)%h)*w + j]; // center pixel
      p8 = c[which].pixels[((i+1+h)%h)*w + (j+1+w)%w]; // left pixel

      // compute the sum: use the green channel for simplicity
      //to extract the green value out from the rgb
      sum = 0; // start blank
      sum+= int(green(p0)>28.) + int(green(p1)>28.) + int(green(p2)>28.); // top neighbors
      sum+= int(green(p3)>28.) + int(green(p5)>28.); // left and right neighbors
      sum+= int(green(p6)>28.) + int(green(p7)>28.) + int(green(p8)>28.); // bottom neighbors

      center = int(green(p4)>28.); // is the center pixel alive?

      //
      // RULES: PLAY WITH THESE
      //
      if (center==1 && (sum==2 || sum==3)) // alive... stay alive
      {
        c[1-which].pixels[i*w + j] = color(245, random(90,190), random(90,155));
      } else if (center==0 && sum==3) // dead... become alive
      {
        c[1-which].pixels[i*w + j] = color(125, random(150,200), 205); //green of alive>28 to show
      } else // die (or stay dead)
      {   
        c[1-which].pixels[i*w + j] = color(60, 0, random(40,150)); //the green of dead<28 to hide
      }
    }
  }

  c[1-which].updatePixels(); // restore the pixels array

  image(c[1-which], 0, 0, width, height); // draw to screen

  which = 1-which; // swap image buffer, swap c[0] and c[1]
}

void keyPressed()
{
  fillRandom(); // add random noise to image when you press any key
}

void fillRandom()
{
  // fill our current image with random stuff
  c[which].loadPixels();
  for (i=0; i<c[which].pixels.length; i++)
  {
    float rand = random(1000);
    if (rand>900) // 10% alive
    {
      c[which].pixels[i] = color(50, 50, 255);
    }
  }
  c[which].updatePixels();
}

