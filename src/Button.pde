class Button {
  int x, y, w, h, v;
  char o;
  boolean hov, num;   

  // Constructors
  Button(int x, int y, int w, int h) {
    this.x = x; 
    this.y = y; 
    this.w = w; 
    this.h = h;
  }

  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }

  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }

  // Display
  void display() {
    fill(180, 180, 180, 80);
    noStroke();
    rect(x+3, y+3, w, h, 4);
    if (hov) {
      fill(50);
    } else {
      fill(0);
    }
    stroke(#B99D0D);
    rect(x, y, w, h, 4);
    fill(#B99D0D);
    textSize(150);
    if (num) {
      text(v, x+30, y+h-4);
    } else {
      if (o == 'n') {
        text("+/-", x+20, y+h-20);
      } else if (o == '/') {
        textSize(150);
        text("÷", x+20, y+h-20);
      } else {
        text(o, x+5, y+h-5);
      }
    }
  }

  // Click
  void over() {
    hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}