function PlayerStateFree(){
	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	// Update Sprite Index
	var _oldSprite = sprite_index;

	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	}
	else
	{
		sprite_index = spriteIdle;
	}

	if (_oldSprite != sprite_index)
	{
		localFrame = 0;
	}

	// Update Image Index
	PlayerAnimateSprite();

	//Attack Key Logic
	if (keyAttack)
	{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
	
	//Activate Key Logic
	if (keyActivate)
	{
		if (currentlyEquippedItem == "aftershave")
		{
			state = PlayerStateAttract;
		}
	}
}