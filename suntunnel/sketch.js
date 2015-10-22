var drops = [];
var r = 0;

function setup() {
  createCanvas(windowWidth,windowHeight);
  for (var i = 0 ; i<600 ; i++){
    drops[i]= new Drop(i * 5);
    
  }
}

function draw() {
  background(255,0,0);
  
  for(var i = 0; i<drops.length; i++){
    drops[i].display();
    drops[i].grow();
  }
  
}

function Drop(r){
  this.r = r;
  
  this.display= function(){
    noFill();
    stroke(255);
    ellipse(width/2, height, this.r, this.r);
    
    
  }
  
  this.grow = function(){
    this.r += 1;
  }
}