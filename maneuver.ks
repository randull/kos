if ship:altitude < 50000 {
	ag1 on.		// Disable Jet Engines & Air Intakes
	ag5 off.	// Enable Nuclear and Ion Engines & Fuel Cells
	lock steering to heading(90,45).
} else {
	when apoapsis > 199500 then {
		sas on.
		lock throttle to 0.
	}
	when eta:apoapsis < 30 then {
		sas off.
		lock steering to heading(90,-1).
		lock throttle to 1.
	}
	when periapsis > 199500 then {
		set warp to 0.
		rcs on.
		sas on.
		lock throttle to 0.
	}
}