"use strict";

var api = "https://api.giphy.com/v1/gifs/search?";
var apiKey = "dc6zaTOxFJmzC";
var query="rainbow";
var gif = [];
var gifUrl = [];
var anim = [];
var ready = false;

function setup() {
  createCanvas(640, 480);
  background(127);
  textSize(32);

  var url = api + "&api_key=" + apiKey + "&q=" + query;
  loadJSON(url, gotData);
}

function draw() {
  if (ready && mouseIsPressed) {
    var index = parseInt(random(gif.length));
    anim.push(new Anim(mouseX, mouseY, gif[index], "" + gifUrl[index]));
  }

  for (var i=0; i<anim.length; i++) {
    anim[i].run();
    if (anim[i].y > height + 100) anim.splice(i, 1);
  }
}

function gotData(data) {
  for (var i=0; i<data.data.length; i++) {
    var url = data.data[i].images.original.url.split("?")[0];
    console.log(url);
    gif.push(loadGif(url));
    gifUrl.push(url);
  }

  ready = true;
}

class Anim {

  constructor(_x, _y, _gif, _gifUrl) {
    this.x = _x;
    this.y = _y;
    this.gif = _gif;
    this.gifUrl = _gifUrl;
    this.speed = random(0.5, 3);
  }

  update() {
    this.y += this.speed;
  }

  draw() {
    imageMode(CENTER);
    push();
    translate(this.x, this.y);
    scale(0.2, 0.2);
    image(this.gif, 0, 0);
    text(this.gifUrl, 0, 0);
    pop();
  }

  run() {
    this.update();
    this.draw();
  }

}
