PImage img;

void setup() {
  size(640, 480, P2D);
  img = loadImage("smiley1.png");
  imageMode(CENTER);
}

void draw() {
  background(127,0,0);
  if (mousePressed) {
    for (int i=0; i<10 ;i++) {
      image(img, random(width), random(height));
    }
  } else {
    image(img, width/2, height/2);
  }  
}