when trueradar < stopdist then {
	set warp to 0.
	lock steering to srfretrograde.
	lock throttle to idealthrottle.
}
when stopdist < 1 then {
	brakes on.
	sas on.
	set ship:control:pilotmainthrottle to 0.
}