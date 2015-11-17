PShape s;

import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture cam;
PImage current, bgImg;
boolean newBG =false;

void setup() {
  size(1300, 700);
  s = loadShape("layingposture.svg");
  String[] cameras = Capture.list();


  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}


//println(mouseX);



void draw() {
  background(#F4273B);

  //floor
  noStroke();
  fill(#A51E2B);
  rect(0, height-200, width, height);
  
  //interactive arc
  fill(0,255,0);
  ellipse(width/2, height-200, width - 250, height/3);
  

  //lady
  shape(s, -10, -35, width, height);

  //eye mapping
  int eyeSize= 30;
  int eyeLoc = 200;
  float x1 = map(mouseX +630, 0, width, eyeLoc-10, eyeLoc+5);
  float x2 = map(mouseX +630, 0, width, eyeLoc-10, eyeLoc+5);


  //eyes
  fill(#ffffff);
  stroke(0);
  strokeWeight(4);
  ellipse(eyeLoc, eyeLoc +110, eyeSize, eyeSize/3); //left eye
  ellipse(eyeLoc + 50, eyeLoc +110, eyeSize, eyeSize/3); //right eye

  fill(0);
  noStroke();
  ellipse(x1, eyeLoc +113, eyeSize/3, eyeSize/3); //left pupil
  ellipse(x2 + 50, eyeLoc +113, eyeSize/3, eyeSize/3); //right pupil


  //cam turn on
  if (cam.available() == true) {
    cam.read();
  }
  PImage myImage = cam;
image(myImage, mouseX, 500, 100, 60);
println(mouseX);
  
  
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);


}

