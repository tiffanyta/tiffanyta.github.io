// This will show background subtraction from your webcam in processing using:
// https://github.com/atduskgreg/opencv-processing

//https://github.com/atduskgreg/opencv-processing-book/blob/master/book/tracking/background_subtraction.md

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

//Movie video;
Capture video;
OpenCV opencv;

void setup() {
  size(640, 480, P2D);
//  size(720, 480, P2D);
  video = new Capture(this, 640/2, 480/2);
//  video = new Movie(this, "street.mov");
//  opencv = new OpenCV(this, 720, 480);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  
//  video.loop();
//  video.play();
  video.start();
}

void draw() {
  scale(2);
  image(video, 0, 0);  
  opencv.loadImage(video);
  
  opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

void movieEvent(Movie m) {
  m.read();
}
