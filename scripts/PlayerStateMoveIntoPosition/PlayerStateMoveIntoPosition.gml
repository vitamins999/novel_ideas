function PlayerStateMoveIntoPosition(){
	if (movingWithoutPlayer)
	{
		if (x != moveToX) || (y != moveToY)
		{
			var _distanceToGo = point_distance(x, y, moveToX, moveToY);
			dir = point_direction(x, y, moveToX, moveToY);
			
			var _speedThisFrame = movingWithoutPlayerSpeed;
			if (_distanceToGo < movingWithoutPlayerSpeed) _speedThisFrame = _distanceToGo;
			
			hSpeed = lengthdir_x(_speedThisFrame, dir);
			vSpeed = lengthdir_y(_speedThisFrame, dir);
			
			var _collided = EnemyTileCollision();
		}
		else
		{
			movingWithoutPlayer = false;
		}
	}
	else
	{
		state = PlayerStateFree;
	}
}