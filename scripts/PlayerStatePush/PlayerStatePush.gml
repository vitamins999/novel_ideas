function PlayerStatePush(){
	
	global.objectCurrentlyBeingPushed = true;
	
	// Calculate movement
	if (inputDirection == direction) || (inputDirection == direction - 180) || (inputDirection == direction + 180)
	{
		hSpeed = lengthdir_x(inputMagnitude * speedPush, inputDirection);
		vSpeed = lengthdir_y(inputMagnitude * speedPush, inputDirection);
	}
	else
	{
		hSpeed = 0;
		vSpeed = 0;
	}
	
	// Commit to movement
	PlayerCollision();
	with (grabbed)
	{
		collisionMap = other.collisionMap;
		hSpeed = other.hSpeed;
		vSpeed = other.vSpeed;
		var _gx = x + hSpeed;
		var _gy = y + vSpeed;
		grabbed = id;
		var _grabCol = PlayerCollision();
	}
	if (_grabCol)
	{
		x -= _gx - grabbed.x;
		y -= _gy - grabbed.y;
	}
	
	// Animate
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		sprite_index = spr_player_run;
	}
	else
	{
		sprite_index = spr_player;
	}
	if (_oldSprite != sprite_index) localFrame = 0;
	PlayerAnimateSprite();
	
	// Exit state
	if (!keyActivate)
	{
		state = PlayerStateFree;
		grabbed = noone;
		global.objectCurrentlyBeingPushed = false;
	}
}