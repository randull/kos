//if ship:altitude < 50000 {
//	ag1 on.		// Disable Jet Engines & Air Intakes
//	ag5 off.	// Enable Nuclear and Ion Engines & Fuel Cells
//	lock steering to heading(90,45).
//} else {
//	when apoapsis > 205000 then {
//		set warp to 2.
//		lock throttle to 0.
//		lock steering to ship:srfprograde.
//	}
//	when eta:apoapsis < 60 then {
//		sas off.
//		lock steering to heading(90,-10).
//		lock throttle to 0.75.
//		wait 5.
//	}
//	when periapsis > 199500 then {
//		set warp to 0.
//		rcs on.
//		sas on.
//		lock throttle to 0.
//	}
//}