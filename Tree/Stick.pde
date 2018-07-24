public class Stick{
 private float[] start;
 private float radius;
 
 private float pXOne;
 private float pYOne;
 private float pXTwo;
 private float pYTwo;
 
 private boolean oneStick;
 
  
 public Stick(float[] start,float radius, int recursion, boolean oneStick){
   this.start = start;
   this.radius = radius;
   this.oneStick = oneStick;
   draw(recursion);
 }
 
 void draw(int recursion){
  recursion--;

   if(oneStick){
     float pX;
     float pY;
     
     recursion--;
     
     pushMatrix();
     translate(start[0],start[1]);
     pX = 0 + cos(radians(-90))*radius;
     pY = 0 + sin(radians(-90))*radius;
     line(0,0,pX,pY);
     popMatrix();
     
     pushMatrix();
     translate(pX+start[0],pY+start[1]);
     drawLineOne();
     drawLineTwo();
     line(0,0,pXOne,pYOne);
     line(0,0,pXTwo,pYTwo);    
     popMatrix();
     
     if (recursion != -1){
       new Stick(
                 new float[] {pX + pXOne + start[0], pY+pYOne + start[1]}, 
                 radius * 0.7, 
                 recursion,
                 false
                 );
                 
       new Stick(
                 new float[] {pX + pXTwo + start[0], pY+pYTwo + start[1]}, 
                 radius * 0.7, 
                 recursion,
                 false
                );
     }
   } else {
     pushMatrix();
     translate(start[0],start[1]);
     drawLineOne();
     drawLineTwo();
     line(0,0,pXOne,pYOne);
     line(0,0,pXTwo,pYTwo);    
     popMatrix();
     
     if (recursion != -1){
       new Stick(new float[] {pXOne + start[0], pYOne + start[1]}, radius*0.7, recursion, false);
       new Stick(new float[] {pXTwo + start[0], pYTwo + start[1]}, radius*0.7, recursion, false);
     }
   } 
 }
 
 private void drawLineOne(){
   pXOne = 0 + cos(radians(-135)) * radius;
   pYOne = 0 + sin(radians(-135)) * radius;
 }
 
 private void drawLineTwo(){
   pXTwo = 0 + cos(radians(-45)) * radius;
   pYTwo = 0 + sin(radians(-45)) * radius;
 }
}
