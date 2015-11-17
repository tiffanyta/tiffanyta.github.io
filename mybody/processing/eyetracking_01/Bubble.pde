class Bubble {

  float x;
  float y;
  float diameter;
  float speed;


  Bubble(float tempSpeed) {
    x = width;
    y = random(height-200, height);
    diameter = 30;
    speed = tempSpeed;
  }

  void move() {
    x = x - speed * (random(-3, 5));
    y = y + (random( -10, 10));

    if (x < 0) {
      x = width;
    }
    if (y > height) {
      y = y - 10;
    }
    if (y < height-200) {
      y = y+5;
    }
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(x, y, diameter, diameter);
  }
}

