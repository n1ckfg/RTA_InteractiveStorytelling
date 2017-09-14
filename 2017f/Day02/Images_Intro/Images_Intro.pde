PImage potter, mushroom;

float x = 50;
float y = 100;

void setup() { 
  size(640, 360, P2D);
  potter = loadImage("potter.png");
  mushroom = loadImage("mushroom.png");
}

void draw() {
  background(127);
  imageMode(CENTER);
  image(potter, random(width), random(height));
  image(mushroom, mouseX, mouseY, 50, 50);
}