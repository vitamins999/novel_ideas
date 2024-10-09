/// @description Entity Loop
if (!global.gamePaused)
{
	depth = -bbox_bottom;
}
flash = max(flash - 0.04, 0);

fric = 0.05;
if (z == 0) fric = 0.10;

// Magnetise
if ((instance_exists(obj_player)) && (entityAttract) && (input_check("activate")))
{	
	image_index = 1;
	
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
			spd = 0;
		}
	} 
} 
else
{
	image_index = 0;
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
spd = max(spd - fric, 0);
depth = -bbox_bottom;