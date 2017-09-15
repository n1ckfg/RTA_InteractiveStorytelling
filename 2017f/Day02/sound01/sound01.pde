import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(960, 540, FX2D);
  
  minim = new Minim(this);
  player = minim.loadFile("molasses.mp3");
  player.play();
  player.loop();

  blendMode(ADD);
}

void draw() {
  background(0);

  float xPos = map(player.position(), 0, player.length(), 0, width);
  noStroke();
  fill(0, 40, 80);
  rect(0, 0, xPos, height);
  
  for (int i = 0; i < player.bufferSize() - 1; i++) {
    float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    float y1 = avgSample(i);
    float y2 = avgSample(i+1);

    stroke(0, 40, 127);
    strokeWeight(8);
    line(x1, y1, x2, y2);
  
    stroke(0, 0, 255);
    strokeWeight(4);
    line(x1, y1, x2, y2);
  }
}

float avgSample(int index) {
  float val = (player.left.get(index) + player.right.get(index)) / 2;
  return (val * height) + (height/2);
}