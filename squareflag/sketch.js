var rot = 0;
var red;
var green;
var blue;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0,0,255)
  smooth();
  noStroke();
}
function draw_rotating_rectangle(x, y, rect_size, r) {
  this.x = x;
  this.y = y;
  this.rect_size = rect_size;
  this.r = r;
  translate(x, y);
  rotate(r);
  fill(0,255,255,150);
  rect(0, 0, rect_size, rect_size);
  resetMatrix();
}
function draw() {
  rect(0,0,width,height);
    red=255.0/width*mouseX;
    green=255.0/height*mouseY;
    blue=255.0/width+height*mouseY+mouseY;

  background(red, green, blue);

  var x = 0;
  while (x < 30) {
    var y = 0;
    while (y < 30) { 
      // we give a unique rotation amount to each rectangle, depending
      // on which column and row the rectangle is located (x and y)
      draw_rotating_rectangle(x*50+10, y*50+10, sqrt(pow(mouseX-x*50,2)+pow(mouseY-y*50,2))/10, x+y );
      y = y + 1;
    }
    x = x + 1;
  }
  rot = rot + map(mouseX, 0, width, 0.2, 0.8);
}



