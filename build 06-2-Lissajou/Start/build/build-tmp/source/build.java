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

public void setup(){
  // I run once
  println("Run once");
  
  
  background(0);


}

public void draw(){
  // I run continuously
  println("Run again and again");

  if(mousePressed) sinBrush();
}


public void sinBrush(){
    int numCircles = 500;

  for (int i = 0; i < numCircles; i++) {
    x = map(sin(frameCount * 0.03f + (i * map(mouseX, 0, width, 0.001f, 0.3f))), -1, 1, 0, width);
    y = map(sin(frameCount * 0.04f + (i * 0.02f)), -1, 1, 0, height);

    float size = map(i, 0, numCircles, 0, 100);
    float blue = map(sin(frameCount * 0.03f + (i * 0.1f)), -1, 1, 0, 255);
    float green = map(sin(frameCount * 0.04f + (i * 0.1f)), -1, 1, 0, 255);

    pushMatrix();
    noStroke();
    fill(255, green, blue);
    ellipse(x, y, size, size);
    popMatrix();

  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
