set gear to alt:radar < 120.
set panels to alt:radar > 50000.
set fuelcells to ship:electriccharge < 100.
set intakes to ship:dynamicpressure < 1.

for each_afterburner_engine in afterburner_engines {
	if ship:altitude < 20000 {
		set each_afterburner_engine:primarymode to false.
	} else {
		set each_afterburner_engine:primarymode to true.
	}
}
when ship:altitude > 24000 then {
	for each_afterburner_engine in afterburner_engines {
		each_afterburner_engine:shutdown.
	}
}
for each_rocket_engine in rocket_engines {
	if ship:altitude < 26000 {
		each_rocket_engine:shutdown.
	} else {
		each_rocket_engine:activate.
	}
}
for each_sealevel_engine in sealevel_engines {
	if ship:altitude < 28000 {
		each_sealevel_engine:activate.
	} else {
		each_sealevel_engine:shutdown.
	}
}
for each_vacuum_engine in vacuum_engines {
	if ship:altitude < 30000 {
		each_vacuum_engine:shutdown.
	} else {
		each_vacuum_engine:activate.
	}
}
for each_rapier_engine in rapier_engines {
	if ship:apoapsis < 210000 {
		each_rapier_engine:activate.
	} else {
		each_rapier_engine:shutdown.
	}
}

