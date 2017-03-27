LOCK THROTTLE TO 0.
WAIT 1.
LOCK Vb TO SQRT(BODY:MU/(BODY:RADIUS+ALTITUDE))
  *VXCL(UP:VECTOR,VELOCITY:ORBIT):DIRECTION:VECTOR
  -VELOCITY:ORBIT.
LOCK STEERING TO Vb.
WAIT UNTIL VANG(FACING:VECTOR,Vb) < 10.
LOCK THROTTLE TO 0.5*Vb:MAG*MASS/MAXTHRUST.
WAIT UNTIL APOAPSIS-PERIAPSIS < 200.
LOCK THROTTLE TO 0.