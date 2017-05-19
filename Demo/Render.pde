void renderTable(){
  
  offscreen.beginDraw();
  pushMatrix();
  offscreen.scale(-1, -1);  
  offscreen.background(barColorC, 150);
  offscreen.noStroke();
  drawCanvas(offscreen);
//  startFreeFlow.DrawTest(offscreen);
  if(Strokes.size() > 1 && abs(Strokes.get(Strokes.size()-1).time - millis()) < 2){     
   offscreen.fill(#00ff00, 50);
   noStroke();
   offscreen.ellipse(Strokes.get(Strokes.size()-1).loc.x + 5, Strokes.get(Strokes.size()-1).loc.y, 10, 10);
 }
  popMatrix();
  offscreen.noFill();
  mainGUI();
  offscreen.endDraw();
  surface.render(offscreen);
//   mainGUI();
//  illustration.beginDraw();
//  drawCanvas(illustration);
//  illustration.endDraw();
}
  
