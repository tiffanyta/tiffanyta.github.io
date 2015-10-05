

void setup() {
  size(600,350);
  background(204, 247, 255);
}

void draw() {
        noStroke();
        fill(random(255), random(255), random(255));
        ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
    
  }
    
