void drawPenMenu(){

//float xc = width / 4.0;
//  float yc = height / 3.0;

  wheel.draw();
  fill(0);
  
  pushStyle();
  // Change the hue of the center area depending on mouse position
  if ( wheel.isMouseInRectangle() ) {
    float mouseAngle = wheel.getMouseAngle();
    hue = map(mouseAngle, 0.0, TWO_PI, 0.0, 360.0);

    colorMode(HSB, 360, 255, 255);
    barColor = color(hue, 255, 255);
    centerColor = color(hue, 255, 255);
  }
  
  // Draw the central filled circle
  fill(barColor);
  ellipse(xc, yc, strokeSize, strokeSize);

  popStyle();

  colorMode(RGB);
  LightBar lightBar = new LightBar(int(xc - 100), int(yc + 170), 100, 50, color(centerColor), color(0, 0, 0), color(255, 255, 255));
  lightBar.drawGradient();

  if(lightBar.isOver()){
     barColor = get(mouseX, mouseY);
     fill(barColor);
  }

  fill(0);
  ellipse(mouseX, mouseY, 5, 5);
  
  slider.run();
  strokeSize = (100-slider.value)/100 * 50;
}
