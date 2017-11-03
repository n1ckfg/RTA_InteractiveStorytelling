import ddf.minim.*;

Minim minim;
AudioPlayer player;
Data output;
float currentTime = 0;
ArrayList<Note> notes = new ArrayList<Note>();

void setup() {
  size(512, 512, P2D);
  minim = new Minim(this);
  player = minim.loadFile("march.mp3");
  player.play();

  output = new Data();
  output.beginSave();

  try {
    output.load("output.txt");
    for (int i=0; i<output.data.length; i++) {
      output.add(output.data[i]);
      String[] s = output.data[i].split(",");
      int index = int(s[0]);
      float time = float(s[1]);
      notes.add(new Note(index, time));
    }
  } catch (Exception e) { }  
}

void draw() {
  currentTime = player.position() / 1000.0;
  
  background(0);
  
  for (int i=0; i<notes.size(); i++) {
    notes.get(i).run();
  }
}

void keyPressed() {
  if (key=='0' || key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9') {
    String val = key + ", " + currentTime;
    println(val);
    output.add(val);
    
  }
  
  if (key=='s' || key=='S') {
    output.endSave("output.txt");
  }
}