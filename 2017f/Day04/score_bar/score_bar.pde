float counter = 50;
float deltaMinus = 0.1;
float deltaPlus = 2;

void setup() {
  size(640, 480);
}

void draw() {
  background(127);
  rectMode(CENTER);
  rect(width/2, height/2, 10, 10 + counter);
  
  if (keyPressed) {
    counter += deltaPlus;
  } else if (counter > 0) {
    counter -= deltaMinus;
  }
}