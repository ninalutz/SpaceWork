/**
 * ControlP5 Button
 * this example shows how to create buttons with controlP5.
 * 
 * find a list of public methods available for the Button Controller 
 * at the bottom of this sketch's source code
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */
 
import controlP5.*;

ControlP5 cp5;

int myColor = color(255);

int c1,c2;

float n,n1;
boolean thing;
boolean notgen = true;
void setup() {
  size(1000,600);
  noStroke();
  cp5 = new ControlP5(this);
//  cp5.addColorWheel("c" , 250 , 10 , 200 ).setRGB(color(128,0,255));
//  
//  cp5.addButton("test")
//     .setValue(0)
//     .setPosition(10,100)
//     .setSize(200,19)
//     ;

}
  int c = color(100);

void draw() {  
  background(50);
 
 if(notgen){
  if(thing){
    
    cp5.addColorWheel("c" , 250 , 10 , 200 ).setRGB(color(128,0,255));
  
    cp5.addButton("test")
     .setValue(0)
     .setPosition(10,100)
     .setSize(200,19)
     ;
   thing = false;  
   notgen = false;
  }
  
 }
 
  
  
}
float starttime;
void mouseClicked(){
  starttime = millis();
  println("HELLO");
}

void mouseReleased(){
  
  if(millis() - starttime > 3000){
    thing = true;
  }

}



