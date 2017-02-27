until ship:periapsis > 200000
{
    set etaFraction to ( ship:periapsis - initialPeriapsis)/( ship:apoapsis - initialPeriapsis).
    set desiredETA to etaFraction*(finalETA - initialETA) + initialETA.
    set desiredETA to max ( finalETA, min ( initialETA, desiredETA)).



    set err to ETA:apoapsis - desiredETA.
    set dT to missiontime - pT.
    set pT to missiontime .
    set dErr to (err-pErr)/dT.
    set errInt to errInt + err*dT.

    set th to P*err + I*errInt + D*dErr + 0.5. // plus 0.5 to give it pos and neg at beginning.

    if eta:apoapsis > 10* initialETA // something has gone wrong and we passed apoapsis
    {
        break .
    }

    lock throttle to th.
    wait 0.01.
}