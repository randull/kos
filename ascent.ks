if ship:altitude < 17500 {
	if ship:altitude < 7500 {
		set warp to 1.
		lock steering to heading(90,90).
	} else {
		set warp to 1.
		lock steering to heading(90,60).
	}
} else {
	if ship:altitude < 22500 {
		set warp to 1.
		lock steering to heading(90,45).
	} else {
		set warp to 1.
		lock steering to heading(90,45).
	}
}
