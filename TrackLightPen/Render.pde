void renderTable(){
  offscreen.beginDraw();
  pushMatrix();
  offscreen.scale(-1, -1);
  offscreen.image(video, -video.width, -video.height);
  offscreen.background(barColorC, 150);
  offscreen.noStroke();
 if(Strokes.size() > 1){
 offscreen.ellipse(Strokes.get(Strokes.size()-1).loc.x + 5, Strokes.get(Strokes.size()-1).loc.y, 5, 5);
 }
  drawCanvas(offscreen);
//  mainGUI(offscreen);
  popMatrix();
  offscreen.noFill();
  offscreen.endDraw();
  mainGUI();
  drawCanvas(offscreen);
  surface.render(offscreen);
}
