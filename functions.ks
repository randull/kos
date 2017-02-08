set gear to alt:radar < 120.
set panels to alt:radar > 50000.
set fuelcells to ship:electriccharge < 100.
set intakes to ship:dynamicpressure < 1.

list engines in all_engines.
set afterburner_engines to list().
set rapier_engines to list().
set sealevel_engines to list().
set vacuum_engines to list().

for each_engine in all_engines {
	if each_engine:name = "turboJet" {
		afterburner_engines:add(each_engine).		
	} else if each_engine:name = "RAPIER" {
		rapier_engines:add(each_engine).		
	} else if each_engine:name = "liquidEngine3" {
		sealevel_engines:add(each_engine).		
	} else {
		vacuum_engines:add(each_engine).		
	}
}

when ship:altitude > 30000 then {
	for each_afterburner_engine in afterburner_engines {
		each_afterburner_engine:shutdown.
	}
}
for each_sealevel_engine in sealevel_engines {
	when ship:altitude > 150 then {
		each_sealevel_engine:shutdown.
	}
}
when ship:altitude < 150000 then {
	for each_rapier_engine in rapier_engines {
		each_rapier_engine:activate.
	}
}
for each_afterburner_engine in afterburner_engines {
	if ship:altitude < 150 {
		set each_afterburner_engine:primarymode to false.
	} else {
		set each_afterburner_engine:primarymode to true.
	}
}
//for each_rapier_engine in rapier_engines {
//	if ship:altitude > 20000 {
//		set each_rapier_engine:primarymode to false.
//	} else if ship:altitude < 500 {
//		set each_rapier_engine:primarymode to false.
//	} else {
//		set each_rapier_engine:primarymode to true.
//	}
//}