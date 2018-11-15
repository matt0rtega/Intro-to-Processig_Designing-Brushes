// Build 07 - Challenge - Play and Draw

PImage img;

color[] palette = {#56121F, #73737D, #181A1A, #D47450, #E882E8, #E1489B, #325870, #916A7A, #9B9560, #5A6C5D, #77BCC6, #ACAC75, #CEA47F, #998059, #658F22, #010000, #29AABA, #258A83, #28A97F, #C1361A, #1F4A56, #8D7C2A, #AC458F, #252B2C, #B87C64};
color selectedColor;
int index = 0;

float x;
float y;

void setup(){
  size(500, 500);
  background(250);
  
  img = loadImage("texture.png");

  selectedColor = palette[index];
}

void draw(){

  selectedColor = palette[index % palette.length]; // Questions?

  if(mousePressed){
    stroke(selectedColor);
    strokeWeight(2);
    point(mouseX, mouseY);
      if(keyPressed){
      // Brush 1 - Line with Variable Weight
      if(key == '1') lineBrush();
      // Brush 2 - Line with Random Direction
      if(key == '2') randomLineBrush();
      // Brush 3 - Spray
      if(key == '3') sprayBrush();
      // Brush 4 - Image Brush
      if(key == '4') imageBrush();
      // Brush 5 - Image Brush
      if(key == '5') translateBrush();
      // Brush 6 - Sin Brush
      if(key == '6') sinBrush();
    }
  }

  colorPreview();
}

void colorPreview(){
  // Color preview and Tinting
  float size = 50;
  ellipseMode(CORNER);
  fill(selectedColor);
  noStroke();
  ellipse(16, height - size - 16, size, size);
}

void translateBrush(){
  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(PI/4);
  rect(0, 0, 15, 100);
  popMatrix();
}

void lineBrush(){
  float dist = dist(pmouseX, pmouseY, mouseX, mouseY);
  stroke(selectedColor);
  strokeWeight(dist);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void randomLineBrush(){
  float randx = random(-50, 50);
  float randy = random(-50, 50);

  float posx = mouseX + randx;
  float posy = mouseY + randy;

  stroke(selectedColor);
  line(pmouseX, pmouseY, posx, posy);
}

void sprayBrush(){
  float dist = dist(pmouseX, pmouseY, mouseX, mouseY);

  fill(selectedColor);
  for (int i = 0; i < 50; i++) {

          // Needed for square shape
          float rangex = random(dist);
          float rangey = random(dist);

          float randx = random(-rangex, rangex);
          float randy = random(-rangey, rangey);
          
          ellipse(mouseX + randx, mouseY + randy, 2, 2);
        }
}

void imageBrush(){
    tint(selectedColor);
    imageMode(CENTER);
    image(img, mouseX, mouseY, 100, 100);
    print("Image brush");
}

void sinBrush(){
  int numCircles = 100;

  for (int i = 0; i < numCircles; i++) {
    x = map(sin(frameCount * 0.03 + (i * map(mouseX, 0, width, 0.001, 0.3))), -1, 1, 0, width);
    y = map(sin(frameCount * 0.04 + (i * 0.02)), -1, 1, 0, height);

    float size = map(i, 0, numCircles, 0, 50);
    float blue = map(sin(frameCount * 0.03 + (i * 0.1)), -1, 1, 0, 255);
    float green = map(sin(frameCount * 0.04 + (i * 0.1)), -1, 1, 0, 255);

    pushMatrix();
    noStroke();
    fill(255, green, blue);
    ellipse(x, y, size, size);
    popMatrix();

  }
}

void mousePressed(){
  println("Mousepressed once");
}

void keyPressed(){
  println("Keypressed once");

  if(key == 'c') index += 1;

  if(key == 's'){
        saveFrame("brooklynBrushes###.png");
        print("Saved.");
      }
}
