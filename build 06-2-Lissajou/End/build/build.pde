// Build 06 - Animation - Lissajou

float x;
float y;

void setup(){
  // I run once
  println("Run once");
  
  size(500, 500);
  background(0);


}

void draw(){
  // I run continuously
  println("Run again and again");

  if(mousePressed) sinBrush();
}


void sinBrush(){
    int numCircles = 500;

  for (int i = 0; i < numCircles; i++) {
    x = map(sin(frameCount * 0.03 + (i * map(mouseX, 0, width, 0.001, 0.3))), -1, 1, 0, width);
    y = map(sin(frameCount * 0.04 + (i * 0.02)), -1, 1, 0, height);

    float size = map(i, 0, numCircles, 0, 100);
    float blue = map(sin(frameCount * 0.03 + (i * 0.1)), -1, 1, 0, 255);
    float green = map(sin(frameCount * 0.04 + (i * 0.1)), -1, 1, 0, 255);

    pushMatrix();
    noStroke();
    fill(255, green, blue);
    ellipse(x, y, size, size);
    popMatrix();

  }
}