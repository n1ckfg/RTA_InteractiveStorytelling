PImage castleImg, forestImg, villageImg, currentImg;
int counter = 0;

void setup() {
  size(640,480);
  
  castleImg = loadImage("castle.jpg");
  forestImg = loadImage("forest.jpg");
  villageImg = loadImage("village.jpg");
  
  currentImg = castleImg;
}

void draw() {
  if (counter == 0) {
    currentImg = castleImg;
  } else if (counter == 1) {
    currentImg = forestImg;
  } else if (counter == 2) {
    currentImg = villageImg;
  }
  
  image(currentImg, 0, 0, width, height);
}

void mousePressed() {
  counter++;
  if (counter > 2) {
    counter = 0;
  }
  println(counter);
}