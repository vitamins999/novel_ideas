function DarkKnightWander(){
	sprite_index = sprMove;
	
	// At destination or given up?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
	{
		hSpeed = 0;
		vSpeed = 0;
		// End our move animation
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
		// Set new target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	}
	else // Move towards new destination
	{
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		// Collide and move
		var _collided = EnemyTileCollision();
	}
	
	// Check for Aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(obj_player)) && (point_distance(x, y, obj_player.x, obj_player.y) <= enemyAggroRadius)
		{
			state = ENEMY_STATE.CHASE;
			target = obj_player;
		}
	}
}