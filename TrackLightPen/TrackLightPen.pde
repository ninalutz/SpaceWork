import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 
import deadpixel.keystone.*;

float weight = 1.5;

color lineCol;
float redVal, greenVal, blueVal;

Keystone ks;
CornerPinSurface surface;
PGraphics offscreen, canvas;

int capwidth, capheight;
void setup() {
  size(displayWidth, displayHeight, P3D);
  initGUI();
  video = new Capture(this, 800, 600);
  
  
  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(800, 600, 20);
  
  video.start();
  
trackColor = color(255);
  offscreen = createGraphics(800, 600, P3D);
// colorMode(RGB);
// redVal = 255;
// blueVal = 255;
// greenVal = 255;


}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
  
}

ArrayList<PVector> Things = new ArrayList<PVector>();
ArrayList<Stroke>Strokes = new ArrayList<Stroke>();

void draw() {
//  background(barColorC);
  video.loadPixels();
  background(barColorC);
  
  offscreen.beginDraw();
  pushMatrix();
  offscreen.scale(-1, -1);
  offscreen.image(video, -video.width, -video.height);
  offscreen.background(barColorC, 150);
  offscreen.noStroke();
 // offscreen.ellipse(-50, -70, 70, 70);
 if(Strokes.size() > 1){
 offscreen.ellipse(Strokes.get(Strokes.size()-1).loc.x + 5, Strokes.get(Strokes.size()-1).loc.y, 5, 5);
 }
  drawCanvas(offscreen);
//  offscreen.fill(0, 255, 0);
//  offscreen.ellipse(-800, -10, 50, 50);
//  offscreen.fill(255, 255, 0);
//  offscreen.ellipse(0, -10, 50, 50);
//  offscreen.fill(255, 0, 0);
//  offscreen.ellipse(0, -600, 50, 50);
  popMatrix();
//  offscreen.fill(255, 0, 0);
  offscreen.noFill();
  offscreen.endDraw();
  drawCanvas(offscreen);
  surface.render(offscreen);
  mainGUI();
}


void drawCanvas(PGraphics p){
  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 200) { 
    // Draw a circle at the tracked pixel
    p.fill(0, 255, 0, 50);
    Strokes.add(new Stroke(new PVector(closestX-800, closestY-600), millis(), barColor, strokeSize)); 
  }
  
   for(int i = 0; i<Strokes.size()-1; i++){
     if( abs(Strokes.get(i).time - Strokes.get(i+1).time) < 100){
        p.stroke(Strokes.get(i).line);
        p.strokeWeight(Strokes.get(i).thickness);
        p.line(Strokes.get(i).loc.x, Strokes.get(i).loc.y, Strokes.get(i+1).loc.x, Strokes.get(i+1).loc.y);
      }
    }

  surface.render(offscreen);

}


