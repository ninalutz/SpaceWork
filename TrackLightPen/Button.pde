class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  color c;
  color CM = color(100);
  PImage icon;
  
  Button(float xpos, float ypos, float widthB,  float heightB, String labelB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
    Button(float xpos, float ypos, float widthB,  float heightB, String labelB, color _c) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    c = _c;
    CM = _c;
  }
  
  Button(float xpos, float ypos, float widthB, float heightB, PImage image){
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    icon = image;
  }
  
  void Draw() {
    fill(c);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    pushMatrix();
    scale(-1, 1);
    text(label, -x - (w / 2), y + (h / 2));
    popMatrix();
  }
  
   void DrawTest(PGraphics p) {
    p.beginDraw();
//    println("HELLO");
//    p.fill(#00ff00);
//    p.stroke(141);
//    p.ellipse(0, 0, 500, 500);
    p.stroke(141);
    p.fill(c);
    p.rect(-x, -y, w, h, 10);
    p.textAlign(CENTER, CENTER);
    p.pushMatrix();
    p.scale(-1, -1);
    p.fill(0);
    p.text(label, x - (w / 2), y - (h / 2));
    p.popMatrix();
    p.endDraw();
  }
  
  void DrawImage(){
    image(icon, x, y, w, h);
  }
  
    void DrawTestImage(PGraphics p ){
     p.beginDraw();
    image(icon, -x, -y, w, h);
    p.endDraw();
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      c = color(c, 100);
      return true;
    }
    c = color(CM);
    return false;
  }

  
  boolean IsOver(PVector plz) {
    for(int i = 0; i<Clicks.size(); i++){
    if (plz.x > x && plz.x < (x + w) && plz.y > y && plz.y < (y + h)) {
      c = color(c, 100);
      return true;
    }
    }
    c = color(CM);
    return false;
    
  }
  
}

