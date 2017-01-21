if ship:altitude < 17500 {
	if ship:altitude < 12500 {
		set warp to 1.
		ag2 off.
		ag4 off.
		ag5 on.
		if ship:verticalspeed > 75 {			
			lock steering to heading(90,20).
		} else if ship:verticalspeed < 25 {			
			lock steering to heading(90,30).
		} else {			
			lock steering to heading(90,25).
		}
	} else {
		ag2 on.
		ag4 off.
		ag5 on.
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
		ag4 off.
		ag5 off.
		ag10 on.
		lock steering to heading(90,15).
	} else {
		ag3 on.
		ag4 off.
		ag5 off.
		ag10 on.
		lock steering to heading(90,30).
	}
}