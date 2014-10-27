 // w,h size of image in pixel


void setup(){
  size(300,300);
  background(20,30,50);
}

void draw(){
  background(20,30,50);
  
  int r = int(random(120,255));
  int g = int(random(200,210));
  int b = int(random(120,160));
  
  PImage img = createImage(160,160,ARGB);
  PImage img2= createImage(160,160,ARGB);
  PImage img3= createImage(160,160,ARGB);
  img2.loadPixels();
  for (int i = 0; i< img2.pixels.length; i++){
   img2.pixels[i] = color(r, g, b, i% img2.width*2);
   }
  img2.updatePixels();

  image(img2, 0, 0);
  
 
  img.loadPixels(); // work on the image's pixels
  for (int i = 0; i < img.pixels.length; i++) { //i is set to be the unit of pixel's length inc 1
  img.pixels[i] = color(random(100,110), random(110,120), random(150,200), i % img.height * 2); 
  //take all the pixels [i] in the image and assign each of them color
  }
  img.updatePixels();
  //to work on pixels we must loadPixels and updatePixels 

  image(img, 130, 130); //img xcoordinate ycoordinate
  
  
  img3.loadPixels();
    for(int i = 0; i< img3.pixels.length; i++ ){
      img3.pixels [i] = color(random(200,250), random(100,105), random(100,110), i% img3.height*2);
    }
    img3.updatePixels();
    image(img3, 70, 70);
}
//img xcoordinate ycoordinate
//image(img, 34, 34); //draw two img in different location
//image(img2, 0, 0);

//pixel lenght:
// 0  1  2  3
// 4  5  6  7
// 8  9  10 11  (size : 3*4=12)
  
