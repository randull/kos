clearscreen.

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
set active_vacuum_engines to list(
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

print "------------------------------".