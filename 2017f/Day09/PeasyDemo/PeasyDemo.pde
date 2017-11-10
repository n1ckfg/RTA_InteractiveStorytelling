// https://forum.processing.org/one/topic/pgraphics-in-3d-pgraphics-and-peasycam.html

import peasy.*;

PeasyCam cam;
PMatrix mat_scene;

void setup() {
  size(640,480,P3D);
  mat_scene = getMatrix();
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
  bloomSetup();
}

void draw() {
  background(0);
  pushMatrix();
  
  tex.beginDraw();
  tex.setMatrix(getMatrix());
  tex.rotateX(-.5);
  tex.rotateY(-.5);
  tex.background(0);
  tex.fill(255,0,0);
  tex.box(30);
  tex.pushMatrix();
  tex.translate(0,0,20);
  tex.fill(0,0,255);
  tex.box(5);
  tex.popMatrix();
  tex.endDraw();
  
  setMatrix(mat_scene);
  bloomDraw();
  
  popMatrix();
}