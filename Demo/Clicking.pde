import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;

Robot robot;

ArrayList<Click>Clicks = new ArrayList<Click>();

class Click{
  PVector loc;
  float time;

  Click(PVector _loc, float _time){
   loc = _loc;
   time = _time;
  }

}

void Clicked(){
  for(int i = 0; i<Clicks.size(); i++){
     if(abs(millis() - Clicks.get(i).time) < 100){
       println("CLICKED");
       println(Clicks.get(i).loc);

    if(notStarted){
    if(startFreeFlow.IsOver(new PVector(-Clicks.get(i).loc.x + 20, -Clicks.get(i).loc.y + 20 ))){
        Strokes.clear();
        notStarted = false;

     }
    }
    
    if(!notStarted){
     
     if(exitSession.IsOver(new PVector(-Clicks.get(i).loc.x, -Clicks.get(i).loc.y))){
       notStarted = true;
       Strokes.clear();

     }
//     
//      if(Clicks.get(i).loc.x + 275 > - 20 &&  Clicks.get(i).loc.y + 211 > - 20){
//       notStarted = true;
//       Strokes.clear();
//      }
//     else{
//        //println("HIIII");
//        Menu = true;
//        origin = new PVector(-Clicks.get(i).loc.x, -Clicks.get(i).loc.y);
//        penButton = new Button(origin.x + 5, origin.y, 50,30, "Pen", 150);
//        canvasButton = new Button(origin.x +5, origin.y + 40, 60, 30, "Canvas", 150);
//        emailButton = new Button(origin.x + 5, origin.y + 80, 60, 40, mailIcon);
//     }
    }
     
     }
  }
}
