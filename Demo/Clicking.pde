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
    if(startFreeFlow.IsOver(new PVector(-Clicks.get(i).loc.x + 40, -Clicks.get(i).loc.y + 20 )) || startFreeFlow.IsOver(new PVector(-Clicks.get(i).loc.x - 40, -Clicks.get(i).loc.y + 20 ))){
        Strokes.clear();
        notStarted = false;
     }
    }
    
    if(!notStarted){
     
     if(exitSession.IsOver(new PVector(-Clicks.get(i).loc.x + 20, -Clicks.get(i).loc.y + 20)) || exitSession.IsOver(new PVector(-Clicks.get(i).loc.x - 20, -Clicks.get(i).loc.y + 20))){
       notStarted = true;
       Strokes.clear();

     }
     
     //OTHER CONTROLS NOT WORKING :( :( :( 
//     
//      if(Clicks.get(i).loc.x + 275 > - 20 &&  Clicks.get(i).loc.y + 211 > - 20){
//       notStarted = true;
//       Strokes.clear();
//      }
//     else{
//       if(!Menu){
//        //println("HIIII");
//        Menu = true;
//        origin = new PVector(-Clicks.get(i).loc.x, -Clicks.get(i).loc.y);
//        penButton = new Button(origin.x + 380, origin.y + 250, 50,30, "Pen", 150);
//        canvasButton = new Button(origin.x + 380, origin.y + 290, 60, 30, "Canvas", 150);
//        emailButton = new Button(origin.x + 380, origin.y + 330, 60, 40, mailIcon);
//       }
//       else{
//         if(penButton.IsOver(new PVector(-Clicks.get(i).loc.x + 380, -Clicks.get(i).loc.y + 250))){
//             penMenu = true;
//             println("HI THERE");
//         }
//       }
//     }
    }
     
     }
  }
}
