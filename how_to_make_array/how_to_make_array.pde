int n=10;
int i;
float [] x1= new float [n];
float [] x2=new float [n];
//String 5G= "5 Ghost";
 float r,g,b;
void setup()
{  
 
   size (400,300);
   background(240,230,200);
   smooth();
}

void draw()
{
   frameRate(1);
  for(i=0; i<n ;i++)
   {
     x1[i]= random(50,350);
     x2[i]= random(50,350);
     r=random(0,100);
      g=random(0,50); 
      b=random(0,120);
     stroke(r,g,b,30);
     strokeWeight(2);
     line(x1[i], 50, x2[i],200);
   }
   
}

void keyPressed()
{  if(key==' '){
   fill(60,30,110,100);
   text("5G", width/2,250);}
   
}

