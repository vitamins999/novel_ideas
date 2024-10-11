/// @description Entity Loop
if (!global.gamePaused)
{
	
}
flash = max(flash - 0.04, 0);

fric = 0.05;
if (z == 0) fric = 0.10;

// Magnetise
if ((instance_exists(obj_player)) && (entityAttract) && (global.attractBeingPressed))
{	
	image_index = 1;
	
	var _px = obj_player.x;
	var _py = obj_player.y;
	var _dist = point_distance(x, y, _px, _py);
	if (_dist < 120) // Magnet radius
	{		
		spd += 0.05;
		direction = point_direction(x, y, _px, _py); // note: changing "direction" to "distance" repels the collectible away! (Could be useful for pushing)
		spd = min(spd, 0.50);
		fric = 0;
		if (_dist < 14) // Proximity radius to stop movement
		{
			x += 0
			y += 0;
		}
		else
		{
			x += lengthdir_x(spd, direction);
			y += lengthdir_y(spd, direction);
			spd = max(spd - fric, 0);
		}
	} 
} 
else
{
	image_index = 0;
}