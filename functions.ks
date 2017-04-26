set gear to alt:radar < 120.
set panels to alt:radar > 50000.
set fuelcells to ship:electriccharge < 100.
set intakes to ship:dynamicpressure < 1.



for vtol_bays in ship:partsdubbed("VTOL Bay") {	
	set vtol_bay_module to vtol_bays:getmodule("ModuleAnimateGeneric").
	if ship:altitude < 7500 {
		if vtol_bay_module:hasevent("open") = true {
	  	vtol_bay_module:doevent("open").
	  }
	} else {
		if vtol_bay_module:hasevent("close") = true {
	  	vtol_bay_module:doevent("close").
	  }
	}
}.
for each_vtol_engine in vtol_engines {
	if ship:altitude < 7500 {
		each_vtol_engine:activate.
	} else {
		each_vtol_engine:shutdown.
	}
}
for each_nuclear_engine in nuclear_engines {
	if ship:altitude < 18000 {
		each_nuclear_engine:shutdown.
	} else {
		each_nuclear_engine:activate.
	}
}
for each_afterburner_engine in afterburner_engines {
	if ship:altitude < 20000 {
		set each_afterburner_engine:primarymode to false.
	} else {
		set each_afterburner_engine:primarymode to true.
	}
}
when ship:altitude > 22000 then {
	for each_afterburner_engine in afterburner_engines {
		each_afterburner_engine:shutdown.
	}
}
for each_rocket_engine in rocket_engines {
	if ship:altitude < 25000 {
		each_rocket_engine:shutdown.
	} else {
		each_rocket_engine:activate.
	}
}
for each_sealevel_engine in sealevel_engines {
	if ship:altitude < 30000 {
		each_sealevel_engine:activate.
	} else {
		each_sealevel_engine:shutdown.
	}
}
for each_vacuum_engine in vacuum_engines {
	if ship:altitude < 35000 {
		each_vacuum_engine:shutdown.
	} else {
		if ship:oxidizer < 200 {
			each_vacuum_engine:shutdown.
		} else {
			each_vacuum_engine:activate.
		}	
	}
}
for each_rapier_engine in rapier_engines {
	if ship:oxidizer < 200 {
		each_rapier_engine:shutdown.
	} else {
		each_rapier_engine:activate.
	}
}