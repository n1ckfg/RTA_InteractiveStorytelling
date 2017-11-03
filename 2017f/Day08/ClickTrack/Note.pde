class Note {
  
  PVector pos = new PVector(width/2, height/2);
  float startTime = 0;
  float duration = 1;
  
  Note(float _startTime) {
    startTime = _startTime;
    println("created note: " + startTime);
  }
  
  void run() {
    if (currentTime > startTime && currentTime < startTime + duration) {
      ellipseMode(CENTER);
      fill(255);
      noStroke();
      ellipse(pos.x, pos.y, 10, 10);
    }
  }
  
}