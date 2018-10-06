import java.util.Random;
import java.util.ArrayList;

final int SIZE_APP_W = 600;
final int SIZE_APP_H = 600;

final float SIZE_H = SIZE_APP_H * 0.03f;
final float COUNT_STRING = SIZE_APP_H / (SIZE_H + (SIZE_H * 0.3f));
final float PADDING = (SIZE_APP_H - (COUNT_STRING * SIZE_H)) / (int) COUNT_STRING;

ArrayList<ArrayList<Integer>> list = new ArrayList<ArrayList<Integer>>();

float MOVE_STRING = 0;

Random rand = new Random(System.currentTimeMillis());

void settings(){
  
  size(SIZE_APP_W, SIZE_APP_H, P2D);
}

void setup(){
  
  generateCountString();
}

void draw(){
  
  background(38, 50, 56);
  stroke(132, 255, 255);
  fill(132, 255, 255);
  
  if((SIZE_H + PADDING * 2) <= MOVE_STRING){
    
    delay(500);
    
    pushMatrix();
    stringDraw();
    popMatrix();
    
    MOVE_STRING = PADDING;
    
    generateCountString();
  } else {
    MOVE_STRING += ((SIZE_H + PADDING * 2) * 0.1);
    
    pushMatrix();
    stringDraw();
    popMatrix();
  }
}

void generateCountString(){
  
  if(list.size() != 27){
    
    list.add(generateString());
  } else {
    
    list.add(generateString());
    list.remove(0);
  }
}

void stringDraw(){
  translate(0, SIZE_APP_H - MOVE_STRING);
  
  for(int i = list.size() - 1; i >= 0; i--){
    
    for(int j = 0; j < list.get(i).size(); j++){
      if(j != 0){
        textDraw(list.get(i).get(j - 1), list.get(i).get(j)); //<>//
      } else {
        textDraw(0, list.get(i).get(j)); //<>//
      }
    } 
    
    translate(0, -(SIZE_H + PADDING));
  }
}

void textDraw(float x1, int x2){
  float PADDING_E = (SIZE_H / 2) + PADDING;
  
  rectMode(CORNERS);
  rect(x1 + PADDING_E, PADDING, x2 - PADDING_E, PADDING + SIZE_H);
  
  ellipseMode(CENTER);
  ellipse(x1 + PADDING_E, PADDING_E + 0.5f, SIZE_H, SIZE_H);
  ellipse(x2 - PADDING_E, PADDING_E + 0.5f, SIZE_H, SIZE_H);
}

ArrayList<Integer> generateString(){
  int end = 0;
  ArrayList<Integer> list = new ArrayList<Integer>();
  
  while(end != SIZE_APP_W){
    int r = rand.nextInt(((SIZE_APP_W / 3) - 50) + 1) + 50;
    
    if((end + r) <= (SIZE_APP_W - 50)){
      end += r;
      
      list.add(end);
    } else {
      
      list.add(SIZE_APP_W);
      
      break;
    }
  }
  
  return list;
}
