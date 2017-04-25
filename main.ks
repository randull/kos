clearscreen.
set runmode to 1.
stage.

until runmode = 0 {
	if runmode = 1 {
		print "[                Preflight Mode                ]".
		run preflight.ks.
			clearscreen.
			set runmode to 2.
			print "[                Takeoff Mode                ]".
	} else if runmode = 2 {
			run takeoff.ks.
			when altitude > 2500 then {
				clearscreen.
				set runmode to 3.
				print "[               Ascent Mode                ]".
		}
	} else if runmode = 3 {
			run ascent.ks.
			when ship:apoapsis > 125000 then {
				clearscreen.
				set runmode to 4.
				print "[              Maneuver Mode               ]".
		}
	} else if runmode = 4 {
			run maneuver.ks.
			when ship:periapsis > adj_apoapsis then {
				clearscreen.
				set runmode to 5.
				print "[               Descent Mode               ]".
		}
	} else if runmode = 5 {
			run descent.ks.
			when ship:altitude < 2500 then {
				clearscreen.
				set runmode to 6.
				print "[               Landing Mode               ]".
		}
	} else if runmode = 6 {
			run landing.ks.
			when ship:status = "Landed" then {
				clearscreen.
				set runmode to 7.
				print "[              Postflight Mode              ]".
		}
	} else if runmode = 7 {
			run postflight.ks.
			clearscreen.
			set runmode to 0.
	}

	run engines.ks.
	run functions.ks.
	
	lock clearance to altitude - ship:geoposition:terrainheight.
	lock trueradar to alt:radar - clearance.
	lock g to constant:g * body:mass / body:radius^2.
	lock maxdecel to (ship:availablethrust / ship:mass) - g.
	lock stopdist to ship:verticalspeed^2 / (2 * maxdecel).
	lock idealthrottle to stopdist / trueradar.
	lock impacttime to trueradar / abs(ship:verticalspeed).
	lock twr to ship:availablethrust / (g * ship:mass).

  lock adj_apoapsis to ship:apoapsis-50.

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
	print "|  DeltaV:       " + round(deltav) at (25,30).
	print "|  TWR:          " + round(twr,2) at (25,31).
	print "|  True Radar:   " + round(trueradar) at (25,32).
	print "|  ETA To Apo:   " + round(eta:apoapsis) at (25,33).
	print "|  Vertspeed:    " + round(verticalspeed) at (25,34).
	print "|  Groundspeed:  " + round(groundspeed) at (25,35).
}