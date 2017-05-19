
final static float kCircleRadius = 50.0;
final static int   kNumRectangles = 300;
final static float kRectLength = 100.0;
final static float kRectWidth = (TWO_PI * kCircleRadius / (float)kNumRectangles) - 5;
final static int   kLabelSize = 28;


ColorWheel wheel, wheelC;
color centerColor = color(255, 0, 0);
float hue = 0.0;   // 0 - 360
float strokeSize = 2;

Button button, buttonC, eraser, penButton, canvasButton, emailButton, startFreeFlow, exitSession;

boolean penMenu, Menu, canvasMenu;
boolean notStarted = true;
color barColor;
PVector origin;
float xc, yc;

Slider slider, sliderC;

PImage eraserIcon, mailIcon;

void initGUI(){
   eraserIcon = loadImage("eraser.png");
   mailIcon = loadImage("mail.png");
   println(width/4 - 25, height/4);
  startFreeFlow = new Button(width/4 - 25, height/4, 200, 30, "Start Session", 150);
  exitSession = new Button(300, height/4, 70, 30, "Exit", 150);
}


void mainGUI(){

if(notStarted){
 startFreeFlow.DrawTest(offscreen);
 startFreeFlow.MouseIsOver();
}

else{
  exitSession.DrawTest(offscreen);
  exitSession.MouseIsOver();
}

if(Menu){
    penButton.DrawTest(offscreen);
    canvasButton.DrawTest(offscreen);
    emailButton.DrawTestImage(offscreen);
    penButton.MouseIsOver();
    emailButton.MouseIsOver();
    canvasButton.MouseIsOver();
  }
  
  if(!notStarted){
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

if(canvasMenu){
  pushMatrix();
  stroke(0);
  noFill();
  rect(origin.x - 225, origin.y - 250, 450, 500, 20, 20, 20, 20);
  popMatrix();
  
  buttonC.MouseIsOver();
  buttonC.Draw();
  
  drawCanvasMenu();
}
 
} 
  fill(barColor);
  noStroke();
  ellipse(mouseX, mouseY, 10, 10);
//  exitSession.DrawTest(offscreen);
}
