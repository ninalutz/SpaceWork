float start;

void mousePressed() {
  
  if(penMenu){
  if (slider.isOver()){
      slider.lock = true;
  }
    if (button.MouseIsOver()) {
    penMenu = false;
  }
    if (eraser.MouseIsOver()) {
    println("Clicked: ");
    barColor = 100;
  }

  }


}
 
void mouseReleased() {
  if(penMenu){
  //unlock
  slider.lock = false;
  }

}
