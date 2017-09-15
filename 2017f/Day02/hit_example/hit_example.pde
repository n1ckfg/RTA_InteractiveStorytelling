PImage potter, castle, forest, bg;

void setup() {
  size(640, 360, P2D);
  potter = loadImage("potter.png");
  castle = loadImage("castle.jpg");
  forest = loadImage("forest.jpg");
  bg = castle;
}

void draw() {
  noTint();
  background(127);
  
  imageMode(CORNER);
  image(bg, 0, 0, width, height);
  
  if (hitDetectImage(mouseX, mouseY, width/2, height/2, potter)) {
    if (mousePressed) {
      tint(255,0,0);
      bg = forest;
    } else {
      tint(255, 127, 0);
    }
  } else {
    noTint();
  }
  
  imageMode(CENTER);
  image(potter, width/2, height/2);
}