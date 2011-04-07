#ifndef HOSTCOM_H
#define HOSTCOM_H

/*
  Class to handle sending messages from and back to the host.
  NOWHERE ELSE in this program should anything send to Serial.print()
  or get anything from Serial.read().
  
  All communication is in printable ASCII characters.  Messages sent back
  to the host computer are terminated by a newline and look like this:
  
  xx [line number to resend] [T:93.2 B:22.9] [C: X:9.2 Y:125.4 Z:3.7 E:1902.5] [Some debugging or other information may be here]
  
  where xx can be one of:
  
  ok
  rs
  !!
  
  ok means that no error has been detected.
  rs means resend, and must be followed by the line number to resend.
  !! means that a hardware fault has been detected.  The RepRap machine will
       shut down immediately after it has sent this message.
       
  The T: and B: values are the temperature of the currently-selected extruder 
  and the bed respectively, and are only sent in response to a request using the
  appropriate M code.
  
  C: means that coordinates follow.  Those are the X: Y: etc values.  These are only 
  sent in response to a request using the appropriate M code.

  The most common response is simply:

  ok  
       
  When the machine boots up it sends the string
  
  start
  
  once to the host before sending anything else.  This should not be replaced or augmented
  by version numbers and the like.  We should implement an M code to request those.
       
 */

// Can't get lower than absolute zero...

#define NO_TEMP -300

extern void shutdown();

class hostcom
{
public:
  hostcom();
  char* string();
  void setETemp(int et);
  void setBTemp(int bt);
  void setCoords(const FloatPoint& where);
  void setResend(long ln);
  void setFatal();
  void sendMessage(bool doMessage);
  void start();
  
// Wrappers for the comms interface

  void putInit();
  void put(char* s);
  void put(const float& f);
  void put(const long& l);
  void put(int i);
  void putEnd();
  char gotData();
  char get();
  
private:
  void reset();
  void sendtext(bool noText);
  char message[RESPONSE_SIZE];
  int etemp;
  int btemp;
  float x;
  float y;
  float z;
  float e;
  long resend;
  bool fatal;
  bool sendCoordinates;  
};



#endif
