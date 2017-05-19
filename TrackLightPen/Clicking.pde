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
       println("CLICKED", surface.getTransformedMouse());
       println(startFreeFlow.IsOver(surface.getTransformedMouse()));
       println(Clicks.get(i).loc);
       println(surface.getTransformedCursor(mouseX, mouseY));
       println(surface.getTransformedCursor(996,550));
       if(startFreeFlow.IsOver(new PVector(603.0, 279.0))){
        notStarted = false;
     }
     }
  }
}
