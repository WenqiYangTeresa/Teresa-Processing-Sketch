
float r=0.;
int [] raxis= {1,0,0};

void setup()
{
  size(600,600,OPENGL);
  sphereDetail(40); //roundness of the sphere; number of grids.
  raxis[0]=1;
  raxis[1]=0;
  raxis[2]=0;
}

void draw()
{ 
  lights(); //cast light on the ball
  background(100,200,300);
  translate(300, 300);  //position following mouse
  rotate(r,raxis[0],raxis[1],raxis[2]);  //we put array for x y z because it makes it flexible for the way the ball rolls.
  //(angle of rotation in gradiant,x,y,z) the way of rolling
  scale(0.5); //make the object 50% of the original size
  sphere(100);
  r=r+0.1; //increment r 0.1 at each step
}

void keyPressed() //local setting dominated by keys changes original seting of raxis[]
{
  if(key=='x'){
    raxis[0]=1;
    raxis[1]=0;
    raxis[2]=0;
     }
   if(key=='y') {
     raxis[0] = 0; 
     raxis[1] = 1; 
     raxis[2] = 0; 
   }
   if(key=='z') {
     raxis[0] = 0; 
     raxis[1] = 0; 
     raxis[2] = 1; 
   }
   
}

//r: the axis move toward me
//x: the axis horizontal
//y:the axis vertical
