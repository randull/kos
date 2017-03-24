set gear to alt:radar < 120.
set panels to alt:radar > 50000.
set fuelcells to ship:electriccharge < 100.
set intakes to ship:dynamicpressure < 1.

list engines in all_engines.
set rapier_engines to list().
set afterburner_engines to list().
set sealevel_engines to list().
set rocket_engines to list().
set vacuum_engines to list().

set all_rapier_engines to list(
	"RAPIER"
).
set all_afterburner_engines to list(
	"turboJet"
).
set all_sealevel_engines to list(
	"liquidEngine3",
	"miniJetEngine",
	"turboFanEngine"
).
set all_rocket_engines to list(
	"engineLargeSkipper",
	"liquidEngine",
	"liquidEngine2",
	"liquidEngine2-2",
	"liquidEngine3",
	"liquidEngineMini",
	"SSME",
	"toroidalAerospike"
).
set all_vacuum_engines to list(
	"ionEngine",
	"nuclearEngine"
).

for each_engine in all_engines {
	if all_rapier_engines:contains(each_engine:name) { 
		rapier_engines:add(each_engine).		
	} else if all_afterburner_engines:contains(each_engine:name) { 
		afterburner_engines:add(each_engine).		
	} else if all_sealevel_engines:contains(each_engine:name) { 
		sealevel_engines:add(each_engine).		
	} else if all_rocket_engines:contains(each_engine:name) { 
		rocket_engines:add(each_engine).		
	} else if all_vacuum_engines:contains(each_engine:name) { 
		vacuum_engines:add(each_engine).		
	}
}.

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

