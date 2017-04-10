lock throttle to 0.
wait 1.
lock vb to sqrt(body:mu/(body:radius+altitude))
  *vxcl(up:vector,velocity:orbit):direction:vector
  -velocity:orbit.
lock steering to vb.
wait until vang(facing:vector,vb) < 10.
lock throttle to 0.5*vb:mag*mass/maxthrust.
wait until ship:apoapsis-ship:periapsis < 50.
lock throttle to 0.
set warp to 0.