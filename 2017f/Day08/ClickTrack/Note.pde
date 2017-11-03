// This keeps the notes sorted by time
// https://stackoverflow.com/questions/1814095/sorting-an-arraylist-of-objects-using-a-custom-sorting-order
// https://stackoverflow.com/questions/3705275/help-comparing-float-member-variables-using-comparators

class Note implements Comparable<Note> {
  
  PVector pos = new PVector(width/2, height/2);
  float startTime = 0;
  float duration = 0.5;
  int index = 0;
  
  Note(int _index, float _startTime) {
    index = _index;
    startTime = _startTime;
    println("Note: " + index + ", " + startTime);
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
        for (int i=0; i<15; i++) {
          ellipse(random(100, width-100), random(height), 10, 15);
        }
      }
    }
  }
  
  int compareTo(Note other) {
    return Float.compare(startTime, other.startTime);
  }

}