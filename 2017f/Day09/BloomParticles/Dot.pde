class Dot {

  PVector p;
  
  Dot() {
    p = new PVector(mouseX, mouseY);
  }
  
  void run() {
    p.y += random(0,2);
    tex.ellipse(p.x, p.y, 10, 10);
  }
  
}