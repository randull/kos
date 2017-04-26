if ship:altitude < 17500 {
	if ship:altitude < 12500 {
		set warp to 1.
		lock steering to heading(90,30).
	} else {
		set warp to 1.
		lock steering to heading(90,20).
	}
} else {
	if ship:altitude < 22500 {
		set warp to 1.
		lock steering to heading(90,40).
	} else {
		set warp to 1.
		lock steering to heading(90,60).
	}
}