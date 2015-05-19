    import processing.serial.*;
    import cc.arduino.*;
   
    
    Arduino arduino;
    int ledPin = 13;
    String zipcode = "11211"; 
    
    
    void setup()
    {
      println(Arduino.list());
      arduino = new Arduino(this, Arduino.list()[5], 57600);
      arduino.pinMode(ledPin, Arduino.OUTPUT);
    }
    
    void draw()
    {
      String[] zipline = loadStrings("http://www.pshkvsky.com/weather/upload/relay.txt");
      zipcode = zipline[0];
      
      String[]   relayStatus = loadStrings("http://wearingcentigrade.herokuapp.com/"+ zipcode);
      String relayString = relayStatus[0];
      String[] list = split(relayString, ',');
      
      
      println(zipcode);
      
      if (list[0].equals("0")){
      println("snowing");
      arduino.digitalWrite(13, Arduino.HIGH);
    }
      
       if (list[0].equals("1")){
      println("");
      arduino.digitalWrite(13, Arduino.HIGH);
    }
    
    
     if (list[0].equals("3")){
      println("good");
      arduino.digitalWrite(13, Arduino.HIGH);
    }
    
    
     if (list[0].equals("3")){
      println("good");
      arduino.digitalWrite(13, Arduino.HIGH);
    }
    
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
    
