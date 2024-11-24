function LoveLetterWander(){
	if (!global.attractBeingPressed)
	{
		sprite_index = sprMove;
		image_speed = 1.0;
		// At destination or given up?
		if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
		{
			hSpeed = 0;
			vSpeed = 0;
		
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
		if ((++aggroCheck >= aggroCheckDuration) && (global.playerHealth > 0))
		{
			aggroCheck = 0;
			if (instance_exists(obj_player)) && (point_distance(x, y, obj_player.x, obj_player.y) <= enemyAggroRadius)
			{
				target = obj_player;
				xTo = target.x;
				yTo = target.y;

				retreatX = x;
				retreatY = y;
				
				sprite_index = sprAttack;
				image_index = 0;
				image_speed = 1.0;
				
				// Pause for 0.5 seconds before attack
				stateTarget = ENEMY_STATE.ATTACK;
				stateWaitDuration = 30;
				state = ENEMY_STATE.WAIT;
			}
		}
	}
}