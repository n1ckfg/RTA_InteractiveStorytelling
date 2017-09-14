PImage potterImg, mushroomImg, cursorImg;

float x = 50;
float y = 100;

float rot = 0;

void setup() { 
  size(640, 360, P2D);
  imageMode(CENTER);
  potterImg = loadImage("potter.png");
  mushroomImg = loadImage("mushroom.png");
  cursorImg = potterImg;
}

void draw() {  
  background(127);
  if (mousePressed) {
    cursorImg = mushroomImg;
  } else {
    cursorImg = potterImg;  
  }
  
  image(cursorImg, mouseX, mouseY);
  
  // This is a more advanced way of rotating and scaling an image
  // https://processing.org/reference/pushMatrix_.html
  /*
  pushMatrix();
  translate(mouseX, mouseY);
  scale(0.5, 0.5);
  rotate(radians(rot));
  rot += 2;
  image(cursorImg, 0, 0);
  popMatrix();
  */
}

void mousePressed() {
  cursorImg = mushroomImg;
}

void mouseReleased() {
  cursorImg = potterImg;
}