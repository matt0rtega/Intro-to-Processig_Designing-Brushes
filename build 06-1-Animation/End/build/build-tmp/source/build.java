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

float prevx;
float prevy;
float linex;
float liney;

public void setup(){
  // I run once
  println("Run once");
  
  
  background(255);

  x=width/2;
  y=height/2;

  prevx = x;
  prevy = y;
}

public void draw(){

  prevx = linex;
  prevy = liney;

  //background(255);

  fill(255, 5);
  rect(0, 0, width, height);

  float offsetx = sin(frameCount * 0.1f) * 100;
  float offsety = cos(frameCount * 0.1f) * 100;
  //println(offsetx);

  // Circle Equation
  // x = sin(theta) * diameter;
  // y = cos(theta) * diameter;

  // Connected lines
  pushMatrix();
  translate(x + offsetx, y+offsety);
  ellipse(0, 0, 10, 10);
  popMatrix();

  float tx = map(mouseX, 0, width, 0.001f, 0.3f);
  float ty = map(mouseY, 0, width, 0.001f, 0.3f);

  //linex = map(sin(frameCount * tx), -1, 1, 0, width);

  // noise(x, y, z)
  // Returns the Perlin noise value at specified coordinates. Perlin noise is a random sequence generator producing a more natural, harmonic succession of numbers than that of the standard random() function. It was developed by Ken Perlin in the 1980s and has been used in graphical applications to generate procedural textures, shapes, terrains, and other seemingly organic forms.
  
  linex = map(sin(frameCount * tx), -1, 1, 0, height);
  liney = map(noise(frameCount * ty), 0, 1, 0, width);

  // No translation
  pushMatrix();
  line(prevx, prevy, linex, liney);
  popMatrix();

  //x= mouseX;
  //y = mouseY;
}


public void rectRotBrush(){

  pushMatrix();
  rectMode(CENTER);
  strokeWeight(random(1, 2));
  translate(x, y);
  rotate(random(TWO_PI));
  rect(0, 0, random(1, 15), random(1, 200));
  popMatrix();
  // I run continuously
  println("Run again and again");
  x+=15;
  y+=12;

  if(x > width+50){
    x = 0;
  }

  if(y > width+50){
    y = 0;
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
