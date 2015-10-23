function Bubble(x, y) {
  this.x = x;
  this.y = y;
  this.r = 10;
  this.col = color(200, 80, 80);
  
  
  // this.changeColor = function() {
  //   this.col = color(200, 0 , 200)
  // }
  


  this.intersects = function(other) {
    var d = dist(this.x, this.y, other.x, other.y); 
      if (d < this.r + other.r) {
        return true;
      } else {
        return false;
      }
    }
    
  this.grow = function(other) {
    this.r = this.r + other;
    }

  this.display = function() {
    noFill();
    
    noStroke();
    var face = ellipse(this.x, this.y, this.r *2, this.r *2);
    fill(255);
    var eyeL = ellipse(this.x - this.r/2, this.y , this.r/2 , this.r/3 );
    var eyer = ellipse(this.x + this.r/2, this.y , this.r/2 , this.r/3 );
    fill(0);
    var pupL= ellipse(this.x - this.r/2, this.y , this.r/3 , this.r/3 );
    var pupR= ellipse(this.x + this.r/2, this.y , this.r/3 , this.r/3 );
    

    // fill(0);
    // var pupL = ellipse(eyeL.x, eyeL.y, this.r/2, this.r/3);

    //   var dude{
    // face: fill(this.col), ellipse(this.x, this.y, this.r *2, this.r *2);
    // eyeL: fill(255), ellipse(this.x - r, this.y , this.r*2 - r, this.r*2 -r);
    // }
  }
  


  this.move = function() {
    this.x = this.x + random(-7, 7);
    this.y = this.y + random(-7, 7);
  }



}