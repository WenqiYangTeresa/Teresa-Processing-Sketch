import data;
int rectsize=20;
//var playing=false;


function preload()
{ 
  mysound = loadSound ("lo.mp3");
}


function setup() {
  createCanvas(800,800);
  background(220,60,60);// put setup code here
}

function draw() 
{
  stroke(255, 0, 0);
  fill(0, 0, 255, 50);
  rect(mouseX, mouseY, rectsize, rectsize);
  rectsize = rectsize + 5;
 
  if(rectsize > 20) rectsize=0;

}
