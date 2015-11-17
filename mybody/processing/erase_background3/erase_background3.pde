import gab.opencv.*;
import processing.video.*;
 
OpenCV opencv;
Capture cam;
PImage current, bgImg;
boolean newBG =false;
 
 
void setup() {
 
  size(720, 480, P2D);
  cam = new Capture(this, 720, 480);
  cam.start();
  cam.read();
  current = createImage(width, height, RGB);
  bgImg = createImage(width, height, RGB);
 
  current.loadPixels();
  current = cam.get();
  current.updatePixels();
  bgImg.loadPixels();
  bgImg = current;
 
  opencv = new OpenCV(this, width, height);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
}
 
void draw() {
  println("here");
  if (cam.available()==true) {
    image(current, 0, 0);  
    if (keyPressed) {
      if (key=='n') {
        newBG= true;
      }
    }
    if (newBG) {  
      bgImg = current.get();
      bgImg.updatePixels();n
      newBG=false;
    }
    
    fill(255, 0, 0);
    rect(0,0,width,height);
    opencv.loadImage(current);
    opencv.diff(bgImg);
    println("here1");
    opencv.updateBackground();
    opencv.dilate();
    opencv.erode();
 
    fill(0);
    stroke(255, 0, 0);
    strokeWeight(3);
    for (Contour contour : opencv.findContours()) {
      contour.draw();
    }
  }
  println("here2");
}
 
void captureEvent(Capture c) {
 
  c.read();
  println("here5");
  current = c.get();
  println("here6");
}
