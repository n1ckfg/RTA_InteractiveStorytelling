import ddf.minim.*;

Minim minim;
AudioPlayer forestSound, rainSound;

PImage potter, castle, forest, bg, explosion;
boolean clicked = false;

void setup() {
  size(640, 360, P2D);
  
  minim = new Minim(this);
  rainSound = minim.loadFile("rain.mp3");
  rainSound.play();
  
  forestSound = minim.loadFile("forest.mp3");
  
  potter = loadImage("potter.png");
  castle = loadImage("castle.jpg");
  forest = loadImage("forest.jpg");
  explosion = loadImage("explosion.png");
  bg = castle;
}

void draw() {
  noTint();
  blendMode(NORMAL);
  background(127);
  
  imageMode(CORNER);
  image(bg, 0, 0, width, height);
  
  if (hitDetectImage(mouseX, mouseY, width/2, height/2, potter)) {
    if (mousePressed) {
      tint(255,0,0);
      bg = forest;
      rainSound.pause();
      forestSound.play();
      clicked = true;
    } else {
      tint(255, 127, 0);
    }
  } else {
    noTint();
  }
  
  imageMode(CENTER);
  image(potter, width/2, height/2);
  
  if (clicked) {
    noTint();
    blendMode(ADD);
    image(explosion, width/2, height/2);
  }
}