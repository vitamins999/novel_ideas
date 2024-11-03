// At destination or given up?
if ((x == xTo) && (y == yTo)) || (timePassed > wanderDistance / wanderSpeed)
{
	hSpeed = 0;
	vSpeed = 0;
		
	// Set new target destination
	if (++wait >= waitDuration)
	{
		wait = 0;
		timePassed = 0;
		dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
		xTo = x + lengthdir_x(wanderDistance, dir);
		yTo = y + lengthdir_y(wanderDistance, dir);
	}
}
else // Move towards new destination
{
	timePassed++;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	var _speedThisFrame = wanderSpeed;
	if (_distanceToGo < wanderSpeed) _speedThisFrame = _distanceToGo;
	dir = point_direction(x, y, xTo, yTo);
	hSpeed = lengthdir_x(_speedThisFrame, dir);
	vSpeed = lengthdir_y(_speedThisFrame, dir);
			
	x += hSpeed;
	y += vSpeed;
}