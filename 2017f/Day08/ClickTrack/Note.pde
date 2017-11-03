class Note {
  
  PVector pos = new PVector(width/2, height/2);
  float startTime = 0;
  float duration = 0.5;
  int index = 0;
  
  Note(int _index, float _startTime) {
    index = _index;
    startTime = _startTime;
  }
  
  void run() {
    if (currentTime > startTime && currentTime < startTime + duration) {
      ellipseMode(CENTER);
      
      if (index == 1) {
        fill(255);
        noStroke();
        pos.y = lerp(pos.y, 0, 0.005);
        ellipse(pos.x, pos.y, 10, 10);
      } else  if (index == 2) {
        fill(255, 0, 255, 127);
        noStroke();
        pos.y = lerp(pos.y, height, 0.005);
        ellipse(pos.x, pos.y, 20, 20);
      } else  if (index == 3) {
        fill(0, 127, 255);
        noStroke();
        ellipse(random(width), random(height), 20, 20);
      }
    }
  }
  
}