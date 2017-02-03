clearscreen.

set mylexicon to lexicon("turboFanEngine", "liquidEngine3", "turboJet", "RAPIER").

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
print "Vacuum Engines:".
print vacuum_engines.

print "------------------------------".
print "------------------------------".
print "All Engines:".
print all_engines.

print "------------------------------".
print myLexicon.

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