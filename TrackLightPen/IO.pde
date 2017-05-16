int colorinc = 5;
float start;

void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  
  case ' ':
    Things.clear();
    break; 
    
  case '+':
    weight += 1;
    break;

  case '-':
    weight -= 1;
    break;
    
  case 'r':
    redVal -= 5;
    break;
    
   case 'R':
    redVal += 5;
    break;
  
  case 'G':
    greenVal += 5;
    break;
    
  case 'g':
    greenVal -= 5;
    break;  
    
  case 'b':
    blueVal -= 5;
    break;  
 
  case 'B':
    blueVal += 5;
    break; 
    
  case 'e':
    saveFrame("drawing.pdf");
    break;
    
  }
}


void mousePressed() {
  
  if (startPageSession.MouseIsOver()){
    notStarted = false;
  }
  
    
  if (startFreeFlow.MouseIsOver()){
    notStarted = false;
  }
  
  if(Menu){
  if(penButton.MouseIsOver()){
       penMenu = true;
        start = 0;
         origin = new PVector(mouseX, mouseY);
        xc = origin.x;
        yc = origin.y;
        wheel = new ColorWheel(xc, yc, kCircleRadius, kNumRectangles, kRectWidth, kRectLength);
        slider = new Slider(int(xc)-kRectLength, yc-180, 20, 10, 200);
        button = new Button (xc + 180, yc - 240, 30, 30, "X", #ff0000);
        eraser = new Button(int(xc) + 150, yc - 150, 40, 40, eraserIcon);
        Menu = false;
  }
  if(canvasButton.MouseIsOver()){
    canvasMenu = true;
    start = 0;
     origin = new PVector(mouseX, mouseY);
    xc = origin.x;
    yc = origin.y;
    wheelC = new ColorWheel(xc, yc, kCircleRadius, kNumRectangles, kRectWidth, kRectLength);
    sliderC = new Slider(int(xc)-kRectLength, yc-180, 20, 10, 200);
    buttonC = new Button (xc + 180, yc - 240, 30, 30, "X", #ff0000);
    Menu = false;
  }
  
 if(emailButton.MouseIsOver()){
    Menu = false;
    start = 0;
    println("MAIL");
  }
  
  }
  
  if(penMenu){
  if (slider.isOver()){
      slider.lock = true;
  }
    if (button.MouseIsOver()) {
    penMenu = false;
  }
  
  
    if (eraser.MouseIsOver()) {
    println("Clicked: ");
    barColor = barColorC;
  }

  }
  
    if(canvasMenu){
  if (sliderC.isOver()){
      sliderC.lock = true;
  }
  
  if (buttonC.MouseIsOver()) {
    canvasMenu = false;
  }
 

  }


}
 
void mouseReleased() {
  if(penMenu){
  //unlock
  slider.lock = false;
  }
  
    if(canvasMenu){
  //unlock
  sliderC.lock = false;
  }

}
