if ship:altitude < 17500 {
	if ship:altitude < 7500 {
		set warp to 1.
		ag1 off. 	// Enable Jet Engines & Air Intakes
		ag2 on.	  // Enable Afterburners
		ag3 off. 	// Enable Rapier
		ag4 on.   // Disable Rocket Engines
		ag5 on. 	// Disable Nuclear and Ion Engines & Fuel Cells
		lock steering to heading(90,15).
	} else {
		set warp to 1.
		ag1 off. 	// Enable Jet Engines & Air Intakes
		ag2 on.	  // Enable Afterburners
		ag3 off. 	// Enable Rapier
		ag4 on.   // Disable Rocket Engines
		ag5 on. 	// Disable Nuclear and Ion Engines & Fuel Cells
		lock steering to heading(90,10).
	}
} else {
	if ship:altitude < 22500 {
		set warp to 1.
		ag1 off. 	// Enable Jet Engines & Air Intakes
		ag2 off.	// Disable Afterburners
		ag3 off. 	// Enable Rapier
		ag4 on.   // Disable Rocket Engines
		ag5 on. 	// Disable Nuclear and Ion Engines & Fuel Cells
		lock steering to heading(90,30).
	} else {
		set warp to 1.
		ag1 on. 	// Disable Jet Engines & Air Intakes
		ag2 off.	// Disable Afterburners
		ag3 off. 	// Enable Rapier
		ag4 off.  // Enable Rocket Engines
		ag5 on. 	// Disable Nuclear and Ion Engines & Fuel Cells
		lock steering to heading(90,45).
	}
}