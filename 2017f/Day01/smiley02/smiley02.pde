PImage[] img = new PImage[2];

void setup() {
  size(640, 480, P2D);
  img[0] = loadImage("smiley1.png");
  img[1] = loadImage("smiley2.png");
  imageMode(CENTER); 
}

void draw() {
  background(127,0,0);
  if (mousePressed) {
    image(img[1], width/2, height/2);
  } else {
    image(img[0], width/2, height/2);
  }  
}