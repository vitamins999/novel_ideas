function DarkKnightDie(){
	//sprite_index = sprDie;
	image_speed = 1.0;
	
	//if (!dieAnimationStarted)
	//{
	//	image_index = startFrame;
	//	dieAnimationStarted = true;
	//}
	
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		// Collide and move
		EnemyTileCollision()
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}