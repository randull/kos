set runmode to 1.
clearscreen.
print "[                Preflight Mode                ]".

until runmode = 0 {
	if runmode = 1 {
		run preflight.ks.
		clearscreen.
		print "[                Takeoff Mode                ]".
		set runmode to 2.
	} else if runmode = 2 {
			run takeoff.ks.
			when altitude > 100 then {
				clearscreen.
				print "[           Lower Atmosphere Mode            ]".
				set runmode to 3.
		}
	} else if runmode = 3 {
			run lower_atmo.ks.
			when altitude > 20000 then {
				clearscreen.
				print "[           Middle Atmosphere Mode           ]".
				set runmode to 4.
		}
	} else if runmode = 4 {
			run middle_atmo.ks.
			when altitude > 30000 then {
				clearscreen.
				print "[           Upper Atmosphere Mode            ]".
				set runmode to 5.
		}
	} else if runmode = 5 {
			run upper_atmo.ks.
			when apoapsis > 100000 then {
				clearscreen.
				print "[            Circularization Mode            ]".
				set runmode to 6.
		}
	} else if runmode = 6 {
			run circularize.ks.
			when periapsis > 100000 then {
				clearscreen.
				print "[              Postflight Mode              ]".
				set runmode to 7.
		}
	} else if runmode = 7 {
			run postflight.ks.
			when ship:periapsis > ship:apoapsis then {
				clearscreen.
				set runmode to 0.
		}
	}


	set radarOffset to 9.184.	 																// The value of alt:radar when landed (on gear)
	lock trueradar to alt:radar - radaroffset.								// Offset radar to get distance from gear to ground
	lock g to constant:g * body:mass / body:radius^2.					// Gravity (m/s^2)
	lock maxdecel to (ship:availablethrust / ship:mass) - g.	// Maximum deceleration possible (m/s^2)
	lock stopdist to ship:verticalspeed^2 / (2 * maxdecel).		// The distance the burn will require
	lock idealthrottle to stopdist / trueradar.								// Throttle required for perfect hoverslam
	lock impacttime to trueradar / abs(ship:verticalspeed).		// Time until impact, used for landing gear
	lock twr to ship:availablethrust / (g * ship:mass).				// Current Thrust to Weight Ratio


	function deltav {
	  list engines in shipengines.
	  set drymass to ship:mass - ((ship:liquidfuel + ship:oxidizer) * 0.005).
	  return shipengines[0]:isp * g * ln(ship:mass / drymass).
	}


	print "RunMode:      " + round(runmode) at (1,29).
	print "Gravity:      " + round(g,4) at (1,30).
	print "Altitude:     " + round(ship:altitude) at (1,31).
	print "Apoapsis:     " + round(ship:apoapsis) at (1,32).
	print "Periapsis:    " + round(ship:periapsis) at (1,33).
	print "Liquid Fuel:  " + round(ship:liquidfuel) at (1,34).
	print "Oxidizer:     " + round(ship:oxidizer) at (1,35).
	print "|  DeltaV:       " + round(deltav) + "m/s" at (25,30).
	print "|  TWR:          " + round(twr,2) at (25,31).
	print "|  Impact Time:  " + round(impacttime,2) + "s" at (25,32).
	print "|  ETA To Apo:   " + round(eta:apoapsis) + "s" at (25,33).
	print "|  Vertspeed:    " + round(verticalspeed) + "m/s" at (25,34).
	print "|  Groundspeed:  " + round(groundspeed) + "m/s" at (25,35).
}