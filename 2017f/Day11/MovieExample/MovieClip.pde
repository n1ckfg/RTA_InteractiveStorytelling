class MovieClip {
  
  Movie movie;
  PVector p;
  boolean alive = true;
  int alpha = 255;
  int fadeDelta = 5;
  
  MovieClip(PApplet sketch, String fileName) {
    movie = new Movie(sketch, fileName);
    movie.loop();
    p = new PVector(width/2, height/2);
  }

  void update() {
    //fader();
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
  
  void fader() {
    if (alive && alpha < 255) {
      alpha += fadeDelta;
      if (alpha > 255) alpha = 255;
    } else if (!alive && alpha > 0) {
      alpha -= fadeDelta;
      if (alpha < 0) alpha = 0;
    }
  }

}