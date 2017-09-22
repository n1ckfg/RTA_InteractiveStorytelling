var x = 500;

function setup() {
  createCanvas(640, 480);
  background(random(255),0,0);
}

function draw() {
  ellipse(mouseX, mouseY, 10, 10);
}