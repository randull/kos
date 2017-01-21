when trueradar < stopdist then {
	//gear on.
	lock steering to srfretrograde.
	lock throttle to idealthrottle.
}
when verticalspeed > -0.001 then {
	brakes on.
	sas on.
	set ship:control:pilotmainthrottle to 0.
}