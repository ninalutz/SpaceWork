/**
 * Draw a circular array of colored rectangles, displaying the full range
 * of hues.
 *
 * Bruce Wilson, 4/26/2013
 */

final static float kCircleRadius = 150.0;

final static int   kNumRectangles = 600;
final static float kRectLength = 100.0;
final static float kRectWidth = (TWO_PI * kCircleRadius / (float)kNumRectangles) - 5;
// final static float kRectWidth = 40.0;  // fixed width

final static int   kLabelSize = 28;

ColorWheel wheel;
color centerColor = color(255, 0, 0);
float hue = 0.0;   // 0 - 360

void setup() {
  size(displayWidth-50, displayHeight-100);

  float xc = width / 4.0;
  float yc = height / 2.0;
  wheel = new ColorWheel(xc, yc, kCircleRadius, kNumRectangles, kRectWidth, kRectLength);

  smooth();
 // colorMode(HSB, 360, 100, 100);
//  wheel.draw();
}

float brightness = 100;

void draw() {
  colorMode(RGB);
  background(255);
  
  float xc = width / 4.0;
  float yc = height / 2.0;
  
  wheel.draw();

  ellipse(mouseX, mouseY, 5, 5);
  
  pushStyle();
  
  // Change the hue of the center area depending on mouse position
  if ( wheel.isMouseInRectangle() ) {
    float mouseAngle = wheel.getMouseAngle();
    hue = map(mouseAngle, 0.0, TWO_PI, 0.0, 360.0);
    colorMode(HSB, 360, 100, 100);
    centerColor = color(hue, 100, brightness);
  }
  
  // Draw the central filled circle
  fill(centerColor);
  float ellipseDiameter = kCircleRadius - 20.0;
  ellipse(xc, yc, ellipseDiameter, ellipseDiameter);
  //Need to draw a lightness bar here


  popStyle();
}


