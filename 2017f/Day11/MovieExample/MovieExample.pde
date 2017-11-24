import processing.video.*;

MovieClip clip1, clip2;

void setup() {
  size(640, 480, P2D);
  clip1 = new MovieClip(this, "cat.mp4");
  clip1.p = new PVector(400, height/2);
  
  clip2 = new MovieClip(this, "peach.mp4");
  clip2.p = new PVector(50, height/2);
}

void draw() {
  background(0);
  clip1.draw();
  clip2.draw();
  
  if (millis() > 6000) {
    clip1.alpha = 127;
    clip2.alive = false;
  }
}