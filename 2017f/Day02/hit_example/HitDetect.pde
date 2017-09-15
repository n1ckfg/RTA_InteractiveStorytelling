boolean hitDetectRect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
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

boolean hitDetectImage(float x1, float y1, float x2, float y2, PImage img) {
  if (hitDetectRect(x1, y1, 1, 1, x2, y2, img.width, img.height)) {
    int xLoc = constrain(int((x1 - x2) + (img.width/2)), 0, img.width-1);
    int yLoc = constrain(int((y1 - y2) + (img.height/2)), 0, img.height-1);
    int loc = int(xLoc + (yLoc * img.width));
    color c = img.pixels[loc];
    if (alpha(c) > 0) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }  
}