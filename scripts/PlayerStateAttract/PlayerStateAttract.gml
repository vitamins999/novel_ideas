function PlayerStateAttract(){
	// State for when using the aftershave.	
	if (sprite_index != spr_player_attract)
	{
		// Set up correct animation
		sprite_index = spr_player_attract;
		localFrame = 0;
		image_index = 0;
		global.attractBeingPressed = true;
	}
	
	//Movement
	if (global.allowAttractMovement)
	{
		hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
		vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

		PlayerCollision();
	}
	
	if (input_check_released("activate"))
	{
		global.attractBeingPressed = false;
		sprite_index = spriteIdle;
		state = PlayerStateFree;
	}	
}