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

Button button, eraser, penButton, canvasButton, emailButton;

//Slider[] instances =  new Slider[1]; 

Slider slider;
PImage eraserIcon;

void setup() {
  size(displayWidth-50, displayHeight-100);
    eraserIcon = loadImage("eraser.png");
//  button = new Button(width/2, height/2, 100, 30, "HELLO", 16); //  Button(float xpos, float ypos, float widthB,  float heightB, String labelB) {
 
}


boolean penMenu, Menu, canvasMenu;
color barColor;
PVector origin;
float xc, yc;
void draw() {
  noStroke();
  background(100);
  
  if(mousePressed){
    start++;
    if(start > 50 && !Menu && !penMenu && !canvasMenu){
      Menu = true;
      origin = new PVector(mouseX, mouseY);
      penButton = new Button(origin.x + 5, origin.y, 50,30, "Pen", 150);
      canvasButton = new Button(origin.x +5, origin.y + 40, 60, 30, "Canvas", 150);
      emailButton = new Button(origin.x + 5, origin.y + 80, 60, 30, "Email", 150);
    }
  }
  
  if(Menu){
    penButton.Draw();
    canvasButton.Draw();
    emailButton.Draw();
    penButton.MouseIsOver();
    emailButton.MouseIsOver();
    canvasButton.MouseIsOver();
  }

if(penMenu){
  pushMatrix();
  stroke(0);
  noFill();
  rect(origin.x - 225, origin.y - 250, 450, 500, 20, 20, 20, 20);
  popMatrix();
  
  button.MouseIsOver();
  button.Draw();
  
  eraser.MouseIsOver();
  eraser.DrawImage();
  
  drawPenMenu();
}
  
}


