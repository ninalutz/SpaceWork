import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
boolean showvideo = false;
 PGraphics p;
void setup() {
  size(800, 400);
  video = new Capture(this, 800, 400);
  opencv = new OpenCV(this,  800, 400);
 // opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  
   p  = createGraphics(width, height);
}


ArrayList<PVector> Things = new ArrayList<PVector>();
void draw() {
  scale(1);
  opencv.loadImage(video);
  background(255);

  noFill();
  stroke(255, 0, 255);
  strokeWeight(3);
  
  PVector loc = opencv.max();
  
  int count = 0;
  p.beginDraw();
    if(millis() > 10000){
      Things.add(loc);
    for(int i = 0; i<Things.size()-1; i++){
        PVector dist = PVector.sub(Things.get(i),Things.get(i+1));
        if( abs(dist.mag()) < 45){
          p.stroke(0, 255, 0);
            p.line(Things.get(i).x, Things.get(i).y, Things.get(i+1).x, Things.get(i+1).y);
        }

  }
  
  if(showvideo){
  image(video, 0, 0 );
  }
  
  p.endDraw();
  pushMatrix();
  scale(-1.0, 1.0);
  image(p,-p.width,0);
  popMatrix();

 
}

 noFill();
 fill(0);
 text("Press space to resest, p to see video feed", 50, 50);
 //rect(80, 0, width, 300);

}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed(){
  if(key == ' '){
  p.clear();
  Things.clear();  
}
  if(key == 'p'){
    showvideo = !showvideo;
  }
}
