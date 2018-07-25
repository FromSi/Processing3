float start[];

void setup(){
  size(600,600);
  start = new float[] {height/2,width*0.8};
}

void draw(){
  background(38, 50, 56);
  stroke(132,255,255);

  new Stick(new float[] {start[0], start[1]}, 100, 6, true);
}
