PImage img; //<>//
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[11];
String ls, rs;
float ans;
char op;              
boolean left, eq;    

void setup() {
  size(800, 1000);
  img = loadImage("MARBLEBACKGROUND.jpg");
  ls = "0";
  rs = "0";
  ans = 0;
  op = ' ';
  left = true;
  eq = false;
  //Numbers
  numButtons[0] = new Button(225, 693, 150, 126).asNumber(0);
  numButtons[1] = new Button (25, 537, 150, 126).asNumber(1);
  numButtons[2] = new Button (225, 537, 150, 126).asNumber(2);
  numButtons[3] = new Button(425, 537, 150, 126).asNumber(3);
  numButtons[4] = new Button(25, 381, 150, 126).asNumber(4);
  numButtons[5] = new Button(225, 381, 150, 126).asNumber(5);
  numButtons[6] = new Button(425, 381, 150, 126).asNumber(6);
  numButtons[7] = new Button(25, 225, 150, 126).asNumber(7);
  numButtons[8] = new Button(225, 225, 150, 126).asNumber(8);
  numButtons[9] = new Button(425, 225, 150, 126).asNumber(9);
  //Formulas
  opButtons[0] = new Button(700, 0, 100, 200).asOperator('C');
  opButtons[1] = new Button(625, 693, 150, 126).asOperator('/'); 
  opButtons[2] = new Button(625, 381, 150, 126).asOperator('*'); 
  opButtons[3] = new Button(625, 537, 150, 126).asOperator('-');
  opButtons[4] = new Button(625, 225, 150, 126).asOperator('+');
  opButtons[5] =new Button(425, 693, 150, 126).asOperator('=');
  opButtons[6] = new Button(25, 693, 150, 126).asOperator('.');
  opButtons[7] = new Button(25, 849, 150, 126).asOperator('s'); //sin
  opButtons[8] = new Button(225, 849, 150, 126).asOperator('c');//cos
  opButtons[9] = new Button(425, 849, 150, 126).asOperator('t');//tan
  opButtons[10] = new Button(625, 849, 150, 126).asOperator('E');//EE
}

void draw() {
  background(img);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over();
  }
  updateDisplay();
}

void mouseReleased() {
  // 
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs += numButtons[i].v;
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '+') { 
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '-') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '*') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '/') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalc();
    } else if (opButtons[i].hov && opButtons[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == 's') {
      if (left) {
        ans = sin(float(ls));
        ls = str((float)ans);
      } else {
        ans = sin(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == 'c') {
      if (left) {
        ans = cos(float(ls));
        ls = str((float)ans);
      } else {
        ans = cos(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    }
  }
}

void performCalc() {
  switch(op) {
  case '+': 
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '-': 
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '*': 
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '/': 
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  }
}

void performClear() {
  ls = "0"; 
  rs = "0";
  ans = 0;
  op = ' ';
  left = true;
  eq = false;
}

void updateDisplay() {
  fill(90, 100);
  stroke(#B99D0D);
  fill(0);
  stroke(#B99D0D);
  rect(0, 0, 700, 200, 4);
  fill(#B99D0D);
  textSize(150);
  fill(#B99D0D);
  if (eq) {
    text((float)ans, 15, 500);
  } else {
    if (left) {
      text(ls, 15, 150);
    } else {
      text(rs, 15, 150);
    }
  }
  eq = false;
}