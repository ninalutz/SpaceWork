/**
 * Draw a circular array of colored rectangles, displaying the full range
 * of hues.
 *
 */

final static float kCircleRadius = 50.0;
final static int   kNumRectangles = 300;
final static float kRectLength = 100.0;
final static float kRectWidth = (TWO_PI * kCircleRadius / (float)kNumRectangles) - 5;
final static int   kLabelSize = 28;


ColorWheel wheel;
color centerColor = color(255, 0, 0);
float hue = 0.0;   // 0 - 360

PGraphics wheelDraw;

float strokeSize = 2;

Button button, eraser;

//Slider[] instances =  new Slider[1]; 

Slider slider;
PImage eraserIcon;

void setup() {
  size(displayWidth-50, displayHeight-100);
    eraserIcon = loadImage("eraser.png");
//  button = new Button(width/2, height/2, 100, 30, "HELLO", 16); //  Button(float xpos, float ypos, float widthB,  float heightB, String labelB) {
 
}


boolean penMenu;
color barColor;
PVector origin;
float xc, yc;
void draw() {
  noStroke();
  background(100);
  
  if(mousePressed){
    start++;
    if(start > 50 && !penMenu){
     penMenu = true;
      start = 0;
       origin = new PVector(mouseX, mouseY);
        xc = origin.x;
        yc = origin.y;
        wheel = new ColorWheel(xc, yc, kCircleRadius, kNumRectangles, kRectWidth, kRectLength);
        slider = new Slider(int(xc)-kRectLength, yc-180, 20, 10, 200);
        button = new Button (xc + 180, yc - 240, 30, 30, "X", #ff0000);
        eraser = new Button(int(xc) + 150, yc - 150, 40, 40, eraserIcon);
    }
  }

if(penMenu){

  pushMatrix();
  stroke(0);
  noFill();
//  rectMode(CENTER);
  rect(origin.x - 225, origin.y - 250, 450, 500, 20, 20, 20, 20);
//rectMode(LEFT); 
  popMatrix();
  
  
  button.MouseIsOver();
  button.Draw();
  
  eraser.MouseIsOver();
  eraser.DrawImage();

  
  drawPenMenu();
}
  
}

