function LoveLetterAttack(){
	// How fast to move
	var _spd = enemySpeed * 3;
	
	// How far we have to dive
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	// Move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		// Commit to move and stop moving if we hit a wall
		if (EnemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		
		// Pause for one 1/6 second before returning to retreat state
		stateTarget = ENEMY_STATE.RETREAT;
		stateWaitDuration = 10;
		state = ENEMY_STATE.WAIT;
		
	}
}