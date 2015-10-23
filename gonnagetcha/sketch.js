var bubbles = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
    background(230, 100, 100);


  for (var i = 0; i < 60; i++) {
    bubbles[i] = new Bubble(random(width), random(height))
  }
}

function draw() {

  for (var i = 0; i < bubbles.length; i++) {
    bubbles[i].move();
    bubbles[i].display();
    bubbles[i].grow(0.3);

    for (var j = 0; j < bubbles.length; j++) {
      if (i != j && bubbles[i].intersects(bubbles[j])) {
        bubbles[i].r = 1;
        // bubbles[i].changeColor();
        // bubbles[j].changeColor();
        
      }

    }
  }

}