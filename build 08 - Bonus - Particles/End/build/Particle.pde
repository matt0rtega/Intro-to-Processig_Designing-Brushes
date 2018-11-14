// The Nature of Code
// Daniel Shiffman t
// http://natureofcode.com

// Simple Particle System

class Particle {
  float x, y;
  float dirx = random(-1, 1);
  float diry = random(-1, 1);
  float lifespan;

  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    x += dirx;
    y += diry;
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(127,lifespan);
    ellipse(x, y,12,12);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
