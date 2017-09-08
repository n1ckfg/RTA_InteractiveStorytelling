import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(512, 200, P3D);
  
  minim = new Minim(this);
  player = minim.loadFile("molasses.mp3");
}

void draw() {
  background(0);
  stroke(255);
  
  for (int i = 0; i < player.bufferSize() - 1; i++) {
    float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    line(x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50);
    line(x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50);
  }
  
  float posx = map(player.position(), 0, player.length(), 0, width);
  stroke(0,200,0);
  line(posx, 0, posx, height);
  
  if (player.isPlaying()){
    text("Press any key to pause playback.", 10, 20 );
  } else {
    text("Press any key to start playback.", 10, 20 );
  }
}

void keyPressed() {
  if (player.isPlaying()) {
    player.pause();
  } else if (player.position() == player.length()) {
    player.rewind();
    player.play();
  } else {
    player.play();
  }
}