public class Sun{
  private float size;
  private float center;
  
  
  public Sun(float size, float center){
    this.size = size;
    this.center = center;
  }
  
  void draw(){
    ellipse(center, center, size, size);
  }
}
