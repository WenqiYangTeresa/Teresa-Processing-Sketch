//change size (mouse) and change font(press key)

PFont thefont, f1;//data structure for a font

/*go to tools >create font >select your font 
  >click OK and it will appear in data file
*/

void setup()
{
  
  size(700,700);
  smooth();
  thefont = loadFont ("HelveticaNeue-48.vlw"); 
  f1 =loadFont ("HelveticaNeue-CondensedBold-48.vlw"); //add the seconf font call f1
  //assign the font in data with the name "thefont"
  textFont(thefont); 
  //textFont is the font to use; the font to use is "thefont"
  textAlign(CENTER,TOP); 
  //position the text:textAlign(alignX, alignY)
  //textSize(48); since we want to change the size, we put it in draw
}

void draw()
{
  background(255);
  fill(70,10,150);
  stroke(70,10,150);
  // it is necessary to have stroke hee otherwise it would not show up
  textSize(float(mouseY)/height*50.0);
  //calculation goes in order
  //mouseX must go with width, mouseY must go with height
  //relate the size of words to mouse's position
  
  text("I take the subway",350,312); 
  //x and y coordinate of the (upper left starting point)text 
  
}


//add multiple fonts by pressing keys
void mousePressed()
{ 
  textFont(f1);
  
}

void mouseReleased()
{
  textFont(thefont);
}
