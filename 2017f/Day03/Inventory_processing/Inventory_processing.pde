PImage img1, img2, img3;
PImage potter;
int counter = 0;
float x1, y1, x2, y2, x3, y3;
boolean potterClicked1 = false;
boolean potterClicked2 = false;
boolean potterClicked3 = false;

void setup() {
  size(640, 360);
  
  img1 = loadImage("castle.jpg");
  img2 = loadImage("forest.jpg");
  img3 = loadImage("village.jpg");
  potter = loadImage("potter.png");  
  
  x1 = (width/2) - 200;
  y1 = height/2;
  x2 = width/2;
  y2 = height/2;
  x3 = (width/2) + 200;
  y3 = height/2;
}

void draw() {
  noTint();
  imageMode(CORNER);
  if (counter == 0) {
    image(img1, 0, 0, width, height);
  } else if (counter == 1) {
    image(img2, 0, 0, width, height);   
  } else if (counter == 2) {
    image(img3, 0, 0, width, height);    
  }
  
  imageMode(CENTER);
  if (potterClicked1) {
    tint(255,0,0);
  } else {
    noTint();
  }
  image(potter, x1, y1);
  
  if (potterClicked2) {
    tint(255,0,0);
  } else {
    noTint();
  }
  image(potter, x2, y2);
  
  if (potterClicked3) {
    tint(255,0,0);
  } else {
    noTint();
  }
  image(potter, x3, y3);
}

void mousePressed() {
  if (hitDetectImage(mouseX, mouseY, x1, y1, potter)) potterClicked1 = true;
  if (hitDetectImage(mouseX, mouseY, x2, y2, potter)) potterClicked2 = true;
  if (hitDetectImage(mouseX, mouseY, x3, y3, potter)) potterClicked3 = true;
  
  if (potterClicked1 && potterClicked2 && potterClicked3) {
    counter++;
    if (counter > 2) {
      counter = 0;
    }
    potterClicked1 = false;
    potterClicked2 = false;
    potterClicked3 = false;
  }
}