when apoapsis > 201000 then {
	lock throttle to 0.
	lock steering to prograde.
}
when eta:apoapsis < 60 then {
	lock throttle to 1.
	lock steering to heading(90,-1).
}
when periapsis > 199000 then {
	rcs on.
	sas on.
	lock throttle to 0.
}