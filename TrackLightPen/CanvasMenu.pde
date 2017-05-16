float ProjBright;
color barColorC = color(100);

void drawCanvasMenu(){
  wheelC.draw();
  fill(0);
  
  pushStyle();
  // Change the hue of the center area depending on mouse position
  if ( wheelC.isMouseInRectangle() ) {
    float mouseAngle = wheelC.getMouseAngle();
    hue = map(mouseAngle, 0.0, TWO_PI, 0.0, 360.0);

    colorMode(HSB, 360, 255, 255);
    barColorC = color(hue, 255, 255);
    centerColor = color(hue, 255, 255);
  }
  
  popStyle();

  colorMode(RGB);
  LightBar lightBar = new LightBar(int(xc - 100), int(yc + 170), 100, 50, color(centerColor), color(0, 0, 0), color(255, 255, 255));
  lightBar.drawGradient();

  if(lightBar.isOver()){
     barColorC = get(mouseX, mouseY);

  }

  
  sliderC.run();
  
  ProjBright = (100-sliderC.value)/100 * 50;

}
