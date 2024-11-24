/// @description Entity Loop
if (!global.gamePaused)
{
	flash = max(flash - 0.04, 0);

	fric = 0.05;
	if (z == 0) fric = 0.10;

	// Magnetise
	if ((instance_exists(obj_player)) && (entityAttract) && (global.attractBeingPressed))
	{	
		sprite_index = sprAttract;
	
		var _px = obj_player.x;
		var _py = obj_player.y;
		var _dist = point_distance(x, y, _px, _py);
		if (_dist < 120) // Magnet radius -- make high for attract logic!
		{
			spd += 0.05;
			direction = point_direction(x, y, _px, _py); // note: changing "direction" to "distance" repels the collectible away! (Could be useful for pushing)
			spd = min(spd, 0.50);
			fric = 0;
			if (_dist < 5) // Collect radius
			{
				x += 0
				y += 0;
			}
		}
	}
	else if (state == ENEMY_STATE.WANDER)
	{
		sprite_index = sprMove;
	}

	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	spd = max(spd - fric, 0);
	depth = -bbox_bottom;
}