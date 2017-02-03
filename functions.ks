set gear to alt:radar < 120.
set panels to alt:radar > 50000.
set fuelcells to ship:electriccharge < 100.
set intakes to ship:dynamicpressure < 1.

list engines in engine_list.
set afterburner_engines to list().
set rapier_engines to list().
set sealevel_engines to list().
set vacuum_engines to list().

for each_engine in engine_list {
	if each_engine:multimode = true {
		if each_engine:autoswitch = false {
			afterburner_engines:add(each_engine).
		} else {
			rapier_engines:add(each_engine).
		}
	} else {
		if each_engine:sealevelisp > each_engine:vacuumisp {
			sealevel_engines:add(each_engine).
		} else {
			vacuum_engines:add(each_engine).		
		}
	}
}

when ship:dynamicpressure < 1 then {
	for each_afterburner_engine in afterburner_engines {
		each_afterburner_engine:activate.
	}
}
when ship:altitude < 150000 then {
	for each_rapier_engine in rapier_engines {
		each_rapier_engine:activate.
	}
}
for each_afterburner_engine in afterburner_engines {
	if ship:altitude < 15000 {
		set each_afterburner_engine:primarymode to false.
	} else {
		set each_afterburner_engine:primarymode to true.
	}
}
for each_rapier_engine in rapier_engines {
	if ship:altitude > 20000 {
		set each_rapier_engine:primarymode to false.
	} else if ship:altitude < 500 {
		set each_rapier_engine:primarymode to false.
	} else {
		set each_rapier_engine:primarymode to true.
	}
}
//for each_sealevel_engine in sealevel_engines {
//	each_sealevel_engine:activate.
//}
//for each_vacuum_engine in vacuum_engines {
//	each_vacuum_engine:activate.
//}