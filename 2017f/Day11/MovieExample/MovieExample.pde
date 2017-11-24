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
  clip1.run();
  clip2.run();
}