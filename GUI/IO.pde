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
    Menu = false;
  }
  
 if(emailButton.MouseIsOver()){
    Menu = false;
  }
  
  }
  
  if(penMenu){
  if (slider.isOver()){
      slider.lock = true;
  }
    if (button.MouseIsOver()) {
    penMenu = false;
  }
  
//  if(penButton.MouseIsOver()){
//       penMenu = true;
//        start = 0;
//         origin = new PVector(mouseX, mouseY);
//        xc = origin.x;
//        yc = origin.y;
//        wheel = new ColorWheel(xc, yc, kCircleRadius, kNumRectangles, kRectWidth, kRectLength);
//        slider = new Slider(int(xc)-kRectLength, yc-180, 20, 10, 200);
//        button = new Button (xc + 180, yc - 240, 30, 30, "X", #ff0000);
//        eraser = new Button(int(xc) + 150, yc - 150, 40, 40, eraserIcon);
//  }
  
    if (eraser.MouseIsOver()) {
    println("Clicked: ");
    barColor = 100;
  }

  }


}
 
void mouseReleased() {
  if(penMenu){
  //unlock
  slider.lock = false;
  }

}
