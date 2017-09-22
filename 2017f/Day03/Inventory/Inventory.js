var img1, img2, img3;
var potter;
var counter = 0;
var x1, y1, x2, y2, x3, y3;
var potterClicked1 = false;
var potterClicked2 = false;
var potterClicked3 = false;

function preload() {
  img1 = loadImage("./images/castle.jpg");
  img2 = loadImage("./images/forest.jpg");
  img3 = loadImage("./images/village.jpg");
  potter = loadImage("./images/potter.png");
}

function setup() {
  createCanvas(640, 360);
  x1 = (width/2) - 200;
  y1 = height/2;
  x2 = width/2;
  y2 = height/2;
  x3 = (width/2) + 200;
  y3 = height/2;
}

function draw() {
  noTint();
  imageMode(CORNER);
  if (counter == 0) {
    image(img1, 0, 0, width, height);
  } else if (counter == 1) {
    image(img2, 0, 0, width, height);   
  } else if (counter == 2) {
    image(img3, 0, 0, width, height);    
  }
  
  imageMode(CENTER);
  if (potterClicked1) {
    tint(255,0,0);
  } else {
    noTint();
  }
  image(potter, x1, y1);
  
  if (potterClicked2) {
    tint(255,0,0);
  } else {
    noTint();
  }
  image(potter, x2, y2);
  
  if (potterClicked3) {
    tint(255,0,0);
  } else {
    noTint();
  }
  image(potter, x3, y3);
}

function mousePressed() {
  if (hitDetectImage(mouseX, mouseY, x1, y1, potter)) potterClicked1 = true;
  if (hitDetectImage(mouseX, mouseY, x2, y2, potter)) potterClicked2 = true;
  if (hitDetectImage(mouseX, mouseY, x3, y3, potter)) potterClicked3 = true;
  
  if (potterClicked1 && potterClicked2 && potterClicked3) {
    counter++;
    if (counter > 2) {
      counter = 0;
    }
    potterClicked1 = false;
    potterClicked2 = false;
    potterClicked3 = false;
  }
}



// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

// 2D RECTANGLE hit detect: xy, wh of object 1; xy, wh of object 2; assumes center.
function hitDetectRect(x1, y1, w1, h1, x2, y2, w2, h2) {
  w1 /= 2;
  h1 /= 2;
  w2 /= 2;
  h2 /= 2; 
  if ( x1 + w1 >= x2 - w2 && 
       x1 - w1 <= x2 + w2 && 
       y1 + h1 >= y2 - h2 && 
       y1 - h1 <= y2 + h2 ) 
  {
    return true;
  } else {
    return false;
  }
}

// 2D CIRCLE hit detect: xy, diameter of object 1; xy, diameter of object 2; assumes center.
function hitDetectCircle(x1, y1, d1, x2, y2, d2) {
  d1 /= 2;
  d2 /= 2;
  if (dist(x1, y1, x2, y2) < d1 + d2) {
    return true;
  } else {
    return false;
  }
}

// 2D IMAGE hit detect: xy of object 1; xy, wh of object 2; assumes center.
function hitDetectImage(x1, y1, x2, y2, img) {
  if (this.hitDetectRect(x1, y1, 1, 1, x2, y2, img.width, img.height)) {
    var xLoc = constrain((x1 - x2) + (img.width/2), 0, img.width-1);
    var yLoc = constrain((y1 - y2) + (img.height/2), 0, img.height-1);
    //var loc = xLoc + (yLoc * img.width);
    //var c = img.pixels[loc];
    var c = img.get(xLoc, yLoc);
    if (alpha(c) > 0) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }  
}


