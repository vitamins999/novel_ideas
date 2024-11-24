function LoveLetterRetreat(){
	// How fast to move
	var _spd = enemySpeed * 3;
	
	// How far we have to dive
	var _distanceToGo = point_distance(x, y, retreatX, retreatY);

	// Move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, retreatX, retreatY);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		// Commit to move and stop moving if we hit a wall
		if (EnemyTileCollision() == true)
		{
			retreatX = x;
			retreatY = y;
		}
	}
	else
	{
		x = retreatX;
		y = retreatY;
		
		// Pause for 1 second before returning to wander state
		stateTarget = ENEMY_STATE.WANDER;
		stateWaitDuration = 60;
		state = ENEMY_STATE.WAIT;
		
	}
}