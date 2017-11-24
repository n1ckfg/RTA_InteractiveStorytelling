MovieClip clip1, clip2;

void setup() {
  size(640, 480, P2D);
  clip1 = new MovieClip(this, "cat.mp4");
  clip1.setPos(new PVector(400, height/2));
  clip1.t = new PVector(width,0);
  
  clip2 = new MovieClip(this, "peach.mp4");
  clip2.setPos(new PVector(50, height/2));
  clip2.ease = 0.2;
  clip2.t.y = height;
}

void draw() {
  background(0);
  clip1.run();
  clip2.run();
  if (millis() > 10000) clip2.alive = false;
  if (millis() > 14000) clip1.alive = false;
}