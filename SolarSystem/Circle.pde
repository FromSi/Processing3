public class Circle{
  private float center;
  private float[] radius;
  private int count;
  
  public Circle(float center, int count){
    this.center = center;
    this.count = count;
    radius = new float[count];
    
    for(int i = 1; i < (count + 1); i++)
      radius[i - 1] = center / 9.5 * i;
  }
  
  public void draw(){
    for(int i = 0; i < count; i++){
      int angle = 0;
    
      for(int j = 0; j < width; j++){
        point(
              center + cos(radians(angle)) * radius[i],
              center + sin(radians(angle)) * radius[i]
             );
        angle++;
      }  
    }
  }
  
  public float getRadius(int index){
    return radius[index];
  }
}
