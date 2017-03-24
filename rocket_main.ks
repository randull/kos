set profile to LIST(
  LIST(-9999, 85), // -9999 ensures alt > first item in list.
  LIST(3000, 70),
  LIST(7000, 65),
  LIST(10000, 45),
  LIST(13000, 35),
  LIST(15000, 30),
  LIST(25000, 20),
  LIST(35000, 15),
  LIST(50000, 10),
  LIST(72000, 0)
).

lock throttle to 1.
set mysteer to heading(90,90).
lock steering to mysteer.
stage.

print "BEGINNING PROFILE LIST".

set profIndex to 0.
local nextAlt is profile[profIndex][0].
local nextPitch is profile[profIndex][1].

until profIndex = profile:length {
  if altitude > nextAlt {
    set mysteer to heading(90, nextPitch).
    print "Pitch now set to " + nextPitch.
    set profIndex to profIndex + 1.
    if profIndex < profile:length {
      set nextAlt to profile[profIndex][0].
      set nextPitch to profile[profIndex][1].
      print "Waiting until alt > " + nextAlt.
    }
  }
  if should_stage() {
    stage.
  }
  wait 0.
}

print "PROFILE LIST COMPLETE".

function should_stage {
   if maxthrust = 0
     return true.
   list engines in my_engines.
   for eng in my_engines 
     if eng:flameout 
       return true.
   return false.
}
