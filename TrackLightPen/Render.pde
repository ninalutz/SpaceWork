void renderTable(){
  offscreen.beginDraw();
  pushMatrix();
  offscreen.scale(-1, -1);  
// offscreen.image(video, 0, 0);
  offscreen.background(barColorC, 150);
  //offscreen.image(video, -video.width, -video.height);
  offscreen.noStroke();
   if(Strokes.size() > 1){     
//     println("HIIII");
     offscreen.ellipse(Strokes.get(Strokes.size()-1).loc.x + 5, Strokes.get(Strokes.size()-1).loc.y, 10, 10);
   }
   fill(0);
  //offscreen.ellipse(0, 0, 50,50);
  drawCanvas(offscreen);
  popMatrix();
  offscreen.noFill();
  offscreen.endDraw();
  drawCanvas(offscreen);

//  test(offscreen);
//  offscreen.endDraw();
  surface.render(offscreen);
}
  
