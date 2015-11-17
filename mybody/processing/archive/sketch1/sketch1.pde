import processing.video.*;
Capture cam;

void setup(){
  size(1300, 700);
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



void draw(){
  background(#F4273B);
  int eyeSize= 50;
int eyeLoc = 200;
float x1 = map(mouseX +330, 0, width, eyeLoc-25, eyeLoc+10);
float x2 = map(mouseX +330, 0, width, eyeLoc-25, eyeLoc+10);


  //floor
  noStroke();
  fill(#A51E2B);
  rect(0, height-200, width, height);
  
  //eyes
  fill(#ffffff);
  stroke(0);
  strokeWeight(8);
  ellipse(eyeLoc, eyeLoc +100, eyeSize, eyeSize/2); //left eye
  ellipse(eyeLoc + 100, eyeLoc +100, eyeSize, eyeSize/2); //right eye
  
  fill(0);
  noStroke();
  ellipse(x1, eyeLoc +105, eyeSize/2.5, eyeSize/2.5); //left pupil
  ellipse(x2 + 100, eyeLoc +105, eyeSize/2.5, eyeSize/2.5); //right pupil
  
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, mouseX, 500, 100,60);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);

  
  //map eyeSize width to mouseX 0 width
  
  
  
  
}
