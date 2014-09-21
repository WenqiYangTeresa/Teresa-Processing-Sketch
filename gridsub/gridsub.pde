int n=20;
float r,g,b,al,x ,y,z,all,k,h,j,alll,q,w,t;
int i;
int c=25;
void setup()
{
  size(1000,800);
  background(240,230,200);
}


void draw()
{  
 
  
  for(i=0; i<n;i++)
  { stroke(132,140,100);
    strokeWeight(1);
    line(0, i*40, width,i*40);
    
   
  }
  
 for(i=0;i<c;i++)
 { line(i*40,0,i*40,height);
   r=random(150,255);
   g=random(63,100);
   b=random(46,70);
   al= random(50,150);
   fill(r,g,b,al);
   rect(i*40,200,40,40);
   
   r=random(150,255);
   g=random(63,100);
   b=random(46,70);
   al= random(50,150);
   fill(r,g,b,al);
   rect(i*40,700,40,20);
   
   r=random(150,255);
   g=random(63,100);
   b=random(46,70);
   al= random(1,5);
   fill(r,g,b,al);
   rect(i*40,300,40,10);
   
   x=random(132,242);
   y=random(140,232);
   z=random(100,211);
   all=random(30,130);
   fill(x,y,z,all);
   rect(i*40,120,40,10);
   
   x=random(132,242);
   y=random(140,232);
   z=random(100,211);
   all=random(30,130);
   fill(x,y,z,all);
   rect(i*40,400,40,30);
   
   x=random(132,242);
   y=random(140,232);
   z=random(100,211);
   all=random(30,130);
   fill(x,y,z,all);
   rect(i*40,50,40,31);
   
   k=random(0,100);
   h=random(32,100);
   j=random(50,232);
   alll=random(100,200);
   fill(k,h,j,alll);
   rect(i*40,30,40,10);
   
   k=random(0,100);
   h=random(32,100);
   j=random(50,232);
   alll=random(100,200);
   fill(k,h,j,alll);
   rect(i*40,160,40,20);
   
   q=random(125,160);
   w=random(100,224);
   t=random(100,255);
   alll=random(100,200);
   fill(q,w,t,alll);
   rect(i*40,500,40,20);
 }
 
   
}
    
