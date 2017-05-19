
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
  startFreeFlow = new Button(width/3 - 25, height/3, 200, 40, "Start Session", 150);
  exitSession = new Button(400, 100, 100, 40, "Exit", 150);
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

if(!notStarted){
  
  if(mousePressed){
    start++;
    if(start > 60 && !Menu && !penMenu && !canvasMenu){
      Menu = true;
      origin = new PVector(mouseX, mouseY);
      penButton = new Button(origin.x + 5, origin.y, 50,30, "Pen", 200);
      canvasButton = new Button(origin.x +5, origin.y + 40, 60, 30, "Canvas", 200);
      emailButton = new Button(origin.x + 5, origin.y + 80, 60, 40, mailIcon);
    }
  }
//  
  if(Menu){
    penButton.Draw();
    canvasButton.Draw();
    emailButton.DrawImage();
    penButton.MouseIsOver();
    emailButton.MouseIsOver();
    canvasButton.MouseIsOver();
  }
}
//
//if(Menu){
//    penButton.DrawTest(offscreen);
//    canvasButton.DrawTest(offscreen);
//    emailButton.DrawTestImage(offscreen);
//    penButton.MouseIsOver();
//    emailButton.MouseIsOver();
//    canvasButton.MouseIsOver();
//  }
  
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
