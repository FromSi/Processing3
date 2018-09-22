PImage[] imgArray = new PImage[40];
int index = 0;

void setup() {
  size(1280, 533, P2D);
  frameRate(8);
  
  for (int i = 0; i < 40; i++){
    imgArray[i] = loadImage("img/raven_" + (i + 1) + ".png");
  }
}

void draw() {
  if (index < 39){
    image(imgArray[++index], 0, 0, 1280, 533);
  } else {
    index = 0;
    image(imgArray[index], 0, 0, 1280, 533);
  }
}
