class Blob {
  
  ArrayList<PVector> points;
  
  Blob() {
    points = new ArrayList<PVector>();
  }
  
  void run() {
    stroke(255,0,0);
    fill(127,127,255);
    beginShape();
    for (int i=0; i<points.size(); i++) {
      PVector p = points.get(i);
      p.y += random(0,2);
      vertex(p.x, p.y);
    }
    endShape();
  }

}