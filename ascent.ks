if ship:altitude < 17500 {
	if ship:altitude < 12500 {
		set warp to 1.
		if ship:airspeed < 500 {
			lock steering to heading(90,10).
		} else {
			lock steering to heading(90,15).
		}
	} else {
		set warp to 1.
		if ship:airspeed < 1500 {
			lock steering to heading(90,5).
		} else {
			lock steering to heading(90,10).
		}
	}
} else {
	if ship:altitude < 22500 {
		set warp to 2.
		if ship:airspeed < 1450 {
			lock steering to heading(90,5).
		} else {
			lock steering to heading(90,10).
		}
	} else {
		set warp to 2.
		if ship:airspeed < 1400 {
			wait 1. lock steering to heading(90,5).
		} else {
			wait 1. lock steering to heading(90,45).
		}
	}
}