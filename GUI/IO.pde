float start;

void mousePressed() {
  
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
