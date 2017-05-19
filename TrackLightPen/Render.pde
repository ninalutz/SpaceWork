void renderTable(){
  offscreen.beginDraw();
  pushMatrix();
  offscreen.scale(-1, -1);  
  offscreen.background(barColorC, 150);
  offscreen.noStroke();
  drawCanvas(offscreen);
//  startFreeFlow.DrawTest(offscreen);
  if(Strokes.size() > 1){     
   offscreen.fill(#00ff00);
   offscreen.ellipse(-Strokes.get(Strokes.size()-1).loc.x + 5, -Strokes.get(Strokes.size()-1).loc.y, 10, 10);
 }
  popMatrix();
  offscreen.noFill();
  mainGUI();
  offscreen.endDraw();
  surface.render(offscreen);
}
  
