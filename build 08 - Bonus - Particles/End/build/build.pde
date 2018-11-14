// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ParticleSystem ps;

void setup() {
  size(640,360);
  ps = new ParticleSystem();
}

void draw() {
  background(255);
  ps.addParticle(mouseX, mouseY);
  ps.run();
}
