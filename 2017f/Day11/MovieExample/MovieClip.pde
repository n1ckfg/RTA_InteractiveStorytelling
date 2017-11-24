import processing.video.*;

class MovieClip {
  
  Movie movie;
  PVector p, t;
  boolean alive = true;
  int alpha = 0;
  float vol = 1;
  int fadeDelta = 5;
  float ease = 2;
  
  MovieClip(PApplet sketch, String fileName) {
    movie = new Movie(sketch, fileName);
    movie.loop();
    setPos(new PVector(width/2, height/2));
  }

  void update() {
    mover();
    fader();
  }
  
  void draw() {
    if (movie.available()) {
      movie.read();
    }
    imageMode(CENTER);
    tint(255, alpha);
    image(movie, p.x, p.y);
    noTint();
  }
  
  void run() { 
    update();
    draw();
  }
  
  void mover() {
    if (alive) {
      p.x = lerp(p.x, t.x, ease/100.0);
      p.y = lerp(p.y, t.y, ease/100.0);
    }
  }
  
  void setPos(PVector _p) { 
    p = new PVector(_p.x, _p.y);
    t = new PVector(_p.x, _p.y);
  }
  
  void fader() {
    if (alive && alpha < 255) {
      alpha += fadeDelta;
      if (alpha > 255) alpha = 255;
    } else if (!alive && alpha > 0) {
      alpha -= fadeDelta;
      if (alpha < 0) alpha = 0;
    }
    movie.volume((alpha/255.0) * vol);
  }

}