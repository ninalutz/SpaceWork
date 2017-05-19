import processing.pdf.*;
PrintWriter output;


void doEmail(){
  pdf.beginDraw();
  pushMatrix();
  pdf.image(offscreen, 0, 0);
  pdf.dispose();
  pdf.endDraw();
  popMatrix();
  output = createWriter("email.txt"); 
  output.println(email);
  output.close();
  open("/Users/Nina/Documents/Github/SpaceWork/email.command");


}
