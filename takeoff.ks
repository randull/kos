if ship:altitude < 100 {
	rcs on.
	lock steering to heading(90.33,5).
	lock throttle to 1.0.
} else {
	lock steering to heading(90,15).
	lock throttle to 1.0.	
}