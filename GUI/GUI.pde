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

boolean penMenu, Menu, canvasMenu;
color barColor;
PVector origin;
float xc, yc;

Slider slider;
PImage eraserIcon, mailIcon;

void setup() {
   size(displayWidth-50, displayHeight-100);
   eraserIcon = loadImage("eraser.png");
   mailIcon = loadImage("mail.png");
}


void draw() {
  noStroke();
  background(100);
  
  if(mousePressed){
    start++;
    if(start > 60 && !Menu && !penMenu && !canvasMenu){
      Menu = true;
      origin = new PVector(mouseX, mouseY);
      penButton = new Button(origin.x + 5, origin.y, 50,30, "Pen", 150);
      canvasButton = new Button(origin.x +5, origin.y + 40, 60, 30, "Canvas", 150);
      //        eraser = new Button(int(xc) + 150, yc - 150, 40, 40, eraserIcon);
      emailButton = new Button(origin.x + 5, origin.y + 80, 60, 40, mailIcon);
    }
  }
  
  if(Menu){
    penButton.Draw();
    canvasButton.Draw();
    emailButton.DrawImage();
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


