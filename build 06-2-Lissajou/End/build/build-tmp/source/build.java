import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {

float x;
float y;

float tx, ty;

public void setup() {
  
  background(250);
  
  x = width/2;
  y = width/2;
}

public void draw() {
 
  // Lissajou figures

  for (int i = 0; i < 1000; ++i) {
      tx = map(sin(frameCount * 0.05f + (i * 0.02f)), -1, 1, 0, width);
      ty = map(cos(frameCount * 0.003f + (i * 0.01f)), -1, 1, 0, width);

      float size = map(noise(frameCount * 0.002f, i * 0.02f), 0, 1, 5, 100);

      pushMatrix();
      translate(tx, ty);
      rotate(mouseX);
      rectMode(CENTER);
      noStroke();
      fill(255, 0, abs(255 * noise(frameCount * 0.1f + (i * 0.1f))));
      ellipse(0, 0, size, size);
      popMatrix(); 
  }

}
  public void settings() {  size(500, 500, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
