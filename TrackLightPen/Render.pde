void renderTable(){
  offscreen.beginDraw();
  pushMatrix();
  offscreen.scale(-1, -1);  
  offscreen.background(barColorC, 150);
  offscreen.noStroke();
   if(Strokes.size() > 1){     
     offscreen.ellipse(Strokes.get(Strokes.size()-1).loc.x + 5, Strokes.get(Strokes.size()-1).loc.y, 10, 10);
   }
//   offscreen.ellipse(width/2, height/2, 50, 50);
//   fill(0);
  drawCanvas(offscreen);
  startFreeFlow.DrawTest(offscreen);
//  offscreen.ellipse(-100, -100, 50, 50);
  popMatrix();
  offscreen.noFill();
//  startFreeFlow.DrawTest(offscreen);
  offscreen.endDraw();
//  drawCanvas(offscreen);
  surface.render(offscreen);
}
  
