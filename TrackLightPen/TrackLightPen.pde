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
  video.loadPixels();
  background(barColorC);
  
  renderTable();
 // pushMatrix();
//  translate(-1, -1);
  mainGUI(offscreen);
//  popMatrix();
  
  println(click);
}

int click = 0;
void drawCanvas(PGraphics p){
   colorID(p);
  
   for(int i = 0; i<Strokes.size()-1; i++){
     if( abs(Strokes.get(i).time - Strokes.get(i+1).time) < 100){
        p.stroke(Strokes.get(i).line);
        p.strokeWeight(Strokes.get(i).thickness);
        p.line(Strokes.get(i).loc.x, Strokes.get(i).loc.y, Strokes.get(i+1).loc.x, Strokes.get(i+1).loc.y);
      }
      
      PVector dist = PVector.sub(Strokes.get(i).loc,Strokes.get(i+1).loc);

     if( abs(Strokes.get(i).time - Strokes.get(i+1).time) == 4 && abs(dist.mag()) < 2){
        click ++;
      }
      
      if( abs(Strokes.get(i).time - Strokes.get(i+1).time) > 4 && abs(dist.mag()) > 2){
        click = 0;
      }
      
      if(click > 20){
        println("YASSS");
        click = 0;
      }
      
    }

  surface.render(offscreen);

}


