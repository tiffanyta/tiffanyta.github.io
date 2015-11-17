import processing.video.*;
Capture cam;
PImage img;
PImage backgroundImage;
float threshold = 70;

void setup() {
  size(1300, 700);
  String[] cameras = Capture.list();


  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }}

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
    backgroundImage = createImage(cam.width, cam.height, RGB);
  }  
  void captureEvent(Capture cam) {
    // Read image from the camera
    cam.read();
  }


  //println(mouseX);



  void draw() {
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


    loadPixels();
    cam.loadPixels(); 
    backgroundImage.loadPixels();

    if (cam.available() == true) {
      cam.read();
    }
    image(cam, mouseX, 500, 100, 60);
    // The following does the same, and is faster when just drawing the image
    // without any additional resizing, transformations, or tint.
    //set(0, 0, cam);
    // Begin loop to walk through every pixel
    for (int x = 0; x < cam.width; x ++ ) {
      for (int y = 0; y < cam.height; y ++ ) {
        int loc = x + y*cam.width; // Step 1, what is the 1D pixel location
        color fgColor = cam.pixels[loc]; // Step 2, what is the foreground color

        // Step 3, what is the background color
        color bgColor = backgroundImage.pixels[loc];

        // Step 4, compare the foreground and background color
        float r1 = red(fgColor);
        float g1 = green(fgColor);
        float b1 = blue(fgColor);
        float r2 = red(bgColor);
        float g2 = green(bgColor);
        float b2 = blue(bgColor);
        float diff = dist(r1, g1, b1, r2, g2, b2);

        // Step 5, Is the foreground color different from the background color
        if (diff > threshold) {
          // If so, display the foreground color
          pixels[loc] = fgColor;
        } else {
          // If not, display green
          pixels[loc] = color(165, 30, 43); // We could choose to replace the background pixels with something other than the color green!
        }
      }
    }
    updatePixels();
  }
  void mousePressed() {
    // Copying the current frame of video into the backgroundImage object
    // Note copy takes 5 arguments:
    // The source image
    // x, y, width, and height of region to be copied from the source
    // x, y, width, and height of copy destination
    backgroundImage.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height);
    backgroundImage.updatePixels();
  }

