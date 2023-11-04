Firework particle [] = new Firework[1000];

double xValue = (int)(Math.random()*800);
double yValue = (int)(Math.random()*800);
boolean show;

void setup() {
  size(800, 800);
  noStroke();
  for (int i = 0; i < particle.length; i++)
    particle[i] = new Firework();
}

void draw() {
  background(25, 25, 100);
  fill(25, 25, 100);
  if (show == true) {
    if (particle[20].circle == true )
      tower();
    for (int i = 0; i < particle.length; i++) {
      particle[i].show();
      particle[i].drift();
    }
  }
}
void mouseClicked() {
  xValue = mouseX;
  yValue = mouseY;
  //xValue = (Math.random()*800);
  //yValue = (Math.random()*800);
  for (int i = 0; i < particle.length; i++) {
    if ((i % 20) == 0)
      particle[i] = new Sparkle();
    else
      particle[i] = new Firework();
  }
  show = true;
}
void keyPressed() {
  for (int i = 0; i < particle.length; i++) {
    particle[i] = new Laser();
  }
  show = true;
}
class Firework {
  double myX, myY, myAngle, mySpeed;
  float elSize, rectSize, cycle;
  int farbe;
  boolean circle;
  Firework() {
    circle = true;
    cycle = 0;
    myAngle = (Math.random() * 2 *  3.14);
    farbe = color((int)(Math.random()*200)+55, (int)(Math.random()*50), 255);
    myX = xValue;
    myY = yValue;
    mySpeed = (Math.random()*10);
    elSize = 20;
  }
  void show() {
    fill(farbe);
    if (cycle > 75) {
      elSize = elSize - 2;
    }
    if (elSize == 0)
      show = false;
    ellipse((int) myX, (int) myY, elSize, elSize);
  }
  void drift() {
    cycle = cycle + 1;
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
  }
}

class Sparkle extends Firework {
  Sparkle() {
    cycle = 5;
    circle = false;
    farbe = color(255);
    rectSize = 10;
  }
  void show() {
    fill(farbe);
    if (cycle > 75)
      rectSize = rectSize - 0.5;
    rect((int) myX, (int) myY, rectSize, rectSize);
  }

  void drift() {
    cycle = cycle + 0.9;
    myY = myY + (Math.sin(myAngle)*mySpeed) + (Math.random()*5) - 2;
    myX = myX + (Math.cos(myAngle)*mySpeed) + (Math.random()*5) - 2;
  }
}

class Laser extends Firework {
  Laser() {
    farbe = color(255, 0, 0);
    myX = 400;
    myY = 400;
    mySpeed = (int) (Math.random()*10) + 1;
    elSize = 26;
  }
  void show() {
    fill(farbe);
    if (cycle > 300) {
      elSize = elSize - 1;
    }
    if (elSize == 0)
      show = false;
    ellipse((int) myX, (int) myY, elSize, elSize);
  }
  void drift() {
    cycle = cycle + 2;
    if (cycle > 100) {
      myX = myX + (Math.cos(myAngle)*mySpeed*0.2*cycle);
      myY = myY + (Math.sin(myAngle)*mySpeed*0.2*cycle);
    } else {
      myX = myX + (Math.cos(myAngle)*mySpeed*0.5);
      myY = myY + (Math.sin(myAngle)*mySpeed*0.5);
    }
  }
}

void tower() {
  fill(0);
  beginShape();
  vertex(250, 700);
  vertex(250, 700);
  vertex(400, 400);
  vertex(550, 700);
  vertex(500, 700);
  vertex(450, 500);
  vertex(350, 500);
  vertex(300, 700);
  endShape();
  rect(200, 700, 400, 50);
  fill(2555, 0, 0);
  ellipse(400, 400, 20, 20);
}


