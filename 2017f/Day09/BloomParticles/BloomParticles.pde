ArrayList<Dot> dots;

void setup() {
  size(640, 480, P3D);
  bloomSetup();
  dots = new ArrayList<Dot>();
}

void draw() {
  tex.beginDraw();
  tex.background(0);
  dots.add(new Dot());
  for (int i=0; i<dots.size(); i++) {
    Dot d = dots.get(i);
    d.run();
    if (d.p.y > height) {
      dots.remove(i);
    }
  }
  tex.endDraw();
  bloomDraw();
}