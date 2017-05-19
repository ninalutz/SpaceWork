import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 
import deadpixel.keystone.*;

PVector Selector;
float weight = 1.5;

color lineCol;
float redVal, greenVal, blueVal;

Keystone ks;
CornerPinSurface surface;
PGraphics offscreen, canvas;

ArrayList<Button>buttons = new ArrayList<Button>();

String email = "ninalutz2015@gmail.com";

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
  
    try {
     robot = new Robot();
  } 
    catch (Exception e) {
    println("Can't Initialize the Robot");
  }
  
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
//  mainGUI();
//  Clicked();
}

int click = 0;
void drawCanvas(PGraphics p) {

  colorID(p);


  for (int i = 0; i<Strokes.size ()-1; i++) {
        PVector dist = PVector.sub(Strokes.get(i).loc, Strokes.get(i+1).loc);
        float timebetween = abs(Strokes.get(i).time - Strokes.get(i+1).time);
          
          if(dist.mag() < 0){
          Strokes.remove(i);
        }
        
    if ( abs(timebetween) < 200) {
      p.stroke(Strokes.get(i).line);
      p.strokeWeight(Strokes.get(i).thickness);
      if (!notStarted) {
         p.line(Strokes.get(i).loc.x, Strokes.get(i).loc.y, Strokes.get(i+1).loc.x, Strokes.get(i+1).loc.y);
      }
      
    }

   dist = PVector.sub(Strokes.get(i).loc, Strokes.get(i+1).loc);
  
//  println(click);
    if (dist.mag() < .5) {
      click ++;

    }

    if ( dist.mag() > Strokes.get(i).thickness) {
      click = 0;
    }

    if (click == 20) {
      Clicks.add(new Click(Strokes.get(i).loc, Strokes.get(i).time));
      click = 0;
      Clicked();
      Clicks.clear();
    }
  }
  surface.render(offscreen);
}

