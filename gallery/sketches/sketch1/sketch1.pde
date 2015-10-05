void setup() {
  size(600, 350);
}

float x;
float y;
float direction;
float mouseAcc = 0;
int numFollowers = 0;
float fx;
float fy;

void draw() {
  background(255);

  // jim
  x = mouseX;
  y= mouseY;

  fill(0);

  //if mouse is going right
  if (pmouseX < mouseX && direction != 1) {
    direction = 1;
    mouseAcc = 0;
    //triangle(x-15, y+15, x-15, y-15, x+15, y);
  } else if (pmouseX > mouseX && direction != -1) {
    direction = -1;
    mouseAcc = 0;
    //triangle(x-15, y+15, x-15, y-15, x-45, y);
  } 


  mouseAcc = mouseAcc + (mouseX - pmouseX);
  println(mouseAcc);

  numFollowers = int( pow(2, abs( mouseAcc / 100) ) );
  println(numFollowers);

  

  if ( direction == 1) {
    triangle(x-15, y+15, x-15, y-15, x+15, y);
    
    for(int i = 0; i < numFollowers ; i++){
    fx = mouseX - 40 + random(-100,20);
    fy = mouseY + random(-100,100);
    noStroke();
    fill(255, 0, 0);
    triangle(fx-15, fy+5, fx-15, fy-5, fx+5, fy);
    }
    
  } else if (direction == -1) {
    triangle(x-15, y+15, x-15, y-15, x-45, y);
    
    for(int i = 0; i < numFollowers ; i++){
    fx = mouseX +40 + random(-20,100);
    fy = mouseY + random(-100,100);
    noStroke();
    fill(255, 0, 0);
    triangle(fx-15, fy+5, fx-15, fy-5, fx-35, fy);
    }
  }
}