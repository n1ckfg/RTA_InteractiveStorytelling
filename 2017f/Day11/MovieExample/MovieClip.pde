class MovieClip {
  
  Movie movie;
  PVector p;
  boolean alive = true;
  
  MovieClip(PApplet sketch, String fileName) {
    movie = new Movie(sketch, fileName);
    movie.loop();
    p = new PVector(width/2, height/2);
  }

  void draw() {
    if (alive) {
      if (movie.available()) {
        movie.read();
        movie.play();
      }
      imageMode(CENTER);
      image(movie, p.x, p.y);
    }
  }

}