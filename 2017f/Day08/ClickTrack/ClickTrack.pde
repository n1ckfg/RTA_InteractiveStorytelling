import ddf.minim.*;

Minim minim;
AudioPlayer player;
Data output, input;
boolean playback = true;
float currentTime = 0;
ArrayList<Note> notes = new ArrayList<Note>();

void setup() {
  minim = new Minim(this);
  player = minim.loadFile("march.mp3");
  player.play();
  
  input = new Data();
  output = new Data();

  try {
    input.load("output.txt");
    for (int i=0; i<input.data.length; i++) {
      float time = float(input.data[i].split(",")[1]);
      notes.add(new Note(time));
    }
    println("Found " + notes.size() + " notes.");
    
    output.load("output.txt");
  } catch (Exception e) {
    playback = false;
  }
  
  output.beginSave();
}

void draw() {
  currentTime = player.position() / 1000.0;
  
  background(0);
  if (playback) {
    for (int i=0; i<notes.size(); i++) {
      notes.get(i).run();
    }
  }
}

void keyPressed() {
  if (key=='1') {
    String val = "1," + currentTime;
    println(val);
    output.add(val);
    
  }
  if (key=='s') {
    output.endSave("output.txt");
  }
}