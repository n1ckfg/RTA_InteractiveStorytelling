void setup() {
  size(640, 480);
}

void draw() {
  if (mousePressed) {
    ellipse(mouseX, mouseY, 10, 10);
  }
}