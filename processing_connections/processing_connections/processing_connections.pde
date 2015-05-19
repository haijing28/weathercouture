    import processing.serial.*;
    import cc.arduino.*;
   
    
    Arduino arduino;
    int ledPin = 13;
    
    void setup()
    {
      println(Arduino.list());
      arduino = new Arduino(this, Arduino.list()[5], 57600);
      arduino.pinMode(ledPin, Arduino.OUTPUT);
    }
    
    void draw()
    {
      
      String[]   relayStatus = loadStrings("http://wearingcentigrade.herokuapp.com/10021");
      String relayString = relayStatus[0];
      String[] list = split(relayString, ',');
      
      if (list[0].equals("3")){
      println("good");
      arduino.digitalWrite(13, Arduino.HIGH);
    }
      delay(1000);
      }



//      
//      if (relayString.equals("3,17")){
//         println("yeah");
//          arduino.digitalWrite(ledPin, Arduino.HIGH);
//      }else{
//          arduino.digitalWrite(ledPin, Arduino.LOW);
//      }
//      println(relayString);
//      delay(1000);
    
