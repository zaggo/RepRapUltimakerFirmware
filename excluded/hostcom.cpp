/*
 * hostcom.cpp
 *
 *  Created on: 2011-04-05
 *      Author: rob
 */

extern "C" {
  #include <toolhead.h>
  #include <hardware/arduino_toolhead.h>
}

#include "firmware.h"

inline hostcom::hostcom()
{
  fatal = false;
  reset();
}

// Wrappers for the comms interface

inline void hostcom::putInit() {  Serial.begin(HOST_BAUD); }
inline void hostcom::put(char* s) { Serial.print(s); }
inline void hostcom::put(const float& f) { Serial.print(f); }
inline void hostcom::put(const long& l) { Serial.print(l); }
inline void hostcom::put(int i) { Serial.print(i); }
inline void hostcom::putEnd() { Serial.println(); }
inline char hostcom::gotData() { return Serial.available(); }
inline char hostcom::get() { return Serial.read(); }


// called after each message has been sent

inline void hostcom::reset()
{
  etemp = NO_TEMP;
  btemp = NO_TEMP;
  message[0] = 0;
  resend = -1;
  sendCoordinates = false;
  // Don't reset fatal.
}

// Called once when the machine boots

inline void hostcom::start()
{
  putInit();
  put("start");
  putEnd();
}

// Return the place to write messages into.  Typically this is used in lines like:
// sprintf(talkToHost.string(), "Echo: %s", cmdbuffer);

inline char* hostcom::string()
{
  return message;
}

// Set the extruder temperature to be returned.

inline void hostcom::setETemp(int et)
{
  etemp = et;
}

// Set the bed temperature to be returned

inline void hostcom::setBTemp(int bt)
{
  btemp = bt;
}

// Set the machine's coordinates to be returned

inline void hostcom::setCoords(const FloatPoint& where)
{
  x = where.x;
  y = where.y;
  z = where.z;
  e = where.e;
  sendCoordinates = true;
}

// Request a resend of line ln

inline void hostcom::setResend(long ln)
{
  resend = ln;
}

// Flag that a fatal error has occurred (such as a temperature sensor failure).

inline void hostcom::setFatal()
{
  fatal = true;
}

// Send the text stored (if any) to the host.

inline void hostcom::sendtext(bool doMessage)
{
  if(!doMessage)
    return;
  if(!message[0])
    return;
  put(" ");
  put(message);
}

// Master function to return messages to the host

inline void hostcom::sendMessage(bool doMessage)
{
  if(fatal)
  {
    put("!!");
    sendtext(true);
    putEnd();
    shutdown();
    return; // Technically redundant - shutdown never returns.
  }

  if(resend < 0)
    put("ok");
  else
  {
    put("rs ");
    put(resend);
  }

  if(etemp > NO_TEMP)
  {
    put(" T:");
    put(etemp);
  }

  if(btemp > NO_TEMP)
  {
    put(" B:");
    put(btemp);
  }

  if(sendCoordinates)
  {
    put(" C: X:");
    put(x);
    put(" Y:");
    put(y);
    put(" Z:");
    put(z);
    put(" E:");
    put(e);
  }

  sendtext(doMessage);

  putEnd();

  reset();
}
