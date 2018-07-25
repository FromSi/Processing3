public class Moon{
  float size;
  float radius;
  float pX;
  float pY;
  float angle;
  
  public Moon(float size, float radius){
    this.size = size;
    this.radius = radius;
  }
 
  public void draw(float centerX, float centerY){
    pX = centerX + cos(radians(angle)) * radius;
    pY = centerY + sin(radians(angle)) * radius;
    
    angle += 5;
    
    ellipse(pX, pY, size, size);
  }
}
