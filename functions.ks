set gear to alt:radar < 120.
set panels to alt:radar > 50000.
set fuelcells to ship:electriccharge < 100.
set intakes to ship:dynamicpressure < 1.

list engines in all_engines.
set afterburner_engines to list().
set rapier_engines to list().
set sealevel_engines to list().
set rocket_engines to list().
set vacuum_engines to list().

for each_engine in all_engines {
	if each_engine:name = "turboJet" {
		afterburner_engines:add(each_engine).		
	}
}
for each_engine in all_engines {
	if each_engine:name = "liquidEngine3" {
		sealevel_engines:add(each_engine).				
	} else if each_engine:name = "turboFanEngine" {
		sealevel_engines:add(each_engine).						
	} else if each_engine:name = "miniJetEngine" {
		sealevel_engines:add(each_engine).		
	}
}
for each_engine in all_engines {
	if each_engine:name = "RAPIER" {
		rapier_engines:add(each_engine).		
	}
}
for each_engine in all_engines {
	if each_engine:name = "toroidalAerospike" {
		rocket_engines:add(each_engine).				
	} else if each_engine:name = "liquidEngine" {
		rocket_engines:add(each_engine).		
	} else if each_engine:name = "liquidEngine2" {
		rocket_engines:add(each_engine).		
	} else if each_engine:name = "SSME" {
		rocket_engines:add(each_engine).		
	}
}
for each_engine in all_engines {
	if each_engine:name = "nuclearEngine" {
		vacuum_engines:add(each_engine).		
	}
}

for each_afterburner_engine in afterburner_engines {
	if ship:altitude < 20000 {
		set each_afterburner_engine:primarymode to false.
	} else {
		set each_afterburner_engine:primarymode to true.
	}
}
for each_rocket_engine in rocket_engines {
	if ship:altitude < 22500 {
		each_rocket_engine:shutdown.
	} else {
		each_rocket_engine:activate.
	}
}
when ship:altitude > 25000 then {
	for each_afterburner_engine in afterburner_engines {
		each_afterburner_engine:shutdown.
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

