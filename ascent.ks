if ship:altitude < 17500 {
	if ship:altitude < 12500 {
		set warp to 1.
		ag2 off.	// Disable Afterburners
		ag5 on.		// Disable Nuclear and Ion Engines & Fuel Cells
		rcs off.
		if ship:verticalspeed > 150 {			
			lock steering to heading(90,20).
		} else if ship:verticalspeed < 25 {			
			lock steering to heading(90,30).
		} else {			
			lock steering to heading(90,25).
		}
	} else {
		set warp to 2.
		ag2 on.	// Enable Afterburners
		if ship:verticalspeed > 10 {			
			lock steering to heading(90,2).
		} else if ship:verticalspeed < 5 {			
			lock steering to heading(90,10).
		} else {			
			lock steering to heading(90,5).
		}	
	}
} else {
	if ship:altitude < 22500 {
		set warp to 1.
		ag4 off.	// Enable Rocket Engines
		ag5 off.	// Enable Nuclear and Ion Engines & Fuel Cells
		lock steering to heading(90,15).
	} else {
		set warp to 2.
		lock steering to heading(90,30).
	}
}