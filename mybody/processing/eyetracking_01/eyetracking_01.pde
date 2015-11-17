PShape s;

Bubble[] bubbles = new Bubble[4];


void setup() {
  size(1300, 700);
  s = loadShape("layingposture.svg");
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble(random(10));
  }
}



void draw() {
  background(#F4273B);

  //floor
  noStroke();
  fill(#A51E2B);
  rect(0, height-200, width, height);

  //lady
  shape(s, -10, -35, width, height);

  //eye mapping
  int eyeSize= 30;
  int eyeLoc = 200;
  float x1 = map(bubbles[0].x +630, 0, width, eyeLoc-10, eyeLoc+5);
  float x2 = map(bubbles[0].x +630, 0, width, eyeLoc-10, eyeLoc+5);

  //eyes
  fill(#ffffff);
  stroke(0);
  strokeWeight(4);
  ellipse(eyeLoc, eyeLoc +110, eyeSize, eyeSize/3); //left eye
  ellipse(eyeLoc + 50, eyeLoc +110, eyeSize, eyeSize/3); //right eye

  //eyes pupil
  fill(0);
  noStroke();
  ellipse(x1, eyeLoc +113, eyeSize/3, eyeSize/3); //left pupil
  ellipse(x2 + 50, eyeLoc +113, eyeSize/3, eyeSize/3); //right pupil

  // circle
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].display();
    bubbles[i].move();
  }

  println(bubbles[0].x);
}

