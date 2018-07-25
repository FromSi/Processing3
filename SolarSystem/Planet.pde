public class Planet{
  private float size;
  private float pX;
  private float pY;
  private float radius;
  private float center;
  private float angle = 0;
  private float speed;
  private float infoX;
  private float infoY;
  
  
  public Planet(float size, float radius, float center, float speed){
    this.size = size;
    this.radius = radius;
    this.center = center;
    this.speed = speed;
    
    calc();
    infoX = pX;
    infoY = pY;
  }
  
  public void draw(){
    pushMatrix();
    
    calc();
    
    ellipseMode(CENTER);
    ellipse(pX, pY, size, size);
    
    popMatrix();
  }
  
  public float getX(){
    return pX;
  }
  
  public float getY(){
    return pY;
  }
  
  public float getInfoX(){
    return infoX;
  }
  
  public float getInfoY(){
    return infoY;
  }
  
  private void calc(){
    pX = center + cos(radians(angle)) * radius;
    pY = center + sin(radians(angle)) * radius;
    angle = angle >= 360 ? 0 : angle + speed;
  }
}
