Blob blob;
Data data;
ArrayList<PVector> points;

void setup() {
  size(640, 480, P2D);
  blob = new Blob();
  points = new ArrayList<PVector>();
  loadPoints();
  blob.points = points;
}

void draw() {
  background(0);
  blob.run();
}

void loadPoints() {
  data = new Data();
  data.load("points.txt");
  for (int i=0; i<data.data.length; i++) {
    String[] s = data.data[i].split(",");
    points.add(new PVector(float(s[0]), float(s[1])));
  }
}