PFont f;

float center;

Circle circles;
Planet[] planets;
Sun sun;
Moon moon;

float[] sizePlanets = {4.5, 10.3, 10, 5.5, 25, 23, 15, 15, 4};
String[] title = {"Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto"};
String[] diameter = {"4,900 km", "12,100 km", "12,742 km", "6,799 km", "141,000 km", "120,536 km", "50,000 km", "49,528 km", "2,370 km"};

void setup(){
  size(900, 600, P2D);
  f = loadFont("Rajdhani-Light-48.vlw");  
  
  center = height / 2;
  circles = new Circle(center, sizePlanets.length);
  planets = new Planet[sizePlanets.length];
  sun = new Sun(40, center);
  
  for(int i = 0; i < sizePlanets.length; i++)
    planets[i] = new Planet(
                            sizePlanets[i], 
                            circles.getRadius(i), 
                            center, 
                            (float)((sizePlanets.length + 1) - i) / 10
                           );
                           
  moon = new Moon(sizePlanets[2] / 2, sizePlanets[2] + (sizePlanets[2] * 0.1));  
}

void draw(){
  background(38, 50, 56);
  fill(132, 255, 255);
  stroke(132, 255, 255);
  textFont(f, 24);
  text("SolarSystem", 3, 24);

 
  for(int i = 0; i < planets.length; i++){
    textFont(f, 20);
    text(i + 1, planets[i].getInfoX() + (center / 9.5 / 3), center);
  }
  
  for(int i = 0; i < planets.length; i++)
    planets[i].draw();
    
  circles.draw();
  sun.draw();
  moon.draw(planets[2].getX(), planets[2].getY());
  printTitle();
  
  
  fill(255, 255, 255, 0);
  
  for(int i = 7; i < 10; i++)
    ellipse(planets[5].getX(), planets[5].getY(), sizePlanets[5]+10, sizePlanets[5]+i);
}

void printTitle(){
  pushMatrix();
  
  translate(600 + 50, 0);
  textFont(f, 24);
  
  for(int i = 0; i < planets.length; i++)
    text((i + 1) + ") " + title[i] + " - " + diameter[i], 0, height / 10 * (i + 1));
    
  popMatrix();
}
