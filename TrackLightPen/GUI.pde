
final static float kCircleRadius = 50.0;
final static int   kNumRectangles = 300;
final static float kRectLength = 100.0;
final static float kRectWidth = (TWO_PI * kCircleRadius / (float)kNumRectangles) - 5;
final static int   kLabelSize = 28;


ColorWheel wheel, wheelC;
color centerColor = color(255, 0, 0);
float hue = 0.0;   // 0 - 360
float strokeSize = 2;

Button button, buttonC, eraser, penButton, canvasButton, emailButton, startPageSession, startFreeFlow, exitSession;

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
     
  startPageSession = new Button(width/2 + 50, height/2, 200, 30, "Start Paged Session", 150);
  startFreeFlow = new Button(width/2 -200, height/2, 200, 30, "Start Doodle Session", 150);
  
  exitSession = new Button(width -200, 40, 70, 30, "Exit", 150);
}


void mainGUI(){
exitSession.Draw();
 if(exitSession.MouseIsOver()){
   notStarted = true;
 }
  
if(notStarted){
 startPageSession.Draw();
 startPageSession.MouseIsOver();
 startFreeFlow.Draw();
 startFreeFlow.MouseIsOver();
}
  
  if(!notStarted){
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
}
