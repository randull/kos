list engines in all_engines.
set vtol_engines to list().
set solid_engines to list().
set rapier_engines to list().
set afterburner_engines to list().
set sealevel_engines to list().
set rocket_engines to list().
set nuclear_engines to list().
set vacuum_engines to list().
set other_engines to list().

set all_vtol_engines to list(
	"miniJetEngine",
	"smallRadialEngine"
).
set all_solid_engines to list(
	"MassiveBooster",
	"solidBooster",
	"solidBooster.sm",
	"solidBooster1-1"
).
set all_rapier_engines to list(
	"RAPIER"
).
set all_afterburner_engines to list(
	"turboJet"
).
set all_sealevel_engines to list(
	"JetEngine",
	"turboFanEngine",
	"turboFanSize2"
).
set all_rocket_engines to list(
	"engineLargeSkipper",
	"liquidEngine",
	"liquidEngine1-2",
	"liquidEngine2",
	"liquidEngine2-2",
	"liquidEngineMini",
	"radialEngineMini",
	"radialLiquidEngine1-2",
	"Size2LFB",
	"Size3AdvancedEngine",
	"Size3EngineCluster",
	"SSME",
	"toroidalAerospike"
).
set all_nuclear_engines to list(
	"nuclearEngine"
).
set all_vacuum_engines to list(
	"ionEngine",
	"liquidEngine3",
	"microEngine",
	"omsEngine"
).

for each_engine in all_engines {
	if all_vtol_engines:contains(each_engine:name) { 
		vtol_engines:add(each_engine).		
	} else if all_solid_engines:contains(each_engine:name) { 
		solid_engines:add(each_engine).		
	} else if all_rapier_engines:contains(each_engine:name) { 
		rapier_engines:add(each_engine).		
	} else if all_afterburner_engines:contains(each_engine:name) { 
		afterburner_engines:add(each_engine).		
	} else if all_sealevel_engines:contains(each_engine:name) { 
		sealevel_engines:add(each_engine).		
	} else if all_nuclear_engines:contains(each_engine:name) { 
		nuclear_engines:add(each_engine).		
	} else if all_rocket_engines:contains(each_engine:name) { 
		rocket_engines:add(each_engine).		
	} else if all_vacuum_engines:contains(each_engine:name) { 
		vacuum_engines:add(each_engine).		
	} else {
		other_engines:add(each_engine).
	}
}.
