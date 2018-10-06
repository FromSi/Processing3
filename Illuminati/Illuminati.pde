int sizeM = 4;
int indent = 10;
float radiusEye;
int countTriangle = 50;

float[][] trianglePositionX;
float[][] trianglePositionY;

int[][] triangleRadius;

PFont f;

void setup() {
  size(600, 600, P2D);
  f = loadFont("Rajdhani-Light-48.vlw");
  textFont(f, 26);
  
  radiusEye = indent * 2;
  triangleRadius = new int[countTriangle][3];
  
  for(int i = 0; i < countTriangle; i++){
    triangleRadius[i][0] = -180;
    triangleRadius[i][1] = -90;
    triangleRadius[i][2] = 0;
  }
}

void draw() {
  background(38, 50, 56);
  stroke(132, 255, 255);
  
  drawTriangles();
  
  fill(38, 50, 56);
  
  triangle(
  width / sizeM, 
  height-(height / sizeM), 
  width / 2, 
  height/sizeM, 
  width-(width / sizeM),
  height-(height / sizeM)
  );
  
  triangle(
  width / sizeM + (indent * 4), 
  height - (height / sizeM) - (indent * 4), 
  width / 2, 
  height / sizeM + indent, 
  width - (width / sizeM) - (indent * 4),
  height - (height / sizeM) - (indent * 4)
  );
  
  beginShape();
  vertex((width / 2) - (radiusEye * 2), height / 2);
  vertex(width / 2, (height / 2) - radiusEye);
  vertex((width / 2) + (radiusEye * 2), height / 2);
  vertex(width / 2, (height / 2) + radiusEye);
  vertex((width / 2) - (radiusEye * 2), height / 2);
  endShape(CLOSE);  
  
  beginShape();
  vertex(width / 2, (height / 2) - radiusEye);
  vertex((width / 2) - (radiusEye /2), height / 2);
  vertex(width / 2, (height / 2) + radiusEye);
  vertex((width / 2) + (radiusEye / 2), height / 2);
  vertex(width / 2, (height / 2) - radiusEye);
  endShape(CLOSE);
  
  line(width / 2, (height / 2) - (radiusEye / 4), width / 2, (height / 2) + (radiusEye / 4));
  
  fill(132, 255, 255);
  textAlign(CENTER);
  text("Illuminati", width / 2, width - (width / sizeM) - indent);
}

void drawTriangles(){
  fill(38, 50, 56);
  for(int i = 0; i < countTriangle; i++){
    if((i % 2) == 0){
      triangleRadius[i][0]--;
      triangleRadius[i][1]--;
      triangleRadius[i][2]--;
    } else {
      triangleRadius[i][0]++;
      triangleRadius[i][1]++;
      triangleRadius[i][2]++;
    }
    
    triangle(
            (height / 2) + cos(radians(-180)) * (width / sizeM) - ((countTriangle - i) * (indent * 2)), 
            ((height / 2) + ((height / 4) / 2)) + sin(radians(triangleRadius[i][0])) * (height - (height / sizeM)) + ((countTriangle - i) * (indent * 2)), 
            (height / 2) + cos(radians(-90)) * (width / 2), 
            ((height / 2) + ((height / 4) / 2)) + sin(radians(triangleRadius[i][0])) * (height/sizeM) - ((countTriangle - i) * (indent * 2)), 
            (height / 2) + cos(radians(0)) * (width / sizeM) + ((countTriangle - i) * (indent * 2)),
            ((height / 2) + ((height / 4) / 2)) + sin(radians(triangleRadius[i][0])) * (height - (height / sizeM)) + ((countTriangle - i) * (indent * 2))
    );
  }
}
