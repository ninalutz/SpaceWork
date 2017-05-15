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

Test[] instances =  new Test[1]; 

void setup() {
  size(displayWidth-50, displayHeight-100);

  float xc = width / 4.0;
  float yc = height / 3.0;
  wheel = new ColorWheel(xc, yc, kCircleRadius, kNumRectangles, kRectWidth, kRectLength);
//    wheel.draw();
  smooth();
  
//  wheelDraw = createGraphics();
//  wheel.draw(wheelDraw);
  instances[0] = new Test(20, 20, 40, 20);
}



color barColor;
void draw() {
  colorMode(RGB);
  noStroke();
  background(100);
  
  float xc = width / 4.0;
  float yc = height / 3.0;
  //image(wheelDraw, 0, 0);
 wheel.draw();
  fill(0);
  
  pushStyle();
  // Change the hue of the center area depending on mouse position
  if ( wheel.isMouseInRectangle() ) {
    float mouseAngle = wheel.getMouseAngle();
    hue = map(mouseAngle, 0.0, TWO_PI, 0.0, 360.0);

    colorMode(HSB, 360, 255, 255);
    barColor = color(hue, 255, 255);
//    brightness = brightness(barColor);
    centerColor = color(hue, 255, 255);
  }
  
  // Draw the central filled circle
  fill(barColor);
  float ellipseDiameter = kCircleRadius;
  ellipse(xc, yc, ellipseDiameter, ellipseDiameter);

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
  
    for (Test t:instances)
    t.run();

}


