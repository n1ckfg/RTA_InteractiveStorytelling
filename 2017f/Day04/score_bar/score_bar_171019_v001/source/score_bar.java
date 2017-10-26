import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class score_bar extends PApplet {

float counter = 50;
float deltaMinus = 0.1f;
float deltaPlus = 2;

public void setup() {
  
}

public void draw() {
  background(127);
  rectMode(CENTER);
  rect(width/2, height/2, 10, 10 + counter);
  
  if (keyPressed) {
    counter += deltaPlus;
  } else if (counter > 0) {
    counter -= deltaMinus;
  }
}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "score_bar" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
