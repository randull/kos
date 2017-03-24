clearscreen.

list engines in all_engines.
set rapier_engines to list().
set afterburner_engines to list().
set sealevel_engines to list().
set rocket_engines to list().
set vacuum_engines to list().
set other_engines to list().

set all_rapier_engines to list(
	"RAPIER"
).
set all_afterburner_engines to list(
	"turboJet"
).
set all_sealevel_engines to list(
	"JetEngine",
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
	} else {
		other_engines:add(each_engine).
	}
}.

print "------------------------------".
print "Afterburner Engines:".
print afterburner_engines.

print "------------------------------".
print "Rapier Afterburner Engines:".
print rapier_engines.

print "------------------------------".
print "Sealevel Engines:".
print sealevel_engines.

print "------------------------------".
print "Rocket Engines:".
print rocket_engines.

print "------------------------------".
print "Vacuum Engines:".
print vacuum_engines.

print "------------------------------".
print "Other Engines:".
print other_engines.

//when ship:altitude > 30000 then {
//	for each_afterburner_engine in afterburner_engines {
//		each_afterburner_engine:activate.
//	}
//}
//when ship:altitude < 17500 then {
//	for each_vacuum_engine in vacuum_engines {
//		each_vacuum_engine:activate.
//	}
//}
//when ship:altitude < 150000 then {
//	for each_rapier_engine in rapier_engines {
//		each_rapier_engine:activate.
//	}
//}
//for each_afterburner_engine in afterburner_engines {
//	if ship:altitude < 15000 {
//		set each_afterburner_engine:primarymode to false.
//	} else {
//		set each_afterburner_engine:primarymode to true.
//	}
//}
//for each_rapier_engine in rapier_engines {
//	if ship:altitude > 20000 {
//		set each_rapier_engine:primarymode to false.
//	} else if ship:altitude < 500 {
//		set each_rapier_engine:primarymode to false.
//	} else {
//		set each_rapier_engine:primarymode to true.
//	}
//}