boolean filterPunctuation = false;

void keyPressed() {
  if (keyCode == BACKSPACE && message.length() > 0) {
    message = message.substring(0, message.length()-1);
  } else if (keyCode == DELETE) {
    message = "";
  } else if (keyCode == ENTER || keyCode == RETURN) {
    result = message;
    message = "";
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    if (!filterPunctuation || !isBlockedPunctuation(key)) {
      message = message + key;
    }
  }
}

boolean isBlockedPunctuation(char input) {
  if (input == '\'' || input == '\"' || input ==',' || input == '.' || input == '?' || input == '!') {
    return true;
  } else {
    return false;
  }
}